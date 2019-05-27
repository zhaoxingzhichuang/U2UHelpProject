package com.megagao.production.ssm.mapper.authority;

import java.util.List;

import com.megagao.production.ssm.domain.authority.SysDictionary;


public interface SysDictionaryMapper {
	
	List<SysDictionary> find(SysDictionary recosysDictionaryrd);
	
	SysDictionary selectByPrimaryKey(int id);
	
	int insert(SysDictionary sysDictionary);
	
	int updateByPrimaryKey(SysDictionary sysDictionary);
	
	int updateByPrimaryKeySelective(SysDictionary sysDictionary);
	
	void delete(int id);
	
	int deleteBatch(String[] ids);
	
	int deleteByPrimaryKey(int id);
	
	List<SysDictionary> findByParent(int parentId);

}
