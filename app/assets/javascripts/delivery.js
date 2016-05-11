
  //$(".order_button").each(function(){
  //  $(this).click(function(){
  //    var obj=$(this);
  //    var id=obj.attr("id");
  //    var url;
  //    if($(this).hasClass("add_to_cart")) {
  //      url = "/delivery/" + id + "/addToCart";
  //    }else {
  //      url= "/delivery/" + id + "/removeFromCart";
  //    }
  //    $.ajax({
  //      url: url,
  //      type: "POST",
  //      dataType: "json",
  //      data: {id:id},
  //      success: function(res){
  //        if(res.state_code==1){
  //          orderButtonToggle(obj);
  //          $(".cart_link").html("购物车<span class='badge'>"+ res.line_item_count +"</span>");
  //        }
  //      }
  //    });
  //  })
  //})

function orderButtonToggle(obj){
  obj.toggle();
  obj.siblings().toggle();
}

function orderButtonClicked(btn){
  var obj=$(btn);
  var id=obj.attr("id");
  var url;
  if(obj.hasClass("add_to_cart")) {
    url = "/delivery/" + id + "/addToCart";
  }else {
    url= "/delivery/" + id + "/removeFromCart";
  }
  $.ajax({
    url: url,
    type: "POST",
    dataType: "json",
    data: {id:id},
    success: function(res){
      if(res.state_code==1){
        orderButtonToggle(obj);
        $(".cart_link").html("购物车<span class='badge'>"+ res.line_item_count +"</span>");
      }
    }
  });
}

