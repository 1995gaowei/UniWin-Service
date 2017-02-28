<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">

<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>

<jsp:include page="../../header.jsp"></jsp:include>
<title>ZZL-款式采购信息</title>
<style type="text/css">
        .content{_height: 1000px;min-height:1000px;padding: 30px 25px;}
.input-group,.form-group{position: relative;float: left;width: 100%;}
.form-control{float: left;width: 100%;}
label {color: #555555;font-size: 12px; margin-left: 10px;}
#search-purchaselist{position: relative;float: left;width: 8%;height:34px;margin-left: 15px;margin-top: 23px;}
.table-responsive{margin-top: 10px;}
.table{border-top: 3px solid #7D9EC0;}
th{font-size: 12px;color: #4F4F4F;text-align: center;}
td{text-align: center;font-size:14px;}
tr{background-color:transpare}
.item-name{color:#0000ff;}
.qcCode{color:#008080;}
.commdity-graph{width: 60px;height: 80px;}
    </style>
</head>
<body class="skin-blue" onload="setDefault()">
<!-- header logo: style can be found in header.less -->
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
		<h1> 采购管理
		<small>款式采购信息</small>
        </h1>
        <ol class="breadcrumb">
        <li><a href="<%=request.getContextPath()%>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">面料采购单管理</li>
        </ol>
		</section>
		<!-- Main content -->
            <section class="content">
            	<div class="container-fluid">
            	<!-- 款式采购信息 -->
            		<div class="row">
            			<div class="col-md-12">
            			
            				<div class="row">
            					<div class="col-md-4">
									<div class="input-group">
									<span>新/老款：</span> <input id="design_name" type="text"
									class="form-control form-input" maxlength="20"
									value="${purchaseVO.designNewOld}" readonly>
									</div>
								</div>
								
								<div class="col-md-4">
									<div class="input-group">
									<span>编号：</span> <input id="design_name" type="text"
									class="form-control form-input" maxlength="20"
									value="${purchaseVO.purchaseCode}" readonly>
									</div>
								</div>
            				</div>
            				
            				<div class="row">
            					<div class="col-md-4">
									<div class="input-group">
									<span>款号：</span> <input id="design_name" type="text"
									class="form-control form-input" maxlength="20"
									value="${purchaseVO.designCode}" readonly>
									</div>
								</div>
									
								<div class="col-md-4">
									<div class="input-group">
									<span>客户姓名：</span> <input id="design_name" type="text"
									class="form-control form-input" maxlength="20"
									value="${purchaseVO.customerName}" readonly>
									</div>
								</div>
								
								<div class="col-md-4">
									<div class="input-group">
									<span>制单日期：</span> <input id="design_name" type="text"
									class="form-control form-input" maxlength="20"
									value="${purchaseVO.purDocumentDate}" readonly>
									</div>
								</div>
								
            				</div>
            				<div class="row">
            					<div class="col-md-8">
									<div class="input-group">
									<span>名称：</span> <input id="design_name" type="text"
									class="form-control form-input" maxlength="20"
									value="${purchaseVO.designName}" readonly>
									</div>
								</div>
            				</div>
            				
            			</div>
            		</div>
            		
            		<div class="row">
						<div class="col-md-2">
						<span>生产单信息：</span>
						</div>
					</div>
            		<div class="row">
            			<div class="col-md-10">
            				<div class="row">
            					<div class="table-responsive">
            						<table class="table table-striped">
	            						<tr>
										<th>颜色</th>
										<th>XS/90CM</th>
										<th>S/100CM</th>
										<th>M/110CM</th>
										<th>L/120CM</th>
										<th>XL/130CM</th>
										<th>XXL/140CM</th>
										<th>合计</th>
										</tr>
											<!-- iterator goes here and set data dynamically-->
												<s:iterator value="purchaseVO.orderDetails" var="orderDetailVO">
													<tr>
														<td><s:property value='color'/></td>
														<td><s:property value='XS'/></td>
														<td><s:property value='S'/></td>
														<td><s:property value='M'/></td>
														<td><s:property value='L'/></td>
														<td><s:property value='XL'/></td>
														<td><s:property value='XXL'/></td>
														<td><s:property value='total'/></td>
													</tr>
												</s:iterator>
            						</table>
            					</div>
            					
            				
            				</div>
            			
            			</div>
            		</div>
            		<div class="row">
            		<span>面料信息：</span>
            		</div>
            		<div class="row">
            			<div class="col-md-8">
            				<div class="row">
            					<div class="table-responsive">
            						<table class="table table-striped">
            							<tr>
										<th>部位</th>
										<th>物料编号</th>
										<th>物料名称</th>
										<th>单价</th>
										<th>主/辅料</th>
										<th>色号</th>
										<th>单件用量</th>
										<th>数量</th>
										</tr>
											<!-- iterator goes here and set data dynamically-->
												<s:iterator value="purchaseVO.materials" var="bomVO">
													<tr>
														<td><s:property value="#bomVO.materialPosition"/></td>
														<td><a href="#" onclick="fillDetailInfo('<s:property value='#bomVO.materialCode' />',<s:property value='#bomVO.vendorId' />)"><s:property value="#bomVO.materialCode"/></a></td>
														<td><s:property value="#bomVO.materialName"/></td>
														<td><s:property value="#bomVO.unitPrice"/></td>
														<td><s:property value="#bomVO.materialType"/></td>
														<td><s:property value="#bomVO.colorCode"/></td>
														<td><s:property value="#bomVO.volPerDesign"/></td>
														<td><s:property value="#bomVO.totalVol"/></td>
													</tr>
												</s:iterator>
            						</table>
            					</div>
            				</div>
            			</div>
            			<div class="col-md-4">
            				<img src="../images/1.png"class="commdity-graph">
            			</div>
            		</div>
            		<div class="row">
            			<span>面料信息：</span>
            		</div>
            		<div class="row">
            			<div class="col-md-12">
            				<div class="row">
            					<div class="col-md-2">
									<div class="input-group">
									<span>计划采购时间</span> <input id="design_name" type="text"
									class="form-control form-input" maxlength="20"
									value="${purchaseVO.scheduledPurchaseDate}" >
									</div>
								</div>
								<div class="col-md-5">
									<div class="input-group">
									<span>供应商|电话</span> <input id="design_name" type="text"
									class="form-control form-input" maxlength="20"
									value="${purchaseVO.vendors}" readonly>
									</div>
								</div>
								<div class="col-md-2">
									<div class="input-group">
									<span>负责人</span> <input id="design_name" type="text"
									class="form-control form-input" maxlength="20"
									value="${purchaseVO.userName}" >
									</div>
								</div>
            				</div>
            				<div class="row">
            					<div class="col-md-8">
									<div class="input-group">
									<span>备注</span> <input id="design_name" type="text"
									class="form-control form-input" maxlength="20"
									value="${purchaseVO.purchaseComment}" >
									</div>
								</div>
            				</div>
            			</div>
            		</div>
            		<div class="row" text-align:center>
            			<button type="button" id="returnPrevPage"class="btn btn-primary" onclick="history.go(-1);">退出</button>
            		</div>
            	</div>
            </section>
		</aside>
	</div>
	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
<div class="modal fade" id="detailModel" tabindex="-1" role="dialog" 
	    aria-hidden="true">
	   <div class="modal-dialog" style="width:800px">
	      <div class="modal-content">
	      		<div class="modal-header" style="background-color: #3c8dbc">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h5 class="modal-title" style="color: white">物料基本信息</h5>
				</div>
	         <div class="modal-header">
	            <h4 class="modal-title" >
	               基础信息：
	            </h4>
	         </div>
	         <div class="modal-body">
	           <div class="row">
	           		<div class="col-md-4">
	           			<label class="control-label">物料名称：</label><label id="materialName"></label>
	           		</div>
	           		<div class="col-md-4">
	           			<label class="control-label">物料编号：</label><label id="materialCode"></label>
	           		</div>
	           		<div class="col-md-4">
	           			<label class="control-label">物料成分：</label><label id="materialIngredient"></label>
	           		</div>
	           		
	           </div>
	           <div class="row">
	           		<div class="col-md-4">
	           			<label class="control-label">物料单价：</label><label id="unitPrice"></label>
	           		</div>
	           		<div class="col-md-4">
	           			<label class="control-label">物料类型：</label><label id="materialType"></label>
	           		</div>
	           		<div class="col-md-4">
	           			<label class="control-label">入库时间：</label><label id="materialTime"></label>
	           		</div>
	           		
	           		
	           </div>
	           <div class="row">
	           		<div class="col-md-4">
	           			<label class="control-label">色号：</label><label id="colorCode"></label>
	           		</div>
	           		<div class="col-md-4">
	           			<label class="control-label">颜色说明：</label><label id="colorDescription"></label>
	           		</div>
	           		<div class="col-md-4">
	           			<label class="control-label">出量：</label><label id="materialOutputVol"></label>
	           		</div>
	           </div>
	           <div class="row">
	           		<div class="col-md-4">
	           			<label class="control-label">供应商编码：</label><label id="vendorCode"></label>
	           		</div>
	           		<div class="col-md-4">
	           			<label class="control-label">供应商名称：</label><label id="vendorName"></label>
	           		</div>
	           		<div class="col-md-4">
	           			<label class="control-label">联系电话：</label><label id="vendorTel"></label>
	           		</div>
	           </div>
	            <div class="row">
	           		<div class="col-md-4">
	           			<label class="control-label">供应商地址：</label><label id="vendorPosition"></label>
	           		</div>
	           		
	           </div>
	           
	         </div>
	         <div class="modal-header">
		         <h4 class="modal-title" >
		              库存信息：
		         </h4>
	         </div>
	         <div class="modal-body">
	         	<div class="row">
	         		<div class="col-md-3">
	         			<label class="control-label">仓储位置：</label><label id="location"></label>
	         		</div>
	           		<div class="col-md-2">
	           			<label class="control-label">库存数量：</label><label id="remainVol"></label>
	           		</div>
	           		<div class="col-md-2">
	           			<label class="control-label">单位：</label><label id="unit"></label>
	           		</div>
	           		<div class="col-md-2">
	           			<label class="control-label">可用库存：</label><label id="remain"></label>
	           		</div>
	           		
	         	</div>
	         </div>
	         
	         <div class="modal-footer">
	            <button type="button" class="btn btn-default" 
	               data-dismiss="modal">返回
	            </button>
	         </div>
	      </div><!-- /.modal-content -->
	   </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
<script type="text/javascript">
function fillDetailInfo(materialCode, vendorId){
	params = {
			"materialCode":materialCode,
			"vendorId":vendorId
	};
	jQuery.post("/UniWin/Warehouse/getDetail",params,function(data){
		obj = eval("("+data+")");
		$('#detailModel').modal('show');
		$("#materialName").html(obj.material.materialName);
		$("#materialCode").html(obj.material.materialCode);
		$("#materialType").html(obj.material.materialType);
		$("#unitPrice").html(obj.material.unitPrice);
		$("#colorCode").html(obj.material.colorCode);
		$("#materialOutputVol").html(obj.material.outputVol);
		$("#materialTime").html(obj.material.materialTime);
		$("#colorDescription").html(obj.material.colorDescription);
		$("#materialIngredient").html(obj.material.materialIngredient);
		$("#remain").html(obj.warehouse.remain);
		$("#remainVol").html(obj.store.remainVol);
		$("#unit").html(obj.material.unit);
		$("#location").html(obj.warehouse.location);
		$("#vendorCode").html(obj.vendor.vendorId);
		$("#vendorName").html(obj.vendor.vendorName);
		$("#vendorTel").html(obj.vendor.vendorMobileNum);
		$("#vendorPosition").html(obj.vendor.vendorAddr);
	},"json");
}
</script>
</body>
</html>