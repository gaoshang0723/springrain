<#assign myParentDir="service.impl">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>  
package ${basepackage}.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springrain.demo.service.BasedemoServiceImpl;
import ${basepackage}.entity.${className};
import ${basepackage}.service.I${className}Service;
import java.util.List;
import java.io.File;
import org.springrainframe.service.IBaseService;
import org.springrainframe.util.Page;
import org.springrainframe.util.Finder;
import org.springrainframe.entity.IBaseEntity;

<#include "/copyright_class.include" >
@Service("${classNameLower}Service")
public class ${className}ServiceImpl extends BasedemoServiceImpl implements I${className}Service {

   
	  @Override
		public String  save(Object entity ) throws Exception{
		      ${className} ${classNameLower}=(${className}) entity;
		       return (String) super.save(${classNameLower});
		}

	    @Override
		public String  saveorupdate(Object entity ) throws Exception{
		      ${className} ${classNameLower}=(${className}) entity;
			 return super.saveorupdate(${classNameLower}).toString();
		}
		
		@Override
	    public Integer update(IBaseEntity entity ) throws Exception{
		 ${className} ${classNameLower}=(${className}) entity;
		return super.update(${classNameLower});
	    }
	    @Override
		public ${className} find${className}ById(Object id) throws Exception{
		 return super.findById(id,${className}.class);
		}
		
	/**
	 * 列表查询,每个service都会重载,要把sql语句封装到service中,Finder只是最后的方案
	 * @param finder
	 * @param page
	 * @param clazz
	 * @param o
	 * @return
	 * @throws Exception
	 */
	        @Override
	    public <T> List<T> findListDataByFinder(Finder finder, Page page, Class<T> clazz,
				Object o) throws Exception{
				 return super.findListDataByFinder(finder,page,clazz,o);
				}
		/**
		 * 根据查询列表的宏,导出Excel
		 * @param finder 为空则只查询 clazz表
		 * @param ftlurl 类表的模版宏
		 * @param page 分页对象
		 * @param clazz 要查询的对象
		 * @param o  querybean
		 * @return
		 * @throws Exception
		 */
			@Override
		public <T> File findDataExportExcel(Finder finder,String ftlurl, Page page,
				Class<T> clazz, Object o)
				throws Exception {
				 return super.findDataExportExcel(finder,ftlurl,page,clazz,o);
			}
		
}
