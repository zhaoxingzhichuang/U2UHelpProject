package com.megagao.production.ssm.controller.backstage;


import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.megagao.production.ssm.domain.RRCategoryInfo;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;
import com.megagao.production.ssm.service.CategoryNameService;

/**
 * 分类名称管理
 * @author lxt
 *
 */
@Controller
@RequestMapping("/categoryName")
public class CategoryNameController {
	
	@Autowired
	private CategoryNameService categoryService;
	
	@RequestMapping("/find")
	public String find() throws Exception{
		return "category_list";
	}
	
	@RequestMapping("/add")
	public String add() throws Exception{
		return "category_add";
	}
	
	@RequestMapping("/edit")
	public String edit() throws Exception{
		return "category_edit";
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
	public EUDataGridResult getItemList(Integer page, Integer rows, RRCategoryInfo categoryInfo) throws Exception{
		EUDataGridResult result = categoryService.getList(page, rows, categoryInfo);
		return result;
	}
	
	@RequestMapping("/parentList/{parentId}")
	@ResponseBody
	public EUDataGridResult parentList(Integer page, Integer rows, @PathParam("parentId") String parentId) throws Exception{
		
		EUDataGridResult result = categoryService.getListFashion(1, 50, parentId);
		return result;
	}
	
	@RequestMapping("/parentList")
	@ResponseBody
	public EUDataGridResult parentByList(String parentId,Integer page, Integer rows, RRCategoryInfo categoryInfo) throws Exception{
		categoryInfo.setParentId(parentId);
		EUDataGridResult result = categoryService.getListFashion(page, rows, parentId);
		return result;
	}
	
	@RequestMapping("/parentListOption/{parentId}")
	@ResponseBody
	public List<RRCategoryInfo> parentListOption(Integer page, Integer rows, RRCategoryInfo categoryInfo) throws Exception{
		
//		List<categoryInfo> result = categoryService.getAllListFashion(categoryInfo);
		return null;
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	@ResponseBody
	private CustomResult insert(@Valid RRCategoryInfo categoryInfo, BindingResult bindingResult) throws Exception {
		CustomResult result;
		if(bindingResult.hasErrors()){
			FieldError fieldError = bindingResult.getFieldError();
			return CustomResult.build(100, fieldError.getDefaultMessage());
		}
		categoryInfo.setId(UUID.randomUUID().toString());
		result = categoryService.insert(categoryInfo);
		return result;
	}
	
	@RequestMapping(value="/insertParent", method=RequestMethod.POST)
	@ResponseBody
	private CustomResult insertParent(@Valid RRCategoryInfo categoryInfo, BindingResult bindingResult) throws Exception {
		CustomResult result;
		if(bindingResult.hasErrors()){
			FieldError fieldError = bindingResult.getFieldError();
			return CustomResult.build(100, fieldError.getDefaultMessage());
		}
		result = categoryService.insertParent(categoryInfo);
		return result;
	}
	
	@RequestMapping(value="/update")
	@ResponseBody
	private CustomResult update(@Valid RRCategoryInfo categoryInfo, BindingResult bindingResult) throws Exception {
		if(bindingResult.hasErrors()){
			FieldError fieldError = bindingResult.getFieldError();
			return CustomResult.build(100, fieldError.getDefaultMessage());
		}
		return categoryService.update(categoryInfo);
	}

	@RequestMapping(value="/delete")
	@ResponseBody
	private CustomResult delete(String id) throws Exception {
		CustomResult result = categoryService.delete(id);
		return result;
	}
	
	@RequestMapping(value="/delete_batch")
	@ResponseBody
	private CustomResult deleteBatch(String[] ids) throws Exception {
		CustomResult result = categoryService.deleteBatch(ids);
		return result;
	}
}
