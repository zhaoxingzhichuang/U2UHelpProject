package com.megagao.production.ssm.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.megagao.production.ssm.domain.authority.SysDictionary;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;
import com.megagao.production.ssm.mapper.authority.SysDictionaryMapper;
import com.megagao.production.ssm.service.DictionaryService;

@Service
public class DictionaryServiceImpl implements DictionaryService {

	
	@Autowired
	private SysDictionaryMapper dictionaryMapper;
	@Override
	public List<SysDictionary> find() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EUDataGridResult getList(int page, int rows,
			SysDictionary sysDictionary) throws Exception {
		// TODO Auto-generated method stub
		//查询商品列表
		SysDictionary example = new SysDictionary();
		//分页处理
		PageHelper.startPage(page, rows);
		example.setType("THEME");//查询父节点
		List<SysDictionary> list = dictionaryMapper.find(example);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<SysDictionary> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Override
	public EUDataGridResult getListFashion(int page, int rows,
			SysDictionary sysDictionary) throws Exception {
		// TODO Auto-generated method stub
		//查询商品列表
		//SysDictionary example = new SysDictionary();
		//分页处理
		PageHelper.startPage(page, rows);
		List<SysDictionary> list = dictionaryMapper.findByParent(sysDictionary.getParentId());
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<SysDictionary> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	@Override
	public List<SysDictionary> getAllListFashion(SysDictionary sysDictionary) throws Exception {
		List<SysDictionary> list = dictionaryMapper.findByParent(sysDictionary.getParentId());
		return list;
	}

	@Override
	public SysDictionary get(int string) throws Exception {
		// TODO Auto-generated method stub
		return dictionaryMapper.selectByPrimaryKey(string);
	}

	@Override
	public CustomResult delete(int string) throws Exception {
		// TODO Auto-generated method stub
		SysDictionary dictionary = dictionaryMapper.selectByPrimaryKey(string);
		
		int i = dictionaryMapper.deleteByPrimaryKey(string);
		if(i>0){
			return CustomResult.ok();
		}else{
			return null;
		}
	}

	@Override
	public CustomResult deleteBatch(String[] ids) throws Exception {
		// TODO Auto-generated method stub
		int i = dictionaryMapper.deleteBatch(ids);
		if(i>0){
			return CustomResult.ok();
		}else{
			return null;
		}
	}

	@Override
	public CustomResult insert(SysDictionary sysDictionary) throws Exception {
		// TODO Auto-generated method stub
		sysDictionary.setType("THEME");//保存父节点
		sysDictionary.setDeleteId("00");
		int i = dictionaryMapper.insert(sysDictionary);
		if(i>0){
			return CustomResult.ok();
		}else{
			return CustomResult.build(101, "新增数据信息失败");
		}
	}
	
	@Override
	public CustomResult insertParent(SysDictionary sysDictionary) throws Exception {
		// TODO Auto-generated method stub
		sysDictionary.setType("ITEM");//保存子节点
		sysDictionary.setDeleteId("00");
		int i = dictionaryMapper.insert(sysDictionary);
		if(i>0){
			return CustomResult.ok();
		}else{
			return CustomResult.build(101, "新增数据信息失败");
		}
	}

	@Override
	public CustomResult update(SysDictionary sysDictionary) throws Exception {
		// TODO Auto-generated method stub
		int i = dictionaryMapper.updateByPrimaryKeySelective(sysDictionary);
		if(i>0){
			return CustomResult.ok();
		}else{
			return CustomResult.build(101, "修改数据信息失败");
		}
	}

	@Override
	public CustomResult updateAll(SysDictionary sysDictionary) throws Exception {
		// TODO Auto-generated method stub
		int i = dictionaryMapper.updateByPrimaryKey(sysDictionary);
		if(i>0){
			return CustomResult.ok();
		}else{
			return CustomResult.build(101, "修改数据信息失败");
		}
	}

}
