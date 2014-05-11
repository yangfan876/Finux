#!/usr/bin/ env python

from Finuxfs import *
import struct
import sys
import os

part_table_start = 0x1be
part_table_end = 0x1fe
Finux_first_LBA = 0
primary = []
logical = []
Finux_part = None

if  __name__ == '__main__':
	hd = open(sys.argv[1], 'rb+')
else:
	hd = open('hd.hdimg', 'rb+')

def find_part_table():

	mbr = hd.read(512)
	part = []

	#find the primary part table in the mbr
	for local in range(part_table_start, part_table_end, 0x10):
		part.append(mbr[local:local+0x10])


	for local in part:
		table = part_table((struct.unpack("8B2I", local)))
		if table.system_id == 0x5:								#find the logical part
			logical.append(table)
		elif table.system_id == 0xd:							#find the Finux part
			return (table)
		elif table.system_id == 0:								#this is a empty part
			continue
		primary.append(table)

	if len(logical) == 0:										#if hd have no logical part then return
		return None

	for i in range(10):													#logical partation have ten part at most
		#if hd have logical part then read the logical part table
		if logical[-1].system_id == 0x5:
			hd.seek(logical[-1].first_LBA* 512)

		logic_part = hd.read(512)
		part = []

		#find the logical part table in the logical partation

		for local in range(part_table_start, part_table_start + 0x20, 0x10):
			part.append(logic_part[local:local+0x10])

		for local in part:
			table = part_table((struct.unpack("8B2I", local)))
			if table.system_id == 0:
				break
			elif table.system_id == 0xd:
				return (table, logical[-1], logical[0])
			else:
				logical.append(table)

def get_super_block(baseLBA):
	hd.seek((baseLBA + 1) * 512)
	superblock = hd.read(15 * 4)
	superblock = struct.unpack("15I", superblock)
	print superblock
	superblock = super_block(superblock)
	return superblock

def display_SB(superblock):
	print 'SuerpBlock information:'
	print '\tmagic              %s' % superblock.magic
	print '\tinode_cnt          %s' % superblock.inode_cnt
	print '\tsector_cnt         %s' % hex(superblock.sector_cnt)
	print '\tinode_map_sectors  %s' % hex(superblock.inode_map_sectors)
	print '\tinode_map_start    %s' % hex(superblock.inode_map_start)
	print '\tsector_map_sectors %s' % hex(superblock.sector_map_sectors)
	print '\tsector_map_start   %s' % hex(superblock.sector_map_start)
	print '\tinode_array_start  %s' % hex(superblock.inode_array_start)
	print '\tfirst_data_sector  %s' % hex(superblock.first_data_sector)
	print '\tinode_sectors      %s' % hex(superblock.inode_sectors)
	print '\troot_start         %s' % hex(superblock.root_start)
	print '\troot_inode         %s' % hex(superblock.root_inode)
	print '\troot_sectors       %s' % hex(superblock.root_sectors)
	print '\tinode_size         %s' % hex(superblock.inode_size)
	print '\tdir_ent_size       %s' % hex(superblock.dir_ent_size)


def get_inode_array(superblock):
	hd.seek(superblock.inode_array_start*512)
	inode_tmp = hd.read(0x7d0)
	inode_area = []
	for i in range(superblock.inode_cnt):
		part = inode(struct.unpack("4I", inode_tmp[i*0x10:(i+1)*0x10]))
		inode_area.append(part)
	return inode_area

def write_inode_array(superblock, inode_array):

	hd.seek(superblock.inode_array_start*512)
	for i in inode_array:
		hd.write(struct.pack("4I", i.mode, i.file_size, i.file_start_sect, i.file_sector_cnt))

def display_INODE(inode):
	print 'Inode Information:'
	print  '\tmode            %s' % inode.mode
	print  '\tfile_size       %s' % hex(inode.file_size)
	print  '\tfile_start_sect %s' % hex(inode.file_start_sect)
	print  '\tfile_sector_cnt %s' % hex(inode.file_sector_cnt)

def get_inode_map(superblock):
	hd.seek(superblock.inode_map_start*512)
	inode_map = hd.read(100)

	return list(struct.unpack('100B', inode_map))

def write_inode_map(superblock, inode_map):
	hd.seek(superblock.inode_map_start*512)
	for i in inode_map:
		hd.write(struct.pack('B', i))


def get_sector_map(superblock):
	hd.seek(superblock.sector_map_start*512)
	sector_map = hd.read((superblock.sector_cnt+7)/8)
	fmt_str = '%sB' % ((superblock.sector_cnt+7)/8)

	return list(struct.unpack(fmt_str, sector_map))

def write_sector_map(superblock, sector_map):
	hd.seek(superblock.sector_map_start*512)
	for i in sector_map:
		hd.write(struct.pack('B', i))


def find_inode_in_map(inode_map, superblock):

	for i in range(100):
		if inode_map[i] == 0:
			return i


def can_use(sector_map, start, count):

	for i in range(0, count, 8):
		if sector_map[start+(i/8)] != 0:
			return False
		else:
			continue
	return True

def find_sectors_in_map(sector_map, sector_cnt):
	off_in_sector = 0
	for i in sector_map:
		if can_use(sector_map, off_in_sector, sector_cnt):
			return off_in_sector
		off_in_sector += 1
	return -1

