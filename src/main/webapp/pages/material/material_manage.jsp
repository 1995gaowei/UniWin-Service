<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">

<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>

<jsp:include page="../../header.jsp"></jsp:include>
<style type="text/css">
th {
	text-align: center;
}

td {
	text-align: center;
}
</style>

<title>ZZL</title>
</head>

<body class="skin-blue">
    <s:if test="#request.session.account!=null">
    <!-- 人物头像 -->
    <jsp:include page="../../headSculpture.jsp"></jsp:include>
    <!-- 人物头像 -->

	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- Left side column. contains the logo and sidebar -->
		<jsp:include page="../../navigation.jsp"></jsp:include>

		<!-- Right side column. Contains the navbar and content of the page -->
		<aside class="right-side"> <!-- Content Header (Page header) -->
		<section class="content-header">
		<h1>
			物料管理 <small>物料查询</small>
		</h1>
		</section> <!-- Main content --> <section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">

					<div class="box-header">
						<h3 class="box-title">物料查询</h3>
					</div>
					<!-- /.box-header -->

					<!-- 查询按钮  -->
					<div class="row">
						<!-- 查询   -->
						<div class="col-md-8">
							<!-- form start -->
							<form action="<%=request.getContextPath()%>/Material/showMaterialListByAll" method="post">
								<table style="padding: 15px; margin: 20px">
								<tr>
									<td>物料编号：</td>
									<td><input type="text" class="form-control"id="materialCode" name="materialCode" ></td>
									<td>物料名称：</td>
									<td><input type="text" class="form-control" id="materialName" name="materialName"></td>
								</tr>
								<tr>
									<td>供应商：</td>
									<td><input type="text" class="form-control" id="vendorName" name="vendorName"></td>
									<td>物料类型：</td>
									<td><select class="form-control" id="materialType" id="materialType" name="materialType"  >
											<option value="">请选择</option>
											<option value="面料">面料</option>
											<option value="辅料">辅料</option>
										</select>
									</td>
									<td width="120px">
										<button type="submit" class="btn btn-primary">查询</button>
									</td>
								</tr>
								</table>
							</form>
						</div>

						<div class="col-md-2"></div>

						<!-- 新增与修改按钮  -->
						<div class="col-md-2">
							<div class="row">
								<button type="submit" class="btn btn-primary"
									style="margin: 5px 5px 5px 75px" onclick="addMaterial()">新增</button>
							</div>
							<div class="row">
								<button type="submit" class="btn btn-warning"
									style="margin: 5px 5px 15px 75px" onclick="updateMaterial()">修改</button>
							</div>
						</div>

					</div>

					<!-- 表格  -->
					<div class="row">
						<div class="table-responsive" style="margin: 0px 50px 50px 23px">
							<table class="table table-striped">
								<tr>
									<th></th>
									<th>物料编号</th>
									<th>物料名称</th>
									<th>类型</th>
								    <th>供应商</th>
                                  <!--	   <th>库存数量</th>-->
                           <!-- 第二次修改   001----------------------- -->
                                   <th>库存数量</th>
                                   <th>仓库地址</th>
                           <!-- 第二次修改   001----------------------- -->
                                    <th>规格</th>
									<th>成分</th>
                                    
								</tr>
								<s:iterator value="PageBean.list" var="materialItem">
									<tr>
										
            <!--------第二次修改              <td><input type="radio" name="select"><input type="hidden" name="selectedID" value=${materialItem[0]}></td> -->
			<!--------第二次修改 		<td><s:property value="#materialItem.material.materialCode" /></td>   -->
			<!--------第二次修改			<td><s:property value="#materialItem.material.materialName" /></td>  -->
			<!--------第二次修改			<td><s:property value="#materialItem.material.materialType" /></td>  -->
			<!--------第二次修改		    <td><s:property value="#materialItem.vendor.vendorName" /></td>      -->
                                      <!--	   <td><s:property value="#materialItem.remainVol" /></td>-->
            <!--------第二次修改               <td><s:property value="#materialItem.material.colorDescription" /></td>  -->
			<!--------第二次修改			<td><s:property value="#materialItem.material.materialIngredient" /></td>  -->
            <!-- 第二次修改   002------------------------------------------------------------------------------ -->			                            
			                            <td><input type="radio" name="select"><input type="hidden" name="selectedID" value=${materialItem[0]}></td>
			                            <td onclick="fillDetailInfo('${materialItem[0]}','${materialItem[8]}')"><s:property value="#materialItem[0]" /></td>
			                            <td><s:property value="#materialItem[1]" /></td>
			                            <td><s:property value="#materialItem[2]" /></td>
			                            <td><s:property value="#materialItem[3]" /></td>
			                            <td><s:property value="#materialItem[4]" /></td>
			                            <td><s:property value="#materialItem[5]" /></td>
			                            <td><s:property value="#materialItem[6]" /></td>
			                            <td><s:property value="#materialItem[7]" /></td>
               <!-- 第二次修改   002------------------------------------------------------------------------------ -->	                           
									</tr>
								</s:iterator>
							
							</table>
							<!-- /.table -->
							<jsp:include page="../../page.jsp">
							<jsp:param name="action" value="showMaterialList" />
						    </jsp:include>
						</div>
						<!-- /.table-responsive -->
						<!-- 分页 -->
					</div>

					<!-- /.table-row -->
				</div>
				<!-- /.box-->
			</div>
		</div>
			
		 
 		
		</section>
	       
		
		 </aside>
	</div>
	<!-- 第二次修改004--------------------------------------------------------- -->
	<%@include file="../warehouse/public/storeDetailModal.jsp" %><%@include file="../warehouse/public/storeDetailModal.jsp" %>
     <!-- 第二次修改004--------------------------------------------------------- -->

   		<script type="text/javascript">
   		    window.onload = changeTab("10000","10003");
        	function addMaterial(){
        		location.href= getRootPath() + "/Material/showAddMaterial";
        	}
        	
        	function updateMaterial(){
        		var selectedID = $(".checked + input[name='selectedID']").val();
        		if(selectedID != null){        			
        			location.href= getRootPath() + "/Material/getMaterial?materialCode="+selectedID;     	       		         
        		}else{
        			alert("请选择");
        		}
        	}
        	
        	function getRootPath(){
                var curWwwPath = window.document.location.href;
                var pathName = window.document.location.pathname;
                var pos = curWwwPath.indexOf(pathName);
                var localhostPath = curWwwPath.substring(0, pos);
                var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
                return(localhostPath + projectName);
        	};
        	
        	///////////////第二次修改/003///////////////////////////////////////
        	function fillDetailInfo(material,warehouse){
		params = {
				"materialCode":material,
				"warehouseid":warehouse
		};
		
		jQuery.post("/UniWin/Warehouse/warehousePublicAjax_getStoreDetailInfoAjax",params,function(data){
			obj = eval("("+data+")");
			$("#materialName").html(obj.material.materialName);
			$("#materialCode").html(obj.material.materialCode);
			$("#materialType").html(obj.material.materialType);
			$("#unitPrice").html(obj.material.unitPrice);
			$("#colorCode").html(obj.material.colorCode);
			$("#colorDescription").html(obj.material.colorDescription);
			$("#materialIngredient").html(obj.material.materialIngredient);
			$("#remain").html(obj.warehouse.remain);
			$("#remainVol").html(obj.store.remainVol);
			$("#unit").html(obj.material.unit);
			$("#location").html(obj.warehouse.location);
			vendors = obj.vendors;
			content = "";
			for(i =0;i<vendors.length;i++){
				content += ("<tr><td>"+vendors[i].vendorId+"</td><td>"+vendors[i].vendorName+"</td><td>"+vendors[i].vendorMobileNum+"</td><td>"+vendors[i].vendorAddr+"</td></tr>");
			}
			$("#vendors").html(content);
			
		},"json");
		$('#detailModel').modal('show');
	}
      	
        	//////////////第二次修改/003/////////////////////////////////////////////
    	</script>

</s:if>
<s:else>
    <jsp:include page="../../login.jsp"></jsp:include>
</s:else>

</body>
</html>