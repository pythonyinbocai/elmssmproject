$(function () {
    //获取显示隐藏按钮DOM对象
    let showBtn = document.getElementById('showBtn');
    //获取订单明细DOM对象
    let detailetBox = document.getElementById('detailetBox');
    //设置默认订单明细隐藏
    detailetBox.style.display='none';

    showBtn.onclick = function(){
        //判断订单明细DOM对象是否隐藏，如果是，就显示，否则就隐藏
        if(detailetBox.style.display=='none'){
            detailetBox.style.display='block';
        }else{
            detailetBox.style.display='none';
        }
    }
})
function orderSubmit() {
    location.href='/OrdersController/createOrders?businessId='+$('.order-info p:first-child').attr("data")+'&daId='+$('input[name=daId]:checked').val();
}