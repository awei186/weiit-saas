<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="../common/header.jsp" %>
 
			
			<!-- Main content -->
			<div class="content-wrapper">
				<!-- Page header -->
				<div class="page-header" >
					<div class="page-header-content">
						<div class="page-title" style="height:70px;padding-top:20px;">
							<h4>
								<i class="icon-arrow-left52 position-left"></i> <span
									class="text-semibold"> 商户列表 </span>
							</h4>
						</div>
					</div>  
				</div>
				<!-- /page header -->

				<!-- Content area -->
				<div class="content">
				
					<div class="row">
						<div class="col-md-12">
							<!-- 表单验证开始 -->
							<div class="panel panel-flat"> 
								<div class="panel-body">
								<form class="form-horizontal" id="infoForm" name="infoForm" action="${pageContext.request.contextPath}/center/shop/shopMerchantSave" method="POST" >
									<fieldset class="content-group">
										<legend class="text-bold" style="padding-top:0px;"><h5>商户账号创建</h5></legend>
										<div class="form-group">
											<label class="control-label col-sm-2 text-right"> <span class="text-danger">*</span>手机账号： </label>
											<div class="col-sm-2">
												<input type="text" class="form-control  validate[required,custom[mobilephone]]" name="account" id="account" 
													data-errormessage-value-missing="登录账号不能为空" value="">
											</div>
										</div>
										<!-- 
										<div class="form-group">
											<label class="control-label col-sm-2 text-right"> <span class="text-danger">*</span>登录密码： </label>
											<div class="col-sm-2">
												<input type="password" class="form-control  validate[required]" name="password" id="password" 
													data-errormessage-value-missing="登录密码不能为空" value="">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2 text-right"> <span class="text-danger">*</span>确认密码： </label>
											<div class="col-sm-2">
												<input type="password" class="form-control validate[required,equals[password]]" name="password22" id="password22" 
													data-errormessage-value-missing="确认密码不能为空" data-errormessage-equals-error="确认密码不一致"  value="">
											</div>
										</div> -->
										<div class="form-group">
								      		<label class="col-sm-2 control-label text-right">请选择版本套餐：</label>
								      		<div class="col-sm-8">
								      			<!-- 套餐选择 -->
												<div class="row">
													<c:forEach items="${versionList}" var="info" varStatus="ind">
													<div class="col-md-4">
														<div class="panel" style="width:300px;height:500px;">
															<div class="panel-body text-center">
																<div style="height:50px;"><h5 class="text-semibold">${info.version_name}</h5></div> 
																<div class="icon-object border-blue text-blue"><i class="icon-store"></i></div>
																
																<div class="mb-15 text-muted" style="height:200px;">
																	${info.version_desc }
																</div>
																<label class="radio-inline"> 
																<input type="radio" class="styled validate[required]" name="version_num"  value="${info.version_num }" price='${info.sale_price }'  ${ind.index==2?'checked':'' }>
																<span class="badge badge-success pull-right">￥${info.sale_price } /1年期</span><br><br>
																<span class="badge badge-warning pull-right"><del>￥${info.smarket_price } /1年期</del></span><br>
																</label>
															</div>
														</div>
													</div>
													</c:forEach>
												</div>
					                    	</div>
					                    </div> 
					                    
					                    <div class="form-group">
											<label class="control-label col-sm-2 text-right">订购时长 </label><!-- 服务商（渠道商）只支持按年缴费 -->
											<div class="col-sm-2">
												<select class="select" name="order_time" id="order_time">
													<c:forEach items="${orderTimeList }" var="time">
														<c:if test="${time.order_time_name=='12_month' or time.order_time_name=='24_month' or time.order_time_name=='36_month'}">
															<option value="${time.order_time_discount }-${time.order_time_name}-${time.day}">
																<c:if test="${time.order_time_name=='7_day' }">7天试用</c:if>
																<c:if test="${time.order_time_name=='1_month' }">1个月</c:if>
																<c:if test="${time.order_time_name=='6_month' }">6个月</c:if>
																<c:if test="${time.order_time_name=='12_month' }">1年期</c:if>
																<c:if test="${time.order_time_name=='24_month' }">2年期</c:if>
																<c:if test="${time.order_time_name=='36_month' }">3年期</c:if>
															</option>
														</c:if>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2 text-right"></label>
											<div class="col-sm-4">
												<h4><span class="text-orange text-bold" id="total_price_span">￥0.00</span></h4>
											</div>
										</div>
					                   <!-- 
					                   <div class="form-group">
											<label class="control-label col-sm-2 text-right"> 描述： </label>
											<div class="col-sm-4">
												<textarea name="description" class="form-control" id="description" rows="4" cols="60"></textarea>
											</div>
										</div> --> 
										<div class="alert alert-primary no-border">
											<button type="button" class="close" data-dismiss="alert">
												<span>&times;</span><span class="sr-only">关闭</span>
											</button>
											<span class="text-semibold">
												温馨提醒：<br>
												1、服务商(渠道商)创建商户时，同一个手机号码只能创建一个商户，所以商户的账户必须是商户自身的手机号。<br>
												2、商户创建时不需要填写密码信息，密码会发往到创建商户时填写的手机号码上。<br>
												3、选择系统版本时需要注意版本功能说明，版本上所述价格为渠道价格.<br>
												4、选择订购时长时，会在渠道价的基础上面再享受折扣。<br>
											</span>
												<span class="text-warning">注意：商户创建后，系统版本不可更改，如需更改需要商户主动自己更改版本，</span>。 
										</div>
									</fieldset> 
									<div class="text-center">
										<input type="hidden" name="total_price" id="total_price" value=""/>
										<input type="hidden" name="last_balance" id="last_balance" value="${sessionScope.last_balance }"/>
										<span class="text-danger text-bold" id="error"></span>
										<button type="button" id="buttonsave" onclick="saveButton()" class="btn btn-primary">开通服务</button>
										&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:history.back(-1)" id="qua1" class="btn btn-default" >返回<i class="icon-undo2 position-right"></i></a>	
									</div>
								</form>
								</div>
							</div>
							<!-- /form validation -->
						</div>
					 </div>
					
					
				</div>
				<!-- /content area -->
				
			</div>
			
			<!-- /main content -->
			<%@include file="../common/footer.jsp" %>
