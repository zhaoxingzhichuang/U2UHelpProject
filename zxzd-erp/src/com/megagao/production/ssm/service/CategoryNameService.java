package com.megagao.production.ssm.service;

import java.util.List;

import com.megagao.production.ssm.domain.RRCategoryInfo;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;

public interface CategoryNameService {

	List<RRCategoryInfo> find() throws Exception;
	
	EUDataGridResult getList(int page, int rows, RRCategoryInfo categoryInfo) throws Exception;
	
	RRCategoryInfo get(String id) throws Exception;
	
	CustomResult delete(String id) throws Exception;

	CustomResult deleteBatch(String[] ids) throws Exception;

	CustomResult insert(RRCategoryInfo categoryInfo) throws Exception;

	CustomResult insertParent(RRCategoryInfo categoryInfo) throws Exception;
	
	//更新部分字段，用的是updateSelective判断非空的字段进行更新
    CustomResult update(RRCategoryInfo categoryInfo) throws Exception;
    
    //更新全部字段，不判断非空，直接进行更新
    CustomResult updateAll(RRCategoryInfo categoryInfo) throws Exception;
    
	EUDataGridResult getListFashion(int page, int rows, String parentId) throws Exception;
    
}
