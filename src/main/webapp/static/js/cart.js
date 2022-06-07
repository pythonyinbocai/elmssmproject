
    getTotal();
    //计算总价钱
    function getTotal(){
        var $prices=$('.single-price');//html()
        var sum=0;
        var allcount=0;
        $prices.each(function(item){
            var quantity=$(this).parents('li').find('.food-quantity').html();
                sum+=parseFloat($(this).html())*parseInt(quantity);
                allcount+=parseInt(quantity);
        });
        $(".totalMoney").html(toDecimal2(sum));
        $(".cart-left-icon-quantity").html(allcount);
        var starPrice = parseFloat($(".starPrice").html());
        var deliveryPrice=parseFloat($(".deliveryPrice").html());
        $('.realDeliveryPrice').html(deliveryPrice);
        if(sum+deliveryPrice>starPrice){
            $('.cart-right-item').removeClass('submitDis');
            $('.cart-right').prepend('<div class="cart-right-item">&#165;'+starPrice+'起送</div>')
            $('.cart-right-item').bind("click",tobalance);
        }else{
            $('.cart-right-item').unbind("click");
            $('.cart-right-item').addClass('submitDis')
        }
    }
//数量加的操作
function plus(eml,businessId,foodId){
    var quantity = parseInt($(eml).parent().prev().find("span").html());
    var cart={
        businessId:businessId,
        foodId:foodId,
        quantity:quantity+1
    }
    var action = 'updateCart'
    if(quantity==0){
        action = 'saveCart'
    }
    $.ajax({
        url:'/CartController/'+action,
        type:'post',
        contentType:'application/json;charset=utf-8',
        data:JSON.stringify(cart),
        dataType:'text',
        success:function (res) {
            if(res=="nologin"){
                location.href="/UserController/tologin"
            }else if(res=="success"){
                console.log($(eml).html())
                $(eml).parent().prev().css("display","block").find("span").html(quantity+1);
                $(eml).parent().prev().prev().css("display","block");
                getTotal();
            }
        }
    });
}
//数量减的操作
function minus(eml,businessId,foodId){
    var quantity = parseInt($(eml).parent().next().find("span").html());
    var cart={
        businessId:businessId,
        foodId:foodId,
        quantity:quantity-1
    }
    var action = 'updateCart'
    if(quantity==1){
        action = 'removeCart'
    }
    $.ajax({
        url:'/CartController/'+action,
        type:'post',
        contentType:'application/json;charset=utf-8',
        data:JSON.stringify(cart),
        dataType:'text',
        success:function (res) {
            if (res == "success") {
                $(eml).parent().next().find("span").html(quantity - 1);
                if (quantity - 1 == 0) {
                    $(eml).parent().parent().find("p,div:first-child").css("display", "none");
                }
                getTotal();
            }
        }
    });
}
function tobalance() {
        var total = parseFloat( $(".totalMoney").html());
    if(total+parseFloat($('.realDeliveryPrice').html())>parseFloat($(".starPrice").html())) {
        location.href = '/pay/topayment?businessId=' + $('.business-info').attr("data") + '&total=' + total;
    }
}