<script> 
$(document).ready(function() { 
	
	/*默认监听表单onbulr验证*/
	$('#infoForm').validationEngine("attach",{ 
		promptPosition: 'bottomRight', 
		addPromptClass: 'blackPopup formError-small',
		scroll: true,
		showOneMessage: true
	}); 
	
  	//初始把选中的套餐的价格计算一遍
  		var order_time_discount=parseFloat($("#order_time").val().split('-')[0]);//折扣
		var count=parseFloat($("#order_time").val().split('-')[2]);//天数
		
		var price = $("input[name=version_num]:checked").attr("price");
		var quantity = order_time_discount*count/366/10;
		var needPay = Math.floor(parseFloat(price*100 * quantity))/100;
		$("#total_price_span").html("￥"+parseFloat(needPay).toFixed(2)+"元");
		
      	$("#total_price").val(parseFloat(needPay).toFixed(2));
  	 
	//切换套餐时计算总价
	$("input[name=version_num]").click(function (e) {
		var order_time_discount=parseFloat($("#order_time").val().split('-')[0]);//折扣
		var count=parseFloat($("#order_time").val().split('-')[2]);//天数
		
		var price = $("input[name=version_num]:checked").attr("price");
		var quantity = order_time_discount*count/366/10;
		var needPay = Math.floor(parseFloat(price*100 * quantity))/100;
		$("#total_price_span").html("￥"+parseFloat(needPay).toFixed(2)+"元");
		
      	$("#total_price").val(parseFloat(needPay).toFixed(2));
    });
	
	//切换订购时长时计算总价
	$("#order_time").change(function (e) {
		var order_time_discount=parseFloat($("#order_time").val().split('-')[0]);//折扣
		var count=parseFloat($("#order_time").val().split('-')[2]);//天数
		
		var price = $("input[name=version_num]:checked").attr("price");
		var quantity = order_time_discount*count/366/10;
		var needPay = Math.floor(parseFloat(price*100 * quantity))/100; 
		$("#total_price_span").html("￥"+parseFloat(needPay).toFixed(2)+"元");
		
      	$("#total_price").val(parseFloat(needPay).toFixed(2));
    });
	
});

function saveButton(){
	$("#buttonsave").attr("disabled", true);
	
	if(!$("#infoForm").validationEngine("validate")){
		$("#buttonsave").removeAttr("disabled");
		return false;
	}
	if(parseFloat($("#last_balance").val())>parseFloat($("#total_price").val())){
		MConfirm("商户开通后您的费用将会被扣除 ，确定开通吗?",'','',function(result) {
			if(result){
				FullScreenShow("数据提交中，请稍后！");
				$("#infoForm").submit();
			}
		});
		
	}else{
		MAlert('您的余额不足，请先充值');
		$("#error").html("您的余额不足，请先充值");
	}
	
}
 
</script>
			
