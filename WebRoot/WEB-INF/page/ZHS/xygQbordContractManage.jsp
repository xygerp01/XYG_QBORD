<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8" import="java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>订单管理</title>
    <base href="<%=basePath%>">
    <meta http-equiv="content-type" content="text/html;charset=gb2312">
    <link rel="stylesheet" href="plugin/css/font-awesome.min.css">
    <link rel="stylesheet" href="plugin/css/jquery-ui.min.css">
    <link rel="stylesheet" type="text/css" href="plugin/css/public.css">
    <link rel="stylesheet" href="plugin/css/cutpic.css" type="text/css" />
    <script type="text/javascript" src="plugin/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="plugin/jQuery/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="plugin/css/jquery.datetimepicker.css">
    <script src="plugin/jQuery/jquery.datetimepicker.full.js"></script>
    <script src="plugin/js/xygdev.commons.js"></script>
    <!-- Scrollbar -->
    <link rel="stylesheet" href="plugin/mCustomScrollbar/css/jquery.mCustomScrollbar.css" type="text/css"/>
  </head>
  <body>
    <div id="container">
      <!-- 数据加载动画 start -->
      <div class="ajax_loading">
        <i class="fa fa-spinner fa-pulse fa-4x" style="color:white"></i>
      </div>
      <!-- 数据加载动画 end -->
    
      <!-- 主表格区域 start -->
      <div id="scrollbar" class="table pointer">
        <table id="main-table" data-table="OrderHeader">
          <tr>
            <th class="CONTRACT_NUMBER" data-column="db">合同号</th>
            <th class="PARTY_NAME" data-column="db">客户名称</th>
            <th class="ACCOUNT_NUMBER" data-column="db">客户账号</th>
            <th class="SALES_ORG_NAME" data-column="db">销售公司</th> 
            <th class="SHIP_FROM_ORG_NAME" data-column="db">发货组织</th> 
            <th class="CURR_CODE" data-column="db">币种</th>
            <th class="PRICE_LIST_NAME" data-column="db">价目表</th>
            <th class="ORDER_TYPE_NAME" data-column="db">订单类型</th>
            <th class="STATUS_DESC" data-column="db">状态</th>
            <th class="CREATION_DATE" data-column="db">创建日期</th>
            <th class="STATUS_BOOK_DATE" data-column="db">登记日期</th>
            <th class="STATUS_RECEIVE_DATE" data-column="db">接收日期</th>
            <th class="STATUS_CHECK_DATE" data-column="db">审核日期</th>
            <th class="STATUS_CONFIRM_DATE" data-column="db">确认日期</th>
            <th class="CUSTOMER_PO" data-column="db">客订PO</th>
            <th class="REMARKS" data-column="db">备注</th>
            <th class="ACTION" data-column="normal">操作</th> 
            <th class="HEADER_ID" style="display:none" data-column="hidden">&nbsp;</th> 
            <th class="CUSTOMER_ID" style="display:none" data-column="hidden">&nbsp;</th> 
            <th class="SALES_ORG_ID" style="display:none" data-column="hidden">&nbsp;</th> 
            <th class="SHIP_FROM_ORG_ID" style="display:none" data-column="hidden">&nbsp;</th> 
            <th class="ORG_ID" style="display:none" data-column="hidden">&nbsp;</th>    
            <th class="PRICE_LIST_ID" style="display:none" data-column="hidden">&nbsp;</th>      
          </tr>
          <tr>
            <td class="CONTRACT_NUMBER" data-column="db"></td>
            <td class="PARTY_NAME" data-column="db"></td>
            <td class="ACCOUNT_NUMBER" data-column="db"></td>
            <td class="SALES_ORG_NAME" data-column="db"></td> 
            <td class="SHIP_FROM_ORG_NAME" data-column="db"></td> 
            <td class="CURR_CODE" data-column="db"></td>
            <td class="PRICE_LIST_NAME" data-column="db"></td>
            <td class="ORDER_TYPE_NAME" data-column="db"></td>
            <td class="STATUS_DESC" data-column="db"></td>
            <td class="CREATION_DATE" data-column="db"></td>
            <td class="STATUS_BOOK_DATE" data-column="db"></td>
            <td class="STATUS_RECEIVE_DATE" data-column="db"></td>
            <td class="STATUS_CHECK_DATE" data-column="db"></td>
            <td class="STATUS_CONFIRM_DATE" data-column="db"></td>
            <td class="CUSTOMER_PO" data-column="db"></td>
            <td class="REMARKS" data-column="db"></td>
            <td class="ACTION" data-column="normal">
              <i class="fa fa-pencil fa-fw update pointer hidden" title="修改订单" data-show="true" data-reveal-id="ui" data-key="true" data-dismissmodalclass="close-ui-frame" data-crudtype="pre-update" data-preupdateurl="contract/preUpdateH.do" data-type="update" data-func="$().beforePreUpdateH()" data-updateparam=["HEADER_ID",".HEADER_ID"]></i>            
              <i class="fa fa fa-eye view pointer show_detail hidden" title="订单明细" data-show="true" data-reveal-id="detail" data-dismissmodalclass="close-detail-frame" ></i>
              <i class="fa fa-trash fa-fw pointer hidden" data-show="true" title="删除" data-refresh="refresh"  data-col="CONTRACT_NUMBER" data-crudtype="del" data-delurl="contract/deleteH.do" data-delmsg="是否删除合同号：" data-delparam=["HEADER_ID",".HEADER_ID"] ></i>
            </td>
            <td class="HEADER_ID" style="display:none" data-column="hidden">&nbsp;</td>
            <td class="CUSTOMER_ID" style="display:none" data-column="hidden">&nbsp;</td> 
            <td class="SALES_ORG_ID" style="display:none" data-column="hidden">&nbsp;</td> 
            <td class="SHIP_FROM_ORG_ID" style="display:none" data-column="hidden">&nbsp;</td> 
            <td class="ORG_ID" style="display:none" data-column="hidden">&nbsp;</td> 
            <td class="PRICE_LIST_ID" style="display:none" data-column="hidden">&nbsp;</td>      
          </tr>
        </table>
      </div>
      <!-- 主表格区域 end -->
      
      <!-- 主表格按钮区域 start -->
      <div class="table_button" id="table" data-table="OrderHeader">
        <div class="setting">
          <i class="fa fa-cog pointer" title="表格设置" data-reveal-id="setting" data-dismissmodalclass="close-setting"></i>
        </div>
        <div class="setting">
          <i class="fa fa-search pointer" title="条件查询" data-reveal-id="query" data-key="true" data-dismissmodalclass="close-query-frame"></i>
        </div>
        <div class="setting">
          <i class="fa fa-plus-circle pointer" title="创建订单" data-reveal-id="ui" data-key="true"  data-dismissmodalclass="close-ui-frame" data-crudtype="pre-insert" data-type="insert" data-func="$().beforePreInsertH();"></i>
        </div>
        <div class="setting">
          <i id="refresh" class="fa fa-refresh pointer" title="刷新数据" data-pagetype="refresh" data-pageframe="table"></i>
        </div>  
        <div id="setting">
          <!-- 设置菜单区域 start -->
          <jsp:include page="public/setting.jsp" >
            <jsp:param name="rdtable" value="#main-table" />
            <jsp:param name="odtable" value="#main-table" />
            <jsp:param name="pageframe" value="table" />
          </jsp:include>
          <!-- 设置菜单区域 end -->  
        </div>
        <div>
          <!-- 分页按钮区域 start -->
          <jsp:include page="public/pageArrow.jsp" >
            <jsp:param name="pageframe" value="table" />
            <jsp:param name="func" value="" />
          </jsp:include>
          <!-- 分页按钮区域 end -->
          <input type="hidden" data-type="size" id="page_size" value="10"/>
          <input type="hidden" data-type="number" value="1"/>
          <input type="hidden" data-type="orderby" id="ORDER_BY" value="HEADER_ID"/> 
          <input type="hidden" data-type="cond"/>
          <input type="hidden" data-type="url" value="contract/getContractH.do"/>
          <input type="hidden" data-type="jsontype" value="table"/> 
          <input type="hidden" data-type="autoquery" value="N"/> 
        </div>
      </div>
      <!-- 主表格按钮区域 end --> 
   
      <!-- 定义列区域 start --> 
      <jsp:include page="public/rowdefine.jsp"></jsp:include>
      <!-- 定义列区域 end -->
    
      <!-- 多维排序区域 start -->
      <jsp:include page="public/orderby.jsp"></jsp:include>
      <!-- 多维排序区域 end -->
   
      <!-- 个人配置区域 start -->
      <jsp:include page="public/config.jsp">
        <jsp:param name="tableId" value="#main-table" />
      </jsp:include>
      <!-- 个人配置区域 end -->
     
      <!-- lov区域 start -->
      <jsp:include page="public/lov.jsp"></jsp:include>
      <!-- lov区域 end -->
     
      <!-- 更新/新增菜单区域 start -->
      <div id="ui" class="pop_frame row-6">     
        <div class="title pointer">      
          <span data-type="update"><i class="fa fa-th-list fa-1x" aria-hidden="true"></i>&nbsp;修改订单</span>
          <span data-type="insert"><i class="fa fa-th-list fa-1x" aria-hidden="true"></i>&nbsp;创建订单</span>
        </div>
        <a class="close-ui-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-6">
          <form>
            <input type="hidden" id="HEADER_ID" name="HEADER_ID" data-update="db"/>
            <label for="CONTRACT_NUMBER" class="left md">合同号:</label>
            <input type="text" data-update="db" class="left lgx2" id="CONTRACT_NUMBER" name="CONTRACT_NUMBER" readonly="readonly" placeholder="合同号由系统自动生成"/>
            <br style="clear:both"/> 
            <label for="PARTY_NAME" class="left md">客户账号:</label> 
            <input type="text" required="required" data-update="db" id="PARTY_NAME" name="PARTY_NAME" data-update="db" class="left lglov" readonly="readonly"/>
            <input type="hidden" data-update="db" id="CUSTOMER_ID" name="CUSTOMER_ID" data-update="db"/>
            <input type="button" id="PARTY_NAME_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="ui" data-bg="lov-modal-bg" data-dismissmodalclass='close-lov' data-lovname="客户查询" data-queryurl="lov/getUserCustPage.do" data-jsontype="cust" data-defaultquery="true" data-th=["销售公司ID","销售公司","客户ID","客户名称","客户账号"] data-td=["ORG_ID&none","ORG_NAME","CUST_ACCOUNT_ID&none","PARTY_NAME","ACCOUNT_NUMBER"] data-selectname=["客户名称","客户账号"] data-selectvalue=["PARTY_NAME","ACCOUNT_NUMBER"] data-choose=[".ORG_ID",".ORG_NAME",".CUST_ACCOUNT_ID",".PARTY_NAME"] data-recid=["#ORG_ID","#ORG_NAME","#CUSTOMER_ID","#PARTY_NAME"] value="···"/>  
            <br style="clear:both"/>
            <label for="ORG_NAME" class="left md">销售公司:</label> 
            <input type="text" required="required" data-update="db" id="ORG_NAME" name="ORG_NAME" data-update="db" class="left lg" readonly="readonly" />
            <input type="hidden" data-update="db" id="ORG_ID" name="SALES_ORG_ID" data-update="db" readonly="readonly"/>
            <label for="ORGANIZATION_NAME" class="left md">发货组织:</label> 
            <input type="text" required="required" data-update="db" id="ORGANIZATION_NAME" name="ORGANIZATION_NAME" class="left md"  data-modify='true' data-pageframe="query"  data-lovbtn="ORGANIZATION_LOV" data-param="ORGANIZATION_CODE" />
            <input type="hidden" data-update="db" id="ORGANIZATION_ID" name="SHIP_FROM_ORG_ID"/>
            <input type="button" id="ORGANIZATION_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="ui" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="库存组织查询" data-queryurl="lov/getUserOrganization.do" data-jsontype="organ" data-defaultquery="true" data-th=["库存ID","库存编码","库存组织"] data-td=["ORGANIZATION_ID&none","ORGANIZATION_CODE","ORGANIZATION_NAME"] data-selectname=["库存代号","库存组织"] data-selectvalue=["ORGANIZATION_CODE","ORGANIZATION_NAME"] data-choose=[".ORGANIZATION_ID",".ORGANIZATION_NAME"] data-recid=["#ORGANIZATION_ID","#ORGANIZATION_NAME"] value="···"/>         
            <br style="clear:both"/>
            <label for="ORDER_TYPE_ID" class="left md none">订单类型:</label>
            <select class="left lgx2 none" id="ORDER_TYPE_ID" name="ORDER_TYPE_ID" data-update="db" data-notnull="true" data-listurl="list/getOrderType.do"></select> 
            <label for="CUSTOMER_PO" class="left md">客订PO:</label>
            <input type="text" data-update="db" class="left lgx2" id="CUSTOMER_PO" name="CUSTOMER_PO"/>
            <br style="clear:both"/>
            <label for="REMARKS" class="left md">备注:</label>
            <input type="text" data-update="db" class="left lgx2" id="REMARKS" name="REMARKS"/>
          </form>
        </div>
        <div class="foot">       
          <button class="right update_confirm pointer" data-type="update" data-keyup="enter" data-crudtype="update" data-pageframe="ui" data-updateurl="contract/updateH.do">提交更新</button>
          <button class="right update_confirm pointer" data-type="insert" data-keyup="enter" data-crudtype="insert" data-pageframe="ui" data-inserturl="contract/insertH.do">创建</button>
        </div>    
      </div> 
      <!-- 更新/新增菜单区域 end -->
     
      <!-- 条件查询区域 start -->
      <div id="query" class="pop_frame row-5">     
        <div class="title pointer">      
          <span><i class="fa fa-th-list"></i>&nbsp;订单查询</span>
        </div>
        <a class="close-query-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-5">
          <form>
            <label for="CONTRACT_NUMBER_Q" class="left md">合同号:</label>
            <input type="text" class="left lgx2" id="CONTRACT_NUMBER_Q" name="CONTRACT_NUMBER"/>  
            <br style="clear:both"/>
            <label for="PARTY_NAME_Q" class="left md">客户名称:</label> 
            <input type="text" id="PARTY_NAME_Q" name="PARTY_NAME" data-update="db" class="left lglov" readonly="readonly"/>
            <input type="hidden" id="CUSTOMER_ID_Q" name='CUSTOMER_ID' data-update="db"/>
            <input type="button" id="PARTY_NAME_LOV_Q" class='left button pointer' data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass='close-lov' data-lovname="客户查询" data-queryurl="lov/getUserCustPage.do" data-jsontype="cust" data-defaultquery="true" data-th=["销售公司ID","销售公司","客户ID","客户名称","客户账号"] data-td=["ORG_ID&none","ORG_NAME","CUST_ACCOUNT_ID&none","PARTY_NAME","ACCOUNT_NUMBER"] data-selectname=["客户名称","客户账号"] data-selectvalue=["PARTY_NAME","ACCOUNT_NUMBER"] data-choose=[".ORG_ID",".ORG_NAME",".CUST_ACCOUNT_ID",".PARTY_NAME"] data-recid=["#ORG_ID_Q","#ORG_NAME_Q","#CUSTOMER_ID_Q","#PARTY_NAME_Q"] value="···"/>  
            <br style="clear:both"/>
            <label for="ORG_NAME_Q" class="left md">销售公司:</label> 
            <input type="text" id="ORG_NAME_Q" name="ORG_NAME" data-update="db" class="left lg" readonly="readonly" />
            <input type="hidden" id="ORG_ID_Q" name="ORG_ID" data-update="db" readonly="readonly"/>
            <label for="ORGANIZATION_NAME_Q" class="left md">发货组织:</label> 
            <input type="text" id="ORGANIZATION_NAME_Q" name="ORGANIZATION_NAME" class="left md"  data-modify='true' data-pageframe="query"  data-lovbtn='ORGANIZATION_LOV_Q'  data-param="ORGANIZATION_CODE" />
            <input type="hidden" id="ORGANIZATION_ID_Q" name="ORGANIZATION_ID"/>
            <input type="button" id="ORGANIZATION_LOV_Q" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="库存组织查询" data-queryurl="lov/getUserOrganization.do" data-jsontype="organ" data-defaultquery="true" data-th=["库存ID","库存编码","库存组织"] data-td=["ORGANIZATION_ID&none","ORGANIZATION_CODE","ORGANIZATION_NAME"] data-selectname=["库存代号","库存组织"] data-selectvalue=["ORGANIZATION_CODE","ORGANIZATION_NAME"] data-choose=[".ORGANIZATION_ID",".ORGANIZATION_NAME"] data-recid=["#ORGANIZATION_ID_Q","#ORGANIZATION_NAME_Q"] value="···"/>         
            <br style="clear:both"/>
            <label for="CREATION_DATE_F" class="left md">创建日期:</label>
            <input type="text" id="CREATION_DATE_F" name="CREATION_DATE_F" class="left time" data-datatype="date" placeholder="起始创建日期"/>
            <label class="left blank"></label>
            <input type="text" id="CREATION_DATE_T" name="CREATION_DATE_T" class="left time" data-datatype="date" placeholder="截止创建日期"/>
            <br style="clear:both"/>
            <label for='LOOKUP_CODE_Q' class='left md'>订单类型:</label>
            <select class='left lg' id='LOOKUP_CODE_Q' name='LOOKUP_CODE' data-update="db" data-notnull="false" data-listurl="list/getContractStatus.do"></select>  
            <br style="clear:both"/>
          </form>
        </div>
        <div class="foot">             
          <button class="right pointer"  data-buttonframe="table" data-keyup="enter" data-crudtype="query" data-pageframe="query">订单查询</button>
        </div> 
      </div>
      <!-- 条件查询区域 end -->
      
      <!-- 维护订单类型区域 start -->
      <div id="update_ot" class="pop_frame row-2" style="z-index:104">
        <div class="title pointer">      
          <span><i class="fa fa-file-text"></i>&nbsp;订单类型维护</span>
        </div>
        <a class="close-ot-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-2">
          <form>
            <input type="hidden" id="HEADER_ID_UOT" name="HEADER_ID"/>
            <label for="ORDER_TYPE_ID_UOT" class="left md">订单类型:</label>
            <select class="left lgx2" id="ORDER_TYPE_ID_UOT" name="ORDER_TYPE_ID" data-notnull="true" data-listurl="list/getOrderType.do"></select> 
          </form>
        </div>
        <div class="foot">             
          <button class="right update_confirm pointer" data-type="update" data-keyup="enter" data-crudtype="update" data-pageframe="update_ot" data-updateurl="contract/updateOT.do">提交</button>
        </div> 
      </div>
      <!-- 维护订单类型区域 end  -->
   