def set_sector_map(sector_map, sector_start, sector_cnt):
	if sector_cnt > 8:
		for i in range(0, sector_cnt, 8):
			sector_map[sector_start] = 0xff
			sector_start += 1

#		sector_map[sector_start] = ((1<<((sector_cnt - i)+1))-1) << (8-(sector_cnt - i))
		tmp = (1<<(sector_cnt-i))
		tmp = tmp - 1
		tmp = tmp << (8-(sector_cnt - i))
		sector_map[sector_start] = tmp
	else:
		sector_map[sector_start] = ((1 << sector_cnt)-1) << (8-sector_cnt)
	return sector_map

def set_inode_map(inode_map, inode_num):
	inode_map[inode_num] = 1
	return inode_map

def cp_file(superblock, inode_map, sector_map, inode_array, file_entry):

	if not file_entry:
		if os.path.exists(sys.argv[3]):
			ext_file = open(sys.argv[3], 'rb+')
		else:
			print 'have no this file in disk: %s' % sys.argv[3]
			return
		inode_num = find_inode_in_map(inode_map, superblock)
		file_inode = inode_array[inode_num]
		file_inode.mode = 2		#read write
		file_inode.file_size = len(ext_file.read())
		file_inode.file_sector_cnt = \
						(file_inode.file_size+511)/512

		inode_map = set_inode_map(inode_map, inode_num)

		sector_num = find_sectors_in_map(sector_map, file_inode.file_sector_cnt)
		if sector_num == -1:
			print "no more space to load %s" % file_entry.name
			return
		file_inode.file_start_sect = superblock.first_data_sector + sector_num*8

		sector_map = set_sector_map(sector_map, sector_num, file_inode.file_sector_cnt)

		if file_entry == None:
			file_entry = dir_entry((inode_num, sys.argv[3]))

		ext_file.seek(0)
		hd.seek((superblock.first_data_sector+sector_num)*512)
		ext_file.seek(0)

		buf = ext_file.read(512)

		while len(buf) > 0:
			hd.write(buf)
			buf = ext_file.read(512)

		ext_file.close()

		return file_entry

def find_file_in_root(file_name, root_inode):
	hd.seek(root_inode.file_start_sect*512)
	for i in range(root_inode.file_sector_cnt):
		sector = hd.read(512)
		for j in range(512/16):
			entry = sector[j*0x10:(j+1)*0x10]
			if ''.join(struct.unpack("I12c", entry)[1:]) == file_name:
				return tmp_entry((struct.unpack("I12c", entry)[0], \
								''.join(struct.unpack("I12c", entry)[1:])))

	return None

def write_entry_in_root(file_entry, root_inode):
	hd.seek(root_inode.file_start_sect*512)
	for i in range(root_inode.file_sector_cnt):
		sector = hd.read(512)
		for j in range(512/16):
			entry = sector[j*0x10:(j+1)*0x10]
			tmp_file_name = ''.join(struct.unpack("I12c", entry)[1:])
			tmp_file_inode = struct.unpack("I12c", entry)[0]
			if tmp_file_name == file_entry.name or tmp_file_inode == 0:
				tmp_entry = dir_entry((file_entry.inode_num, file_entry.name))
				if len(tmp_entry.name) != 12:
					for i in range(12-len(tmp_entry.name)):
						tmp_entry.name += ' '
				sector = sector[:j*0x10] + struct.pack("I12c", tmp_entry.inode_num, tmp_entry.name[0],	\
						 tmp_entry.name[1], tmp_entry.name[2], tmp_entry.name[3], tmp_entry.name[4],\
						 tmp_entry.name[5], tmp_entry.name[6], tmp_entry.name[7], tmp_entry.name[8], \
						 tmp_entry.name[9], tmp_entry.name[10], tmp_entry.name[11]) + sector[(j+1)*0x10:]
				hd.seek(hd.tell()-512)
				hd.write(sector)
				return

if __name__ == '__main__':
	part_info = find_part_table()
	if part_info == None:
		print "can not find Finux part."
		exit()
	elif len(part_info) == 1:
		PRIMARY = 1
	elif len(part_info) == 3 and part_info[1] == part_info[-1]:
		part_base = part_info[-1].first_LBA + part_info[0].first_LBA
	elif len(part_info) == 3 and part_info[1] != part_info[-1]:
		part_base = part_info[-1].first_LBA + part_info[1].first_LBA + part_info[0].first_LBA
	else:
		print "something error about get HD part bable."
		exit()

	superblock = get_super_block(part_base)
	Finux_first_LBA = part_base
	display_SB(superblock)
	inode_array = get_inode_array(superblock)
	root_inode = inode_array[0]
	print 'Root inode info:'
	display_INODE(root_inode)
	inode_map = get_inode_map(superblock)

#	print "Inode map:\n%s" % inode_map

	sector_map = get_sector_map(superblock)
#	print sector_map

	if sys.argv[2] == 'cp':
		file_entry = find_file_in_root(sys.argv[3], root_inode)
		file_entry = cp_file(superblock, inode_map, sector_map, inode_array, file_entry)
	else:
		print sys.argv[2] + ':Finux do not suppt.'

	write_inode_array(superblock, inode_array)
	write_inode_map(superblock, inode_map)
	write_sector_map(superblock, sector_map)
	write_entry_in_root(file_entry, root_inode)
