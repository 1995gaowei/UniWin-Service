<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    
    <!-- css,js 引包 -->
    <jsp:include page="../../header.jsp"></jsp:include>

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
            
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header">
                                <h3 class="box-title">物料申请</h3>
                            </div>
                         <form  method="post" action="Material/showMaterialListByCND">
									<div class="form-group">
										 <table>
										 <tr>
										 <td> 
										 物料编号：
										 </td>
                                         <td>  
                                          <input type="text" class="form-control" name="materialCode" id="materialCode">
										     </td>
										     <td>
										    物料名称：
										     </td>
										     <td>
										     <input type="text" class="form-control" name="materialName" id="materialName">
										     </td>
										     <td>
										   款号：
	                                         </td>
	                                         <td>
	                                         <input type="text" class="form-control" name="designCode" id="designCode">
	                                         </td>                 
	                                         <td>
										     <button type="submit" class="btn btn-primary"
											>查询</button>
											 </td>
											 </tr>
	                                         </table>  
									  </div>
							     </form>
	<!-- 此处action为止 -->				
					           <br>
					           <br>    
					                <div class="row">
                                         <div class="table-responsive" style="margin: 0px 50px 50px 23px">
                                         <table>
                                      <tr><td> 面辅料详情>></td><td>
                                       <button type="button" class="btn btn-warning"
									   style="margin: 5px 5px 5px 75px" data-toggle="modal" onclick="showMaterial()">详情</button></td>
									   </tr>
                                      </table>
					                                    <table class="table" onselectstart="return false">
					                                        <tr >
					                                            <th></th>
					                                            <th>物料编码</th>
					                                            <th>物料名称</th>
					                                            <th>存储位置</th>
					                                            <th>库存数</th>
					                                            <th>可用库存数</th>
					                                            
					                                            
					                                            
					                                            
					                                        </tr>       
					                                        <form>                                
					                                        <s:iterator value="pageBean.list" id="mnv">
					                                        <tr class="click" style="cursor:pointer">
					                                            <td><input type="radio" name="select">
											                    <input type="hidden" name="material" value="<s:property value='#mnv.material.materialCode'/>"></td>
					                                            <td><s:property value="#mnv.material.materialCode" /></td>
					                                            <td><s:property value="#mnv.material.materialName" /></td>
					                                            <td><s:property value="#mnv.warehouse.location" /></td>
					                                            <td><s:property value="#mnv.remainVol+#mnv.frozenVol" /></td>
					                                            <td><s:property value="#mnv.remainVol" /></td>
					<!-- 此处预定出仓数需要改 -->                      
					                                          <!-----  <td><s:property value="#mnv.materialType" /></td>
																       <td><s:property value="#mnv.vendor.vendorName" /></td>  -->
 <!--此处需要添加超链接，且链接页面可以参照入库单管理的物料详情 storeDetailModal.jsp-->
					 <!--此处用隐藏框传递materialCode，待验证 .已验证，不用此方法-->       
					                                           
					                                        </tr>
					                                        
					                                        </s:iterator>
					                                        <br/><br/><br/>
	                                                      </form>   
					                                    </table>
					                                    
					                                </div>
					                            </div>
					                            <div class="row">
					                                
					                                <div class="table-responsive" style="margin: 0px 50px 50px 23px">
					                                <p style="font-size:17px;">库存信息</p>
					                                <form action="Material/addMaterialapply" method="post">
					                                    <table class="table" onselectstart="return false">
					                                    <tr>
					                                    <td>预定单号</td>
					                                    <td> <input type="text" class="form-control" name="materialApplyCode"></td>
					                                    <td>物料编码</td>
					                                    <td> <input type="text" class="form-control" name="materialCode"></td>
					                                    <td>预定出仓数量</td>
					                                    <td> <input type="text" class="form-control" name="materialApplyVol" ></td>
					                                    <td>预定出仓时间</td>
					                                    <td> <input type="text" class="form-control" name="materialApplyDate" readonly></td>
					                                    <td>备注</td>
					                                    <td> <input type="text" class="form-control" name="applyComment"></td>
					                                    </tr>
					                                    <tr>
					                                    <td><button  class="btn btn-primary" style="float:right;margin-right:10px"  type="submit">确定</button></td>
					                                    <td><button  class="btn btn-primary" style="float:right;margin-right:100px" onclick="showAddMaterialSelect()">退出</button></td>
					                                    </tr>
					                                    </table>
					                                    </form>
					                               </div>
					                            </div>
					                            </form>
					                           
                        </div>
                    </div>
                </div>
                
             
            </section>
        </aside>
    </div>
    <!-- 模态框（Modal） -->
	<div class="modal fade" id="MaterialDetail" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 300px; width: 820px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">物料详情</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
					</div>

								<div class="table-responsive" style="margin: 0px 50px 50px 25px;">
                                    <table class="table table-striped">
                                    	<input type="hidden" name="detail" id="detail">
                                        <tbody>
                                        <tr>
                                            <td><label>物料编号</label></td>
                                            <td><input type="text" class="form-control" id="materialCode" name="materialCode" disabled="true"></td>
                                            <td><label>物料名称</label></td>
                                            <td><input type="text" class="form-control" id="materialName" name="materialName" disabled="true"></td>
                                        </tr>
                                        <tr>
                                            <td><label>物料类型</label></td>
                                            <td><input type="text" class="form-control" id="materialType" name="materialType" disabled="true"></td>
                                            <td><label>色号</label></td>
                                            <td><input type="text" class="form-control" id="colorCode" name="colorCode" disabled="true"></td>
                                        </tr>
                                        <tr>
                                            <td><label>颜色说明</label></td>
                                            <td><input type="text" class="form-control" id="colorDescription" name="colorDescription" disabled="true"></td>
                                            <td><label>物料成分</label></td>
                                            <td><input type="text" class="form-control" id="materialIngredient" name="materialIngredient" disabled="true"></td>
                                        </tr>
                                        <tr>
                                            <td><label>单价</label></td>
                                            <td><input type="text" class="form-control" id="unitPrice" name="unitPrice" disabled="true"></td>
                                            <td><label>单位</label></td>
                                            <td><input type="text" class="form-control" id="unit" name="unit" disabled="true"></td>
                                        </tr>
                                        <tr>
                                            <td><label>门幅</label></td>
                                            <td><input type="text" class="form-control" id="width" name="width" disabled="true"></td>
                                            <td><label>出量</label></td>
                                            <td><input type="text" class="form-control" id="outputVol" name="outputVol" disabled="true"></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">关闭
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
    	</s:if>
		<s:else>
			<jsp:include page="../../../login.jsp"></jsp:include>
		</s:else>
		
    <script type="text/javascript">
    	window.onload = changeTab("10100","10101");
    	$(".click").click(function(){    	
    		var trlist=document.getElementsByTagName("tr");   		
    		for(i=0;i<trlist.length;i++){
    			trlist[i].bgColor="white";
    		}
    		this.bgColor="#99CCFF";
    		
    		window.location.hash="#message";
    		
    		var materialCodeAjax=$(this).children().eq(0).html();
    		var vendorNameAjax=$(this).children().eq(3).html();
    		
    		var params = {
    				"materialCodeAjax":materialCodeAjax,
    				"vendorNameAjax":vendorNameAjax
    			};
			jQuery.post("http://localhost:8888/UniWin/Warehouse/materialDetail",params,function(data){ 

				var obj=eval("("+data+")");
				$("#materialName").val(obj[0].material.materialName);
				$("#materialCode").val(obj[0].material.materialCode);
				$("#colorCode").val(obj[0].material.colorCode);
				$("#modificationDate").val(obj[0].material.modificationDate);
				$("#vendorName").val(obj[0].vendor.vendorName);
				$("#vendorMobile").val(obj[0].vendor.vendorMobile);
				$("#vendorAddr").val(obj[0].vendor.vendorAddr);
				
				$("#remainVol").val(obj[0].remainVol);
				$("#remain").val(obj[0].remain);
				
				var location=obj[0].location;
				var content="";
				for(i=0;i<location.length;i++){
					content+="<option value='"+location[i]+"'>"+location[i]+"</option>";
				}
				$("#location").html(content);
			},"json");

    	});
    	
    	function showstoreinfo(obj){
    		var locationAjax=obj.options[obj.selectedIndex].text;
    		var materialCodeAjax=document.getElementById("materialCode").value;
    		var params = {
    			"materialCodeAjax":materialCodeAjax,
				"locationAjax":locationAjax				
    			};
			jQuery.post("http://localhost:8888/UniWin/Warehouse/locationAjax",params,function(data){ 
				var obj=eval("("+data+")");
				$("#remainVol").val(obj[0].remainVol);
				$("#remain").val(obj[0].remain);
			},"json");
    	}
    	function addMaterialApply(){
                var materialCode = $("input[name='materialCode']").val();//1
                var materialapplyCode = $("input[name='materialApplyCode']").val();//2
                var materialapplyVol = $("input[name='materialApplyVol']").val();//2
                var applyComment = $("input[name='applyComment']").val();//2
                
                var url=getRootPath()+"/Material/";
                
                $.ajax({
                    url:url+"addMaterialapply",
                    data:{materialCode:materialCode,materialApplyCode:materialApplyCode,materialApplyVol:materialApplyVol,applyComment:applyComment},
                    type:"post",
                    success:function(){
                        alert("提交成功");
                        location.reload();
                    },
                    error:function(){
                        alert("提交失败");
                    }
                    
                })
            }
            function showAddMaterialSelect(){
                
                location.href= getRootPath() + "/Material/showApplySelect";
            }
            function getRootPath(){
                var curWwwPath = window.document.location.href;
                var pathName = window.document.location.pathname;
                var pos = curWwwPath.indexOf(pathName);
                var localhostPath = curWwwPath.substring(0, pos);
                var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
                return(localhostPath + projectName);
            }
    	function showMaterial(){
        		//var selectedID = $(".checked + input[name='selectedID']").val();
        		var material = $(".checked + input[name='material']").val();
        		if(material != null ){	
        			params = {
						"materialCodeAjax":material
					};

					jQuery.post("http://localhost:8888/UniWin/Material/showMaterialDetail",params,function(data){
						obj = eval("("+data+")");
						$("#materialName").val(obj.materialName);
						$("#materialCode").val(obj.materialCode);
						$("#materialType").val(obj.materialType);
						$("#colorCode").val(obj.colorCode);
						$("#colorDescription").val(obj.colorDescription);
						$("#materialIngredient").val(obj.materialIngredient);
						$("#unitPrice").val(obj.unitPrice);
						$("#unit").val(obj.unit);
						$("#width").val(obj.width);
						$("#outputVol").val(obj.outputVol);
					},"json");

        			$('#MaterialDetail').modal('show');

        		}else{
        			alert("请选择");
        		}
        	}
    	
    </script>
</body>
</html>