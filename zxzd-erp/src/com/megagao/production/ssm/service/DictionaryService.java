package com.megagao.production.ssm.service;

import java.util.List;

import com.megagao.production.ssm.domain.authority.SysDictionary;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;

public interface DictionaryService {

	List<SysDictionary> find() throws Exception;
	
	EUDataGridResult getList(int page, int rows, SysDictionary sysDictionary) throws Exception;
	
	EUDataGridResult getListFashion(int page, int rows, SysDictionary sysDictionary) throws Exception;
	
	SysDictionary get(int string) throws Exception;
	
	CustomResult delete(int string) throws Exception;

	CustomResult deleteBatch(String[] ids) throws Exception;

	CustomResult insert(SysDictionary sysDictionary) throws Exception;

	CustomResult insertParent(SysDictionary sysDictionary) throws Exception;
	
	//更新部分字段，用的是updateSelective判断非空的字段进行更新
    CustomResult update(SysDictionary sysDictionary) throws Exception;
    
    //更新全部字段，不判断非空，直接进行更新
    CustomResult updateAll(SysDictionary sysDictionary) throws Exception;
    
    List<SysDictionary> getAllListFashion(SysDictionary sysDictionary) throws Exception;
    
}
