package com.megagao.production.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.megagao.production.ssm.domain.RRCategoryInfo;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;
import com.megagao.production.ssm.mapper.RRCategoryInfoMapper;
import com.megagao.production.ssm.service.CategoryNameService;

@Service
public class CategoryNameServiceImpl implements CategoryNameService {

	
	@Autowired
	private RRCategoryInfoMapper categoryInfoMapper;
	@Override
	public List<RRCategoryInfo> find() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EUDataGridResult getList(int page, int rows,
			RRCategoryInfo sysDictionary) throws Exception {
		// TODO Auto-generated method stub
		//查询商品列表
		RRCategoryInfo example = new RRCategoryInfo();
		//分页处理
		PageHelper.startPage(page, rows);
		List<RRCategoryInfo> list = categoryInfoMapper.find(example);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<RRCategoryInfo> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Override
	public EUDataGridResult getListFashion(int page, int rows,
			String parentId) throws Exception {
		// TODO Auto-generated method stub
		//查询商品列表
		//SysDictionary example = new SysDictionary();
		//分页处理
		PageHelper.startPage(page, rows);
		List<RRCategoryInfo> list = categoryInfoMapper.findByParent(parentId);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<RRCategoryInfo> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	@Override
	public RRCategoryInfo get(String id) throws Exception {
		// TODO Auto-generated method stub
		return categoryInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public CustomResult delete(String id) throws Exception {
		// TODO Auto-generated method stub
		RRCategoryInfo dictionary = categoryInfoMapper.selectByPrimaryKey(id);
		if(null != dictionary) {
			int i = categoryInfoMapper.deleteByPrimaryKey(id);
			if(i>0){
				return CustomResult.ok();
			}else{
				return null;
			}
		} else {
			return null;
		}
		
	}

	@Override
	public CustomResult deleteBatch(String[] ids) throws Exception {
		// TODO Auto-generated method stub
		int i = categoryInfoMapper.deleteBatch(ids);
		if(i>0){
			return CustomResult.ok();
		}else{
			return null;
		}
	}

	@Override
	public CustomResult insert(RRCategoryInfo sysDictionary) throws Exception {
		// TODO Auto-generated method stub
		int i = categoryInfoMapper.insert(sysDictionary);
		if(i>0){
			return CustomResult.ok();
		}else{
			return CustomResult.build(101, "新增数据信息失败");
		}
	}
	
	@Override
	public CustomResult insertParent(RRCategoryInfo sysDictionary) throws Exception {
		// TODO Auto-generated method stub
		int i = categoryInfoMapper.insert(sysDictionary);
		if(i>0){
			return CustomResult.ok();
		}else{
			return CustomResult.build(101, "新增数据信息失败");
		}
	}

	@Override
	public CustomResult update(RRCategoryInfo sysDictionary) throws Exception {
		// TODO Auto-generated method stub
		int i = categoryInfoMapper.updateByPrimaryKeySelective(sysDictionary);
		if(i>0){
			return CustomResult.ok();
		}else{
			return CustomResult.build(101, "修改数据信息失败");
		}
	}

	@Override
	public CustomResult updateAll(RRCategoryInfo sysDictionary) throws Exception {
		// TODO Auto-generated method stub
		int i = categoryInfoMapper.updateByPrimaryKey(sysDictionary);
		if(i>0){
			return CustomResult.ok();
		}else{
			return CustomResult.build(101, "修改数据信息失败");
		}
	}

}
