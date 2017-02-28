<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <jsp:include page="../../header.jsp"></jsp:include>

	<style type="text/css">
	.supplement-info {
		text-align: right;
		padding: 15px;
	}

	th {
		text-align: center;
	}
	td {
            text-align: center;
        }
	td>input {
		width: 108px;
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
        <aside class="right-side">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                   	补料单
                    <small>补料单</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li class="active">Supplement</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
            	<div class="row">
			<!-- left column -->
			<div class="col-md-12">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">物料基本信息</h3>
					</div>
					<!-- /.box-header -->
					<div class="row">
						<div class="col-md-10">
							<div class="box-body">
							
								<table style="padding: 15px; margin: 20px">
									<tr>
										<td class="supplement-info">补料类型：</td>
										<td><s:property value="supplementDetailVO.supplementType" /></td>
										<s:if test="supplementType.equals('生产单补料')">
										<td class="supplement-info">生产单号：</td>
										<td><input type="text" name="supplementDetailVO.productionCode"></td>
										</s:if>
										<td class="supplement-info">物料类型：</td>
										<td><s:property value="supplementDetailVO.materialType" /></td>
									</tr>
									<tr>
										<td class="supplement-info">补料单号：</td>
										<td><s:property value="supplementDetailVO.supplementCode" /></td>
										<td class="supplement-info">补料日期：</td>
										<td><s:property value="supplementDetailVO.supplementDate" /></td>
										<td class="supplement-info">补料人：</td>
										<td><s:property value="supplementDetailVO.userName" /></td>
									</tr>
								</table>
						
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-2">
							<span size="3px" style="margin: 0px 10px 20px 20px; color: blue">物料信息>></span>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive" style="margin: 10px 15px 20px 23px">
								<table class="table table-striped" id="tab-detail">
									<tr>
										
										<th>物料名称</th>
										<th>规格</th>
										<th>数量</th>
										<th>供应商</th>
										<th>补充用途</th>
										
									</tr>
									<tbody id="smList">
									<s:iterator value="supplementDetailVO.smList" var="smItem">
									<tr>
										
										<td id=""><a href="javascript:void(0);" onclick="showMaterialDetail();" style="color:blue;">
											<s:property value="#smItem.supply.material.materialName" />(
											<s:property value="#smItem.supply.material.colorDescription" />&nbsp;
											<s:property value="#smItem.supply.material.colorCode" />
											)
											</a><input type="hidden" name="materialName" id="materialName" value=${smItem.supply.material.materialName}>
											<input type="hidden" name="materialCode" id="materialCode" value=${smItem.supply.material.materialCode}>
											<input type="hidden" name="materialIngredient" id="materialIngredient" value=${smItem.supply.material.materialIngredient}>
											
											<input type="hidden" name="unitPrice" id="unitPrice" value=${smItem.supply.material.unitPrice}>
											<input type="hidden" name="materialType" id="materialType" value=${smItem.supply.material.materialType}>
											<input type="hidden" name="modificationDate" id="modificationDate" value=${smItem.supply.material.modificationDate}>
											
											<input type="hidden" name="colorCode" id="colorCode" value=${smItem.supply.material.colorCode}>
											<input type="hidden" name="colorDescription" id="colorDescription" value=${smItem.supply.material.colorDescription}>
											<input type="hidden" name="outputVol" id="outputVol" value=${smItem.supply.material.outputVol}>
											
											<input type="hidden" name="vendorId" id="vendorId" value=${smItem.supply.vendor.vendorId}>
											<input type="hidden" name="vendorName" id="vendorName" value=${smItem.supply.vendor.vendorName}>
											<input type="hidden" name="vendorPhoneNum" id="vendorPhoneNum" value=${smItem.supply.vendor.vendorPhoneNum}>
											<input type="hidden" name="vendorAddr" id="vendorAddr" value=${smItem.supply.vendor.vendorAddr}>
											</td>
									
										<td><s:property value="#smItem.materialSpecification" /></td>
										<td><s:property value="#smItem.materialVol" /></td>	
										<td><s:property value="#smItem.supply.vendor.vendorName" />:<s:property value="#smItem.supply.vendor.vendorPhoneNum" /></td>
										<td><s:property value="#smItem.supUsage" /></td>				
									</tr>
									</s:iterator>
									</tbody>
								</table>
								<!-- /.table -->
							</div>
							<!-- /.table-responsive -->
						</div>
					</div>
					<!-- /.table-row -->


					<div class="row">
						<div class="col-md-10">
							<div class="box-body">
								<table style="padding:10px; margin:10px">
									<tr>
										<td class="supplement-infoMore">备注信息：</td>
										<td><s:property value="supplementDetailVO.supplementComment" /></td>
										
									</tr>
									
									<tr>
										<td>
											<button type="button" class="btn btn-primary" style="margin-top: 0px" onclick="window.location='<%=request.getContextPath()%>/Supplement/supplementlist'">返回</button>
										</td>
									</tr>

								</table>
							</div>
						</div>
					</div>

				
				
				</div>
				
				<!-- /.box-->
				
			</div>
		</div>
            </section>
        </aside>
    </div>
    
 <!-- 模态框（Modal） -->
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
	           			<label class="control-label">物料名称：</label><label id="materialNameX"></label>
	           		</div>
	           		<div class="col-md-4">
	           			<label class="control-label">物料编号：</label><label id="materialCodeX"></label>
	           		</div>
	           		<div class="col-md-4">
	           			<label class="control-label">物料成分：</label><label id="materialIngredientX"></label>
	           		</div>
	           		
	           </div>
	           <div class="row">
	           		<div class="col-md-4">
	           			<label class="control-label">物料单价：</label><label id="unitPriceX"></label>
	           		</div>
	           		<div class="col-md-4">
	           			<label class="control-label">物料类型：</label><label id="materialTypeX"></label>
	           		</div>
	           		<div class="col-md-4">
	           			<label class="control-label">入库时间：</label><label id="materialTimeX"></label>
	           		</div>
	           		
	           		
	           </div>
	           <div class="row">
	           		<div class="col-md-4">
	           			<label class="control-label">色号：</label><label id="colorCodeX"></label>
	           		</div>
	           		<div class="col-md-4">
	           			<label class="control-label">颜色说明：</label><label id="colorDescriptionX"></label>
	           		</div>
	           		<div class="col-md-4">
	           			<label class="control-label">出量：</label><label id="materialOutputVolX"></label>
	           		</div>
	           </div>
	           <div class="row">
	           		<div class="col-md-4">
	           			<label class="control-label">供应商编码：</label><label id="vendorCodeX"></label>
	           		</div>
	           		<div class="col-md-4">
	           			<label class="control-label">供应商名称：</label><label id="vendorNameX"></label>
	           		</div>
	           		<div class="col-md-4">
	           			<label class="control-label">联系电话：</label><label id="vendorTelX"></label>
	           		</div>
	           </div>
	            <div class="row">
	           		<div class="col-md-4">
	           			<label class="control-label">供应商地址：</label><label id="vendorPositionX"></label>
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
	         		<div class="col-md-4">
	         			<label class="control-label">仓储位置：</label><label id="locationX"></label>
	         		</div>
	           		<div class="col-md-2">
	           			<label class="control-label">库存数量：</label><label id="remainVolX"></label>
	           		</div>
	           		<div class="col-md-2">
	           			<label class="control-label">单位：</label><label id="unitX"></label>
	           		</div>
	           		<div class="col-md-2">
	           			<label class="control-label">可用库存：</label><label id="remainX"></label>
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
        	window.onload = changeTab("10900","10903");
        	$('.date-picker').datetimepicker({
    		 	language:  'zh-CN',
    	        format : 'yyyy-mm-dd',
    	        weekStart : 1,
    	        todayBtn : 1,
    	        autoclose : 1,
    	        todayHighlight : 1,
          	  	startView : 2,
    	        minView : 2,
    	        maxView : 4,
    	        forceParse : 0,
    	    });
        	function showMaterialDetail(){
        		 var materialCode = document.getElementById('materialCode').value;	 
        		 var vendorId = document.getElementById('vendorId').value;
        	
        		 params = {
        					"materialCode":materialCode,
        					"vendorId":vendorId
        			};
        		 
        		 jQuery.post("/UniWin/Warehouse/getDetail",params,function(data){
        				obj = eval("("+data+")");
        				$('#detailModel').modal('show');
        				
        				$("#materialNameX").html(obj.material.materialName);
        				$("#materialCodeX").html(obj.material.materialCode);
        				$("#materialTypeX").html(obj.material.materialType);
        				$("#unitPriceX").html(obj.material.unitPrice);
        				$("#colorCodeX").html(obj.material.colorCode);
        				$("#materialOutputVolX").html(obj.material.outputVol);
        				$("#materialTimeX").html(obj.material.materialTime);
        				$("#colorDescriptionX").html(obj.material.colorDescription);
        				$("#materialIngredientX").html(obj.material.materialIngredient);
        				$("#remainX").html(obj.warehouse.remain);
        				$("#remainVolX").html(obj.store.remainVol);
        				$("#unitX").html(obj.material.unit);
        				$("#locationX").html(obj.warehouse.location);
        				$("#vendorCodeX").html(obj.vendor.vendorId);
        				$("#vendorNameX").html(obj.vendor.vendorName);
        				$("#vendorTelX").html(obj.vendor.vendorMobileNum);
        				$("#vendorPositionX").html(obj.vendor.vendorAddr);
        				
        			},"json");
        		
        			
        	}
 </script>
 	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
</body>
</html>