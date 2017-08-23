require(['component/iframeLayer', 'component/dataTable',
 'common/util', 'common/http','handlebars', 'jquery.validate', 'jquery.serialize', 'laydate','common/validateRules'], function
(layer, dataTable, util, http, handlebars) {


    init();
    var table;
    /**
     * 初始化函数集合
     */

    function init() {
        bind();
    }


    function bind() {
        util.bindEvents([
        {
            el: '#cancel',
            event: 'click',
            handler: function () {
                layer.close({reload: false});
            }
        }
        ])
    }

})