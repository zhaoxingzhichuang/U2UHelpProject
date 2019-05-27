package com.megagao.production.ssm.controller.system;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.megagao.production.ssm.domain.authority.SysDictionary;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;
import com.megagao.production.ssm.service.DictionaryService;

/**
 * 数据字典
 * @author Jacky
 *
 */
@Controller
@RequestMapping("/dictionary")
public class DictionaryController {
	
	@Autowired
	private DictionaryService dictionaryService;
	
	@RequestMapping("/find")
	public String find() throws Exception{
		return "dictionart_list";
	}
	
	@RequestMapping("/add")
	public String add() throws Exception{
		return "dictionart_add";
	}
	
	@RequestMapping("/edit")
	public String edit() throws Exception{
		return "dictionart_edit";
	}
	@RequestMapping("/add_")
	public String add_(String id ,HttpServletRequest request) throws Exception{
		request.getSession().setAttribute("id", id);
		return "dictionart_add_";
	}
	
	@RequestMapping("/edit_")
	public String edit_() throws Exception{
		return "dictionart_edit_";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public EUDataGridResult getItemList(Integer page, Integer rows, SysDictionary sysDictionary) throws Exception{
		EUDataGridResult result = dictionaryService.getList(page, rows, sysDictionary);
		return result;
	}
	
	@RequestMapping("/parentList/{parentId}")
	@ResponseBody
	public EUDataGridResult parentList(Integer page, Integer rows, SysDictionary sysDictionary) throws Exception{
		
		EUDataGridResult result = dictionaryService.getListFashion(1, 50, sysDictionary);
		return result;
	}
	
	@RequestMapping("/parentList")
	@ResponseBody
	public EUDataGridResult parentByList(Integer parentId,Integer page, Integer rows, SysDictionary sysDictionary) throws Exception{
		sysDictionary.setParentId(parentId);
		EUDataGridResult result = dictionaryService.getListFashion(page, rows, sysDictionary);
		return result;
	}
	
	@RequestMapping("/parentListOption/{parentId}")
	@ResponseBody
	public List<SysDictionary> parentListOption(Integer page, Integer rows, SysDictionary sysDictionary) throws Exception{
		
		List<SysDictionary> result = dictionaryService.getAllListFashion(sysDictionary);
		return result;
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	@ResponseBody
	private CustomResult insert(@Valid SysDictionary sysDictionary, BindingResult bindingResult) throws Exception {
		CustomResult result;
		if(bindingResult.hasErrors()){
			FieldError fieldError = bindingResult.getFieldError();
			return CustomResult.build(100, fieldError.getDefaultMessage());
		}
		result = dictionaryService.insert(sysDictionary);
		return result;
	}
	
	@RequestMapping(value="/insertParent", method=RequestMethod.POST)
	@ResponseBody
	private CustomResult insertParent(@Valid SysDictionary sysDictionary, BindingResult bindingResult) throws Exception {
		CustomResult result;
		if(bindingResult.hasErrors()){
			FieldError fieldError = bindingResult.getFieldError();
			return CustomResult.build(100, fieldError.getDefaultMessage());
		}
		result = dictionaryService.insertParent(sysDictionary);
		return result;
	}
	
	@RequestMapping(value="/update")
	@ResponseBody
	private CustomResult update(@Valid SysDictionary sysDictionary, BindingResult bindingResult) throws Exception {
		if(bindingResult.hasErrors()){
			FieldError fieldError = bindingResult.getFieldError();
			return CustomResult.build(100, fieldError.getDefaultMessage());
		}
		return dictionaryService.update(sysDictionary);
	}

	@RequestMapping(value="/delete")
	@ResponseBody
	private CustomResult delete(Integer id) throws Exception {
		CustomResult result = dictionaryService.delete(id);
		return result;
	}
	
	@RequestMapping(value="/delete_batch")
	@ResponseBody
	private CustomResult deleteBatch(String[] ids) throws Exception {
		CustomResult result = dictionaryService.deleteBatch(ids);
		return result;
	}
}
