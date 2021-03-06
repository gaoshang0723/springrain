${r"<#escape x as x?html>"}
${r"<@h.commonHead"} title="后台管理系统" keywords="开源,永久免费" description="springrain开源系统管理后台"/>

<#assign className = table.className>   
<#assign tableName = table.tableAlias>   
<#assign classNameLower = className?uncap_first>  
<#assign classNameLowerCase = className?lower_case>
<#assign from = basepackage?last_index_of(".")>
<#assign rootPagefloder = basepackage?substring(basepackage?last_index_of(".")+1)>

<script>
	jQuery(function(){ 
		/*
		全选、反选
		*/
		jQuery("#checkAll").bind('click',function(){
			var _is_check=jQuery(this).get(0).checked;
			jQuery("input[name='check_li']").each(function(_i,_o){
				jQuery(_o).get(0).checked=_is_check;
			});
		});
	});
	function del(_id){
		springrain.mydelete(_id,"${r"${ctx}"}/${classNameLowerCase}/delete");
	}
</script>

</head>
<body>
	<div class="layui-layout layui-layout-admin">
		${r"<@h.naviHeader />"}${r"<@h.leftMenu />"}
			<!-- 主体内容开始 -->
			<div class="layui-tab layui-tab-brief">
				<ul class="layui-tab-title site-demo-title">
		             <li class="layui-this">
		             		<i class="layui-icon">&#xe630;</i>
							<!--网站地图导航-->
		             		<span class="layui-breadcrumb" style="visibility: visible;">
							  <a href="${r"${ctx}"}">首页<span class="layui-box">&gt;</span></a>
							  <a><cite>${tableName}管理</cite></a>
							</span>
		             </li>
					 <li style="float:right;">
		             	${r"<@shiro.hasPermission"} name="/${classNameLowerCase}/update" >
		             		<button type="button" class="layui-btn layui-btn-small" data-action="${r"${ctx}"}/${classNameLowerCase}/update/pre"><i class="layui-icon layui-icon-specil">&#xe61f;</i>新增</button>
		             	${r"</@shiro.hasPermission>"}
		             	${r"<@shiro.hasPermission"} name="/${classNameLowerCase}/list/export" >
				        	<button type="button" class="layui-btn layui-btn-small"><i class="layui-icon layui-icon-specil">&#xe609;</i>导出</button>
				        ${r"</@shiro.hasPermission>"}
		                <button type="button" class="layui-btn layui-btn-warm layui-btn-small"><i class="layui-icon layui-icon-specil">&#xe601;</i>导入</button>
		                ${r"<@shiro.hasPermission"} name="/${classNameLowerCase}/delete" >
		               		 <button type="button" class="layui-btn layui-btn-danger layui-btn-small"><i class="layui-icon">&#xe640;</i>批量删除</button>
		                ${r"</@shiro.hasPermission>"}
		             </li>
	       		</ul>
				
				<div class="layui-body layui-tab-content site-demo-body">
					<div class="layui-tab-item layui-show">
							<div class="layui-main">
						          <div id="LAY_preview">
						          <!-- 查询  开始 -->
							          <form class="layui-form layui-form-pane" id="searchForm" action="${r"${ctx}"}/${classNameLowerCase}/list" method="post">
							          <input type="hidden" name="pageIndex" id="pageIndex" value="${r"${(returnDatas.page.pageIndex)!'1'}"}" /> 
							          <input type="hidden" name="sort" id="page_sort" value="${r"${(returnDatas.page.sort)!'desc'}"}" />
							          <input type="hidden" name="order" id="page_order" value="${r"${(returnDatas.page.order)!'id'}"}" />
									  <table class="layui-table">
							          	<tbody>
							          		<tr>
							          			<th>${tableName}搜索</th>
							          		</tr>
							          		<tr>
							          			<td>
							          				<div class="layui-inline">
									                    <label class="layui-form-label">名称</label>
									                    <div class="layui-input-inline">
									                           <input type="text" name="name" value="${r"${(returnDatas.queryBean.name)!''}"}" placeholder="请输入名称 " class="layui-input">
									                    </div>
							                		</div>
									                 <div class="layui-inline">
									                    <label class="layui-form-label">是否可用</label>
									                    <div class="layui-input-inline">
									                        <select name="active" id="active" class="layui-input">
									                          <option value="">==请选择==</option>
															  <option value="1">是</option>
															  <option value="0">否</option>
															</select>   
									                    </div>
									                </div>
									                <div class="layui-inline">
									                    <button class="layui-btn"><i class="layui-icon" style="top:4px;right:5px;">&#xe615;</i>搜索</button>
									                </div>
							          			</td>
							          		</tr>
							          	</tbody>
							          </table>
									  <!-- 查询  结束 -->
									
									<!--start_export-->
									<table class="layui-table" lay-even>
										  <colgroup>
										    <col width="40">
										    <col width="120">
										    <col>
										  </colgroup>
										  <!--end_no_export-->
										  <!--first_start_export-->
											<thead>
												<tr>
													<th colspan="9">${tableName}列表</th>
												</tr>
												<tr>
												  <!--first_start_no_export-->
												  <th class="center">
														<label class="position-relative">
															<input id="checkAll" class="ace" type="checkbox">
														</label>
												  </th>
												  <th>操作</th>
												  <!--first_end_no_export-->
												  	<#list table.columns as column>
														<#if !column.pk>
														<th id="th_${column.columnNameFirstLower}" >${column.columnAlias}<i class="layui-icon sort-icon-up sort-icon">&#xe619;</i><i class="layui-icon sort-icon-down sort-icon">&#xe61a;</i></th>
														</#if>
													</#list>	
												</tr> 
											</thead>
										  <!--first_end_export-->
										  <!--start_export-->
										   <tbody>
										    ${r"<#if"} (returnDatas.data??)&&(returnDatas.data?size>0)> 
										    	${r"<#list"}	returnDatas.data as _data>
										    		<!--start_no_export-->
													<tr class="">
														<td class="center">
															<label class="position-relative">
																<input name="check_li" value="${r"${_data.id}"}" class="ace" type="checkbox"> <span class="lbl"></span>
															</label>
														</td>
														<td>
															${r"<@shiro.hasPermission"} name="/${classNameLowerCase}/update" >
								                           		 <a href="${r"${ctx}"}/${classNameLowerCase}/update/pre?id=${r"${(_data.id)!''}"}" class="layui-btn layui-btn-normal layui-btn-mini">编辑</a>
								                            ${r"</@shiro.hasPermission>"}
								                            ${r"<@shiro.hasPermission"} name="/${classNameLowerCase}/delete" >
								                            	<a href="javascript:del('${r"${(_data.id)!''}"}')" class="layui-btn layui-btn-danger layui-btn-mini ajax-delete">删除</a>
								                            ${r"</@shiro.hasPermission>"}
														</td>
														<!--end_no_export-->
														<#list table.columns as column>
														<#if !column.pk>
														<td >
															<#if column.isDateTimeColumn>
															<!--日期型-->
																<#assign columnDataValue = "((_data."+column.columnNameFirstLower+")?string('yyyy-MM-dd'))!''"> 
														${r"${"}${columnDataValue}${r"}"}
															<#elseif column.javaType == 'java.lang.Boolean'>
																<!--布尔型-->
																<#assign columnBooleanValue = "(_data."+column.columnNameFirstLower+")">
																${r'<#if'} ${columnBooleanValue}?? && ${columnBooleanValue} >
														真
																${r'<#else>'}
														假
																${r'</#if>'}
															<#elseif column.isNumberColumn>
															${r"${(_data."}${column.columnNameFirstLower}${r")!0}"}
															<#else>
															${r"${(_data."}${column.columnNameFirstLower}${r")!''}"}
															</#if>
														</td>
														</#if>
													</#list>
													</tr>
												${r"</#list>"}
											 ${r"</#if>"}
											</tbody>
										</table>
									${r"<#if"} returnDatas.page??> 
										<div id='laypageDiv'></div>
										${r"<@h.layPage"} page=returnDatas.page /> 
									${r"</#if>"}
								</div>
							</div>
						</div>
				</div>
			</div>
		<!-- 主体内容结束 -->
		${r"<@h.footer />"}
	</div>
</body>
</html>
${r"</#escape>"}