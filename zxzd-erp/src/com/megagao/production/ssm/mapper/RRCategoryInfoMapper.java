package com.megagao.production.ssm.mapper;

import java.util.List;

import com.megagao.production.ssm.domain.RRCategoryInfo;

public interface RRCategoryInfoMapper {
    int deleteByPrimaryKey(String id);
    
    int deleteBatch(String[] ids);

    int insert(RRCategoryInfo record);

    int insertSelective(RRCategoryInfo record);

    RRCategoryInfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(RRCategoryInfo record);

    int updateByPrimaryKey(RRCategoryInfo record);
    
    List<RRCategoryInfo> find(RRCategoryInfo dailyExpense);
    List<RRCategoryInfo> findByParent(String parentId);
    
}