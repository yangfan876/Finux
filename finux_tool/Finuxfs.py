#!/usr/bin env python

class part_table():
	status = 0
	first_head_num = 0
	first_sector_num = 0
	first_cylinder_low = 0
	system_id = 0
	end_head_num = 0
	end_sector_num = 0
	end_cylinder_low = 0
	first_LBA = 0
	sector_cnt = 0

	def __init__(self, args):
		self.status = args[0]
		self.first_head_num = args[1]
		self.first_sector_num = args[2]
		self.first_cylinder_low = args[3]
		self.system_id = args[4]
		self.end_head_num = args[5]
		self.end_sector_num = args[6]
		self.end_cylinder_low = args[7]
		self.first_LBA = args[8]
		self.sector_cnt = args[9]


class super_block():
	magic = 0
	inode_cnt = 0
	sector_cnt = 0
	inode_map_sectors = 0
	inode_map_start = 0
	sector_map_sectors = 0
	sector_map_start = 0
	inode_array_start = 0
	first_data_sector = 0
	inode_sectors = 0
	root_start = 0
	root_inode = 0
	root_sectors = 0
	inode_size = 0
	dir_ent_size = 0

	def __init__(self, args):
		self.magic = args[0]
		self.inode_cnt = args[1]
		self.sector_cnt = args[2]
		self.inode_map_sectors = args[3]
		self.inode_map_start = args[4]
		self.sector_map_sectors = args[5]
		self.sector_map_start = args[6]
		self.inode_array_start = args[7]
		self.first_data_sector = args[8]
		self.inode_sectors = args[9]
		self.root_start = args[10]
		self.root_inode = args[11]
		self.root_sectors = args[12]
		self.inode_size = args[13]
		self.dir_ent_size = args[14]


class inode():
	mode = 0
	file_size = 0
	file_start_sect = 0
	file_sector_cnt = 0

	def __init__(self, args):
		self.mode = args[0]
		self.file_size = args[1]
		self.file_start_sect = args[2]
		self.file_sector_cnt = args[3]

class dir_entry():
	inode_num = 0
	name = ''

	def __init__(self, args):
		self.inode_num = args[0]
		self.name = args[1]