<!----------------------------------------------订单明细-------------------------------------------------------- -->      
      
      <div class="detail_frame" id="detail" style="height:470px">
        <div class='title pointer'>      
          <span><i class="fa fa-th-list"></i>&nbsp;订单明细</span>
        </div>
        <a class="close-detail-frame" data-type="close">&#215;</a>    
        <div class="line"></div>             
        <div class="detail_header" style="height:167px">
          <input type="hidden" id="HEADER_ID_L" />
          <label class="long" for="CONTRACT_NUMBER_L">合同号</label>
          <input type="text" id="CONTRACT_NUMBER_L" class="long" readonly="readonly"/>
          <label class="long" for="CURR_CODE_L">币别</label>
          <input type="text" id="CURR_CODE_L" class="long" readonly="readonly"/>
          <br style="clear:both"/>
          <label class="long" for="SALES_ORG_NAME_L">销售公司</label>
          <input type="text" id="SALES_ORG_NAME_L" class="long" readonly="readonly"/>
          <input type="hidden" id="SALES_ORG_ID_L"/>
          <label class="long" for="PARTY_NAME_L">客户名称</label>
          <input type="text" id="PARTY_NAME_L" class="long" readonly="readonly"/>
          <input type="hidden" id="CUSTOMER_ID_L"/>
          <br style="clear:both"/>
          <label class="long" for="SHIP_FROM_ORG_NAME_L">发货组织</label>
          <input type="text" id="SHIP_FROM_ORG_NAME_L" class="long" readonly="readonly"/>
          <input type="hidden" id="SHIP_FROM_ORG_ID_L"/>
          <input type="hidden" id="ORG_ID_L"/>
          <label class="long" for="CUSTOMER_PO_L">客订PO</label>
          <input type="text" id="CUSTOMER_PO_L" class="long" readonly="readonly"/>
          <input type="hidden" id="PRICE_LIST_ID_L"/>
          <br style="clear:both"/>
          <label class="long" for="PRICE_LIST_NAME_L">价目表</label>
          <input type="text" id="PRICE_LIST_NAME_L" class="long" readonly="readonly"/>
          <label class="long" for="STATUS_DESC_L">状态</label>
          <input type="text" id="STATUS_DESC_L" class="long" readonly="readonly"/>
        </div>     
        <!-- 订单明细表格区域 start -->
        <div class="detail_table">
          <table id="oLine" data-table="OrderLine">
            <tr>
              <th class="LINE_NUM" data-column="db">序号</th>
              <th class="DESCRIPTION" data-column="db">本厂型号</th>
              <th class="CARNAME" data-column="db">中文描述</th>
              <th class="UNIT_PRICE" data-column="db">单价</th>
              <th class="ORDER_QUANTITY" data-column="db">数量</th>
              <th class="REMARKS" data-column="db">备注</th>
              <th class="ACTION" data-column="normal">操作</th> 
              <th class="LINE_ID" style="display:none" data-column="hidden">&nbsp;</th>            
            </tr>
            <tr>
              <td class="LINE_NUM" data-column="db"></td>
              <td class="DESCRIPTION" data-column="db"></td>
              <td class="CARNAME" data-column="db"></td>
              <td class="UNIT_PRICE" data-column="db"></td>
              <td class="ORDER_QUANTITY" data-column="db"></td>
              <td class="REMARKS" data-column="db"></td>
              <td class="ACTION" data-column="normal">
                <i class="fa fa-jpy fa-fw update pointer hidden" id="change_price_btn" title="修改单价" data-show="true" data-reveal-id="detail_ui" data-bg="detail-modal-bg" data-key="true" data-dismissmodalclass="close-detail-ui-frame" data-crudtype="pre-update" data-preupdateurl="contract/preUpdateL.do" data-type="update" data-func="$().beforePreUpdateL()" data-updateparam=["LINE_ID",".LINE_ID"]></i>         
                <i class="fa fa-trash fa-fw pointer hidden" data-show="true" title="删除" data-refresh="sub_refresh"  data-col="LINE_NUM" data-crudtype="del" data-delurl="contract/deleteL.do" data-delmsg="是否删除行：" data-delparam=["LINE_ID",".LINE_ID"] ></i>
              </td>
              <td class="LINE_ID" style="display:none" data-column="hidden">&nbsp;</td>                          
            </tr>
          </table>
        </div>
        <!-- 订单明细表格区域 end --> 
        
        <div class="table_button" id="sub_table" data-table="OrderLine">
          <div class="setting">
            <i class="fa fa-plus-circle pointer" data-key="true"  data-reveal-id="detail_ui" data-bg="detail-modal-bg" data-dismissmodalclass="close-detail-ui-frame" data-crudtype="pre-insert" data-type="insert" data-func="$().beforePreInsertL();"></i>
          </div>
          <div class="setting">
            <i id="sub_refresh" class="fa fa-refresh pointer" data-pagetype="refresh" data-pageframe="sub_table" data-func="$().setParam();"></i>
          </div>
          <div class="setting">
            <i class="fa fa-upload pointer" title="登记订单" data-status="BOOK" data-statusdesc="登记"></i>
          </div>
          <div class="setting">
            <i class="fa fa-download pointer" title="接收订单" data-status="RECEIVE" data-statusdesc="接收"></i>
          </div>
          <div class="setting">
            <i class="fa fa-filter pointer" title="审核订单" data-status="CHECK" data-statusdesc="审核"></i>
          </div>
          <div class="setting">
            <i class="fa fa-check-square pointer" title="确认订单" data-status="CONFIRM" data-statusdesc="确认"></i>
          </div>
          <div class="setting">
            <i class="fa fa-times pointer" title="取消订单" data-status="CANCEL" data-statusdesc="取消"></i>
          </div>
          <div class="setting">
            <i class="fa fa-file-text pointer none" data-reveal-id="update_ot" data-bg="detail-modal-bg" data-key="true"  data-dismissmodalclass="close-ot-frame"  title="维护订单类型"></i>
          </div>
          <div>
            <jsp:include page="./public/pageArrow.jsp" >
              <jsp:param name="pageframe" value="sub_table" />
              <jsp:param name="func" value="$().setParam();" />
            </jsp:include>
            <input type="hidden" data-type="size" value="5"/>
            <input type="hidden" data-type="number" value="1"/>
            <input type="hidden" data-type="orderby" value="LINE_NUM"/> 
            <input type="hidden" data-type="cond"/>
            <input type="hidden" data-type="url" value="contract/getContractL.do"/>
            <input type="hidden" data-type="jsontype" value="subtable"/> 
            <input type="hidden" data-type="autoquery" value="N"/> 
          </div>
        </div>
      </div> 
      
      <!-- 订单明细新增区域 start -->
      <div id="detail_ui" class="pop_frame row-5" style="z-index:104">     
        <div class='title pointer'>          
          <span data-type="insert"><i class="fa fa-th-list  fa-1x" aria-hidden="true"></i>&nbsp;创建订单明细行</span>
          <span data-type="update"><i class="fa fa-th-list  fa-1x" aria-hidden="true"></i>&nbsp;修改价格</span>
        </div>
        <a class="close-detail-ui-frame" data-type="close">&#215;</a>
        <div class="line"></div>  
        <div class="content row-5">   
          <form>
            <input type="hidden" id="LINE_ID_D" name="LINE_ID" data-update="db"/>
            <input type="hidden" id="HEADER_ID_D" name="HEADER_ID"/>
            <input type="hidden" id="CURR_CODE_D" name="CURR_CODE"/>
            <input type="hidden" id="PRICE_LIST_ID_D" name="PRICE_LIST_ID"/>
            <input type="hidden" id="SHIP_FROM_ORG_ID_D" name="SHIP_FROM_ORG_ID"/>
            <label class="left md">行号</label>
            <input type="text" id="LINE_NUM_D" name="LINE_NUM" class="lg left" readonly="readonly"/>
            <br style="clear:both"/>
            <label for="DESCRIPTION_D" class="md left">本厂型号</label> 
            <input type="text" id="DESCRIPTION_D" name="DESCRIPTION" data-update="db" class="left lglov" required="required" data-modify="false" readonly="readonly"/>          
            <input type="hidden" id="INVENTORY_ITEM_ID_D" name="INVENTORY_ITEM_ID" data-update="db"/>
            <input type="button" id="ITEM_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="detail_ui" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="产品查询" data-queryurl="lov/getItemPage.do" data-jsontype="item" data-defaultquery="false" data-extparam=["ORGANIZATION_ID","CUSTOMER_ID","SALES_ORG_ID"] data-extparamid=["#SHIP_FROM_ORG_ID_L","#CUSTOMER_ID_L","#SALES_ORG_ID_L"] data-th=["物料ID","物料编码","本厂型号","中文描述"] data-td=["INVENTORY_ITEM_ID&none","ITEM_NUMBER","DESCRIPTION","CARNAME"] data-selectname=["本厂型号","中文描述"] data-selectvalue=["DESCRIPTION","CARNAME"] data-choose=[".INVENTORY_ITEM_ID",".DESCRIPTION",".CARNAME"] data-recid=["#INVENTORY_ITEM_ID_D","#DESCRIPTION_D","#CARNAME_D"] value="···"/> 
            <label for="CARNAME" class="md left">中文描述</label> 
            <input type="text" id="CARNAME_D" name="CARNAME" data-update="db" class="left lgx2" data-update="db" required="required" readonly="readonly"/> 
          	<br style="clear:both"/>
          	<label for="ORDER_QUANTITY_D" class="md left">数量</label>
          	<input type="text" id="ORDER_QUANTITY_D" name="ORDER_QUANTITY" class="lg left" data-update="db" required="required"/>
          	<label for="UNIT_PRICE_D" class="md left">单价</label>
          	<input type="text" id="UNIT_PRICE_D" name="UNIT_PRICE" class="lg left" data-update="db" readonly="readonly" required="required"/>
          	<br style="clear:both"/>
          	<label for="REMARKS_D" class="md left">备注</label>
          	<input type="text" id="REMARKS_D" name="REMARKS" class="left lgx2" data-update="db"/>
          </form> 
        </div>
        <div class="foot">            
          <button class="right update_confirm pointer" data-type="insert" data-keyup="enter" data-crudtype="insert" data-pageframe="detail_ui" data-inserturl="contract/insertL.do" data-refresh="sub_refresh">创建</button>
          <button class="right update_confirm pointer" data-type="update" data-keyup="enter" data-crudtype="update" data-pageframe="detail_ui" data-updateurl="contract/updateL.do" data-refresh="sub_refresh">确定</button>
        </div>    
      </div>          
      <!-- 订单明细新增/更新区域 end --> 
      
      <!-- 用户信息存放区域 start -->
      <input type="hidden" id="USER_ID" value="${USER_ID}"/>  
      <input type="hidden" id="INTERACT_CODE" value="ORDER_MANAGE"/> 
      <input type="hidden" id="HEADER_ID" value=""/> 
      <!-- 用户信息存放区域 end -->         
    </div> 
    
    <script>       
        $(function() {
            
            //设置拖拽
            $("#ui").draggable({ handle: ".title" });
            $("#detail").draggable({ handle: ".title" });
            $("#detail_ui").draggable({ handle: ".title" });
            $("#query").draggable({ handle: ".title" }); 
            
            //初始化CRUD和LOV条件查询
            $().crudListener(); 
            $().revealListener(); 
            
            //设置滚动条
			//$(".table").mCustomScrollbar({
			//	axis:"x",
			//	scrollInertia:0
			//});	  
			
			//条件查询限制
    		$.fn.validateCustomer = function(){
    		    var userType = '${USER_TYPE}';
			    if(userType=='CUSTOMER'){
    		    	var customerId = $('#CUSTOMER_ID_Q').val();
    		    	var orgId = $('#ORG_ID_Q').val();
    		    	if(customerId==null||customerId==''||orgId==null||customerId==''){
    		       		$('.ajax_loading').hide();
    		       		layer.alert('必须选择客户才能查询订单！',{skin:'layui-layer-lan',title:'警告',offset:[150]});
    		       		throw ('必须选择客户才能查询订单！');
    		    	}
    		    }
    		}
			
			$('#ORDER_QUANTITY_D').on('change',function(){
			   var itemId = $('#INVENTORY_ITEM_ID_D').val();
			   if(itemId == null||itemId == ''){
			       $('#ORDER_QUANTITY_D').val('');
			       layer.alert("请先选择本厂型号再填写数量！",{title:'警告',offset:[150]});
			       return;
			   }
			   var qty = $('#ORDER_QUANTITY_D').val();
			   if(qty == null||qty == ''){
			       $('#UNIT_PRICE_D').val('');
			   }else{
			       var orgId = $('#ORG_ID_L').val();
			       var currCode = $('#CURR_CODE_L').val();
			       var priceListId = $('#PRICE_LIST_ID_L').val();
			       var param = 'INVENTORY_ITEM_ID='+itemId+'&ORG_ID='+orgId+'&CURR_CODE='+currCode+'&PRICE_LIST_ID='+priceListId+'&ORDER_QUANTITY='+qty;
			       $.ajax({
					   type:'post', 
					    data:param,
					    url:'contract/getUnitPrice.do',
					    dataType:'json',
					    success: function (data) {
					        if(data.retcode=="0"){
					            $('#UNIT_PRICE_D').val(data.param2);
					        }else{
					            layer.alert("获取单价错误！错误信息:"+data.errbuf,{title:'警告',offset:[150]});
					        }
					    },
						error: function () {
						    layer.msg('获取JSON数据失败');	
							if(window.frameElement != null){
							    //console.log("处于一个iframe中");
							    $('body',parent.document).find('a[data-tabtype="refreshTab"]')[0].click(); 
							}
						}
			       });
			   }
			
			}); 
			
			$.fn.beforePreInsertH = function(){
			    var display = $('#ORDER_TYPE_ID').css('display');
			    if(display!='none'){
			    	$('#ORDER_TYPE_ID').addClass('none');
			    	$('label[for="ORDER_TYPE_ID"]').addClass('none');
			    }
			} 
			
			$.fn.beforePreUpdateH = function(){
			    var userType = '${USER_TYPE}';
			    if(userType=='EMP'){
			    	$('#ORDER_TYPE_ID').removeClass('none');
			    	$('label[for="ORDER_TYPE_ID"]').removeClass('none');
			    }
			} 
			
			$.fn.beforePreInsertL = function(){
			    //自动获取行号
				headerId = $('#HEADER_ID_L').val();
                param = 'HEADER_ID='+headerId;
                $.ajax({
                    type:'post', 
                    data:param,
                    url:'contract/getAutoLineNum.do',
                    dataType:'json',
                    success: function (data) {
                        $('#HEADER_ID_D').val(headerId);
                        $('#LINE_NUM_D').val(data.rows[0].LINE_NUM);
                    },
                    error: function () {
                        layer.alert('获取数据失败',{title:'警告',offset:[150]});
                    }           
                }); 
                $('#CURR_CODE_D').val($('#CURR_CODE_L').val());
                $('#SHIP_FROM_ORG_ID_D').val($('#SHIP_FROM_ORG_ID_L').val());
                $('#PRICE_LIST_ID_D').val($('#PRICE_LIST_ID_L').val());
                //改变readonly状态
                $('#ORDER_QUANTITY_D').removeAttr('readonly');
				$('#REMARKS_D').removeAttr('readonly');
				$('#UNIT_PRICE_D').attr('readonly','readonly');
			}
			
			$.fn.beforePreUpdateL = function(){
			    $('#ORDER_QUANTITY_D').attr('readonly','readonly');
				$('#REMARKS_D').attr('readonly','readonly');
				$('#UNIT_PRICE_D').removeAttr('readonly');
			}
            
            $.fn.setParam = function(){
                headerId=$('#HEADER_ID_L').val();
                param=param+'&HEADER_ID='+headerId;
            }   
            
            $.fn.detailShow = function(){
                $('.show_detail').off('click');  
                $('.show_detail').on('click',function(){
                    var userType = '${USER_TYPE}';
			    	if(userType=='EMP'){
			    	    //null;
			    		$('i[data-status="BOOK"]').parent().css("display","none");
			    		$('i[data-status="CONFIRM"]').parent().css("display","none");
			    	}else if(userType='CUSTOMER'){
			    	    $('i[data-status="RECEIVE"]').parent().css("display","none");
			    	    $('i[data-status="CHECK"]').parent().css("display","none");
			    	    $('#change_price_btn').css("display","none");
			    	}
                    tr=$(this).parent().parent();
                    $('.detail_header input').val('');
                    $('#sub_table input[data-type="number"]').val('1');
                    $('#CONTRACT_NUMBER_L').val(tr.children('.CONTRACT_NUMBER').text());
                    $('#PARTY_NAME_L').val(tr.children('.PARTY_NAME').text());
                    $('#HEADER_ID_L').val(tr.children('.HEADER_ID').text());
                    $('#CUSTOMER_ID_L').val(tr.children('.CUSTOMER_ID').text());
                    $('#SALES_ORG_ID_L').val(tr.children('.SALES_ORG_ID').text());
                    $('#SALES_ORG_NAME_L').val(tr.children('.SALES_ORG_NAME').text());
                    $('#CURR_CODE_L').val(tr.children('.CURR_CODE').text());
                    $('#SHIP_FROM_ORG_ID_L').val(tr.children('.SHIP_FROM_ORG_ID').text());
                    $('#ORG_ID_L').val(tr.children('.ORG_ID').text());
                    $('#SHIP_FROM_ORG_NAME_L').val(tr.children('.SHIP_FROM_ORG_NAME').text());
                    $('#CUSTOMER_PO_L').val(tr.children('.CUSTOMER_PO').text());
                    $('#PRICE_LIST_ID_L').val(tr.children('.PRICE_LIST_ID').text());
                    $('#PRICE_LIST_NAME_L').val(tr.children('.PRICE_LIST_NAME').text());
                    $('#STATUS_DESC_L').val(tr.children('.STATUS_DESC').text());
                    $('#sub_refresh').click();
                });   
            }   
            
       		//改变订单状态
       		$('i[data-status]').on('click',function(){
       		    var new_status = $(this).data('status');
       		    var header_id = $('#HEADER_ID_L').val();
       		    var status_desc = $(this).data('statusdesc');
       		    param = 'HEADER_ID='+header_id+'&NEW_STATUS='+new_status;
       		    $.ajax({
                    type:'post', 
                    data:param,
                    url:'contract/changeStatus.do',
                    dataType:'json',
                    success: function (data) {
                        if(data.retcode=="0"){
				    		layer.msg(status_desc+"成功!");
				    		$('#STATUS_DESC_L').val(status_desc);
				    		//$('#'+options.pageframe+' a[data-type="close"]').click();/****点击关闭更新框按钮****/
				    		$('#refresh').click();/****点击刷新当前页按钮，刷新数据****/
				    	}else{
				    	    if(new_status=="RECEIVE"){
				    	        if(data.errbuf == '请先维护好订单类型，再审核'){
				    	            layer.alert(status_desc+"处理失败！错误信息:"+data.errbuf
				    	                   ,{title:'警告',offset:[150],btn:['维护订单类型','取消'] }
				    	                   ,function(){
				    	                       $('[data-reveal-id="update_ot"]').click();
				    	                       layer.closeAll('dialog');
				    	                   });
				    	        }else{
				    	            layer.alert(status_desc+"处理失败！错误信息:"+data.errbuf,{title:'警告',offset:[150]});
				    	        }	    	        
				    	    }else{
				    	        layer.alert(status_desc+"处理失败！错误信息:"+data.errbuf,{title:'警告',offset:[150]});
				    	    }	
				    	}
                    },
                    error: function () {
                        layer.alert('获取数据失败',{title:'警告',offset:[150]});
                    }           
                }); 
       		    //alert(new_status);
       		});
       		
       		//修改订单类型
       		$('[data-reveal-id="update_ot"]').click('on',function(){
       		    $('#HEADER_ID_UOT').val($('#HEADER_ID_L').val());
       		    $('#ORDER_TYPE_ID_UOT').val('');
       		});
       		
       		//日期选择
            $('input[data-datatype="date"]').datetimepicker({
                lang:"ch",           //语言选择中文
                timepicker:true,    //启用时间选项
                format:"Y-m-d H:i:s",      //格式化日期
                step: 30,
                showOnClick: true
            });
                
        });
         
        jQuery.json={
            getContent:function(data,JSONtype){    
                if(JSONtype=='table'){
                      var mapRowArray=[
	                  ['.HEADER_ID','HEADER_ID']    
	                 ,['.CONTRACT_NUMBER','CONTRACT_NUMBER']
	                 ,['.PARTY_NAME','PARTY_NAME']   
	                 ,['.ACCOUNT_NUMBER','ACCOUNT_NUMBER']   
	                 ,['.CUSTOMER_ID','CUSTOMER_ID']   
	                 ,['.SALES_ORG_ID','SALES_ORG_ID']   
	                 ,['.SALES_ORG_NAME','SALES_ORG_NAME']
	                 ,['.SHIP_FROM_ORG_ID','SHIP_FROM_ORG_ID']
	                 ,['.ORG_ID','ORG_ID']
	                 ,['.SHIP_FROM_ORG_NAME','SHIP_FROM_ORG_NAME']
	                 ,['.CURR_CODE','CURR_CODE']
	                 ,['.PRICE_LIST_ID','PRICE_LIST_ID']
	                 ,['.PRICE_LIST_NAME','PRICE_LIST_NAME']
	                 ,['.ORDER_TYPE_NAME','ORDER_TYPE_NAME']
	                 ,['.STATUS_DESC','STATUS_DESC']
	                 ,['.CREATION_DATE','CREATION_DATE']
	                 ,['.STATUS_BOOK_DATE','STATUS_BOOK_DATE']
	                 ,['.STATUS_RECEIVE_DATE','STATUS_RECEIVE_DATE']
	                 ,['.STATUS_CHECK_DATE','STATUS_CHECK_DATE']
	                 ,['.STATUS_CONFIRM_DATE','STATUS_CONFIRM_DATE']
	                 ,['.CUSTOMER_PO','CUSTOMER_PO']
	                 ,['.REMARKS','REMARKS']
	                  ];
	                 $().mapContentJson(data,'#main-table',mapRowArray);
	                 $().afterRowDefine();
                     $().crudListener();
                     $().detailShow();  
                     $().revealListener(); 
                }else if(JSONtype=='subtable'){            
                     var mapRowArray=[
                     ['.LINE_NUM','LINE_NUM']
                    ,['.DESCRIPTION','DESCRIPTION']
                    ,['.CARNAME','CARNAME']
                    ,['.UNIT_PRICE','UNIT_PRICE']                 
                    ,['.ORDER_QUANTITY','ORDER_QUANTITY']
                    ,['.REMARKS','REMARKS']
                    ,['.LINE_ID','LINE_ID']
                     ];
                    $().mapContentJson(data,'#oLine',mapRowArray);
                    width='-'+parseInt($('#detail').css('width'))/2+'px';
                    $('#detail').css('margin-left',width); 
                    $().crudListener();             
                    $().revealListener();                    
                    
                }else if(JSONtype=='organ'){
                    var mapRowArray=[
                       'ORGANIZATION_ID'
                      ,'ORGANIZATION_CODE'
                      ,'ORGANIZATION_NAME'
                    ];
                    $().mapContentJson(data,'.contentbox',mapRowArray);                     
                }else if(JSONtype=='cust'){
        	        var mapRowArray=[
        	    	 'ORG_ID'
        	    	,'ORG_NAME'
        	    	,'CUST_ACCOUNT_ID'
        	    	,'PARTY_NAME'
        	    	,'ACCOUNT_NUMBER'
        	    	];
        	    	$().mapContentJson(data,'#lov',mapRowArray);
        	    }else if(JSONtype=='item'){
        	        var mapRowArray=[
        	    	 'INVENTORY_ITEM_ID'
        	    	,'ITEM_NUMBER'
        	    	,'DESCRIPTION'
        	    	,'CARNAME'
        	    	];
        	    	$().mapContentJson(data,'#lov',mapRowArray);
        	    }                              
            },  
            getUpdateJSON:function(data,pageframe){   
                if(pageframe=='ui'){         
                    var mapRowArray=[
                      ['#HEADER_ID','HEADER_ID']    
                     ,['#CONTRACT_NUMBER','CONTRACT_NUMBER']
                     ,['#PARTY_NAME','PARTY_NAME']   
                     ,['#CUSTOMER_ID','CUSTOMER_ID']
                     ,['#ORG_ID','SALES_ORG_ID']
                     ,['#ORG_NAME','SALES_ORG_NAME']
                     ,['#ORGANIZATION_ID','SHIP_FROM_ORG_ID']
                     ,['#ORGANIZATION_NAME','SHIP_FROM_ORG_NAME']
                     ,['#ORDER_TYPE_ID','ORDER_TYPE_ID']
                     ,['#CUSTOMER_PO','CUSTOMER_PO']
                     ,['#REMARKS','REMARKS']
                     ];
                    $().mapUpdateJson(data,mapRowArray);
                }else if(pageframe=='detail_ui'){
                    var mapRowArray=[
                      ['#LINE_ID_D','LINE_ID']    
                     ,['#LINE_NUM_D','LINE_NUM']
                     ,['#DESCRIPTION_D','DESCRIPTION']   
                     ,['#CARNAME_D','CARNAME']
                     ,['#INVENTORY_ITEM_ID_D','INVENTORY_ITEM_ID']
                     ,['#ORDER_QUANTITY_D','ORDER_QUANTITY']
                     ,['#UNIT_PRICE_D','UNIT_PRICE']
                     ,['#REMARKS_D','REMARKS']
                     ];
                    $().mapUpdateJson(data,mapRowArray);
                }       
            },
            getMSG:function(data){
                pageMinRow=parseInt(data.pageMinRow);
                pageMaxRow=parseInt(data.pageMaxRow);
                firstPageFlag=data.firstPageFlag;
                lastPageFlag=data.lastPageFlag;
                totalPages=data.totalPages;
            }             
        } 

    </script> 
    <script type="text/javascript" src="plugin/layer/layer.js"></script>
    <script type="text/javascript" src="plugin/js/data.validate.js"></script>
    <script type="text/javascript" src="plugin/js/jQuery.reveal.js"></script> 
    <script type="text/javascript" src="plugin/js/jQuery.page.js"></script>
    <script type="text/javascript" src="plugin/js/jQuery.lov.js"></script> 
    <script type="text/javascript" src="plugin/js/jQuery.crud.js"></script> 
    <script type="text/javascript" src="plugin/js/jQuery.rowdefine.js"></script>
    <script type="text/javascript" src="plugin/js/jQuery.irr.orderby.js"></script>  
    <script type="text/javascript" src="plugin/js/jQuery.irr.init.js"></script>   
  </body>
</html>