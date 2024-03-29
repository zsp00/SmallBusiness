require(['component/iframeLayer','component/dataTable', 'common/util', 'common/http','handlebars','jquery','jquery.serialize','laydate','tab'], function (layer,dataTable, util, http,handlebars) {
	
	var searchParams={};
	var table;
	
	 init();
	 
	 function init(){
		 bind();
		 initDataTable();
	 }
	 
	 
	    /**
	     * 初始化dataTable
	     */
	    function initDataTable() {
	        var tpl = $('#tpl').html();
	        var template = handlebars.compile(tpl);
	        searchParams = $("#searchForm").serializeObject();
	        table = dataTable.load({
	            //需要初始化dataTable的dom元素
	            el: '#qua-table',
	            scrollX:true,	
	            showIndex: true,
	            ajax : {
	                //type : "get",
	                url :  '/reg/server/seriouscrime/doGetExpSecInApplyList',
	                data : function(d){
                		d.params = searchParams;
	                }

	            },
	            //需注意如果data没有对应的字段的，请设置为null，不然ie下会出错;
	            //className不要写成class
	            columns: [                
                {data: '_idx', className: 'center'},
                {data: 'id', className: 'center'},
                {data: 'regNO', className: 'center'},
                {data: 'entName', className: 'center'},
                {data: 'leRep', className: 'center'},
                {data: 'businessStatusName', className: 'center'},
                {data: 'speCauseCN',  className: 'center'},
                {data: 'abnTime',  className: 'center'},
                {data: 'expExpiredDate',  className: 'center'},
                {data: 'addSecTerm',  className: 'center'},
                {data: 'addSecDate',  className: 'center'},
                {data: 'addSecCause',  className: 'center'}
	            ],
	            columnDefs: [
				 {
				      targets: 1,
				      render: function (data, type, row, meta) {
				    	  if(row.businessStatus == '0')
				    		  return "<a href='javascript:void(0)' class='apply'>申请列入</a>";
			    		  if(row.businessStatus == '1')
				    		  return "<a href='javascript:void(0)' class='detail'>详情</a><a href='javascript:void(0)' class='edit'>修改</a><a href='javascript:void(0)' class='delete'>删除</a>";
			    		  if(row.businessStatus == '2')
				    		  return "<a href='javascript:void(0)' class='edit'>修改</a>";
			    		  if(row.businessStatus == '3')
				    		  return "<a href='javascript:void(0)' class='detail'>详情</a>";
			    		  if(row.businessStatus == '4')
				    		  return "<a href='javascript:void(0)' class='detail'>详情</a>";
			    		  if(row.businessStatus == '5')
				    		  return "<a href='javascript:void(0)' class='edit'>修改</a>";
				    		  return "";
				  }
				},{
				      targets: 2,
				      render: function (data, type, row, meta) {
				    	  if(row.uniSCID!=null&&row.uniSCID!="")
				    		  return row.uniSCID;
				    	  return row.regNO;
				  }
				}
				]
	        })
	    }
	 
	    
	   //事件绑定
	    function bind() {
	        util.bindEvents([ {
	            el: '#search',
	            event: 'click',
	            handler: function() {
	            	searchParams = $("#searchForm").serializeObject();
	            		table.ajax.reload();
	            }
	        }, {
                el: '#choseregUnit',
                event: 'click',
                handler: function () {
                    layer.dialog({
                        title: '请选择企业管理部门',
                        area: ['25%', '60%'],
                        content: '/commom/server/regunit/regunitmutiselectnocheck',
                        callback: function (data) {
                            //重新加载列表数据
                            $("#localAdm").val(data.returncodes);
                            $("#localAdmName").val(data.returnname);
                        }
                    })
                }
            }, {
                el: '#chosespeCause',
                event: 'click',
                handler: function () {
                    layer.dialog({
                        title: '列入原因',
                        area: ['600px', '350px'],
                        content: '/commom/server/intercept/interceptselect?selecttype=appInReaCodeList',
                        callback: function (data) {
                            if(data){
                                $("#speCause").val(data.id);
                                $("#SpeCauseCN").val(data.text);
                            }
                        }
                    })
                }
            }, {
                el: '.apply',
                event: 'click',
                handler: function () {
                	var data = table.row($(this).closest('td')).data();
                    layer.dialog({
                        title: '申请列入',
                        area: ['98%', '99%'],
                        content: '/reg/server/seriouscrime/doEnExpApplyAdd?priPID='+data.priPID+"&uID="+data.uid,
                        callback: function (data) {
                        	if (data.reload) {
                                table.ajax.reload();
                            }
                        }
                    })
                }
            }, {
                el: '.edit',
                event: 'click',
                handler: function () {
                	var data = table.row($(this).closest('td')).data();
                    layer.dialog({
                        title: '修改',
                        area: ['98%', '99%'],
                        content: '/reg/server/seriouscrime/doEnExpInApplyEdit?priPID='+data.priPID+"&uID="+data.sourceId,
                        callback: function (data) {
                        	if (data.reload) {
                                table.ajax.reload();
                            }
                        }
                    })
                }
            }, {
                el: '.delete',
                event: 'click',
                handler: function () {
                	var data = table.row($(this).closest('td')).data();
                	layer.confirm('确定要删除吗?', {icon: 2, title: '提示'}, function (index) {
                        http.httpRequest({
                            url: '/reg/server/seriouscrime/doExpInApplyDelete',
                            data: {sourceId:data.sourceId},
                            success: function (data) {
                                if (data.status == 'success') {
                                    //重新加载列表数据
                                        layer.msg(data.msg, {time: 1000}, function () {
                                            table.ajax.reload();
                                        });
                                }else{
                                	layer.msg(data.msg, {time: 1000}, function () { });
                                }
                            }
                        });

                    });
                }
            }, {
                el: '.detail',
                event: 'click',
                handler: function () {
                	var data = table.row($(this).closest('td')).data();
                	   layer.dialog({
                           title: '详情',
                           area: ['98%', '99%'],
                           content: '/reg/server/seriouscrime/doEnExpInApplyDetail?priPID='+data.priPID+"&uID="+data.sourceId,
                           callback: function (data) {
                           	if (data.reload) {
                                   table.ajax.reload();
                               }
                           }
                       })
                }
            }, {
                el: '#reset',
                event: 'click',
                handler: function () {
                	$(".clearall").val("");
                }
            }
			])
	    }

})



