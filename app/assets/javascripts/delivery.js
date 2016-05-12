
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

function adjustLineItemCount(obj,line_item_id){
  var obj=$(obj);
  var url;
  if(obj.hasClass('glyphicon-plus')){
    url = "/line_items/" + line_item_id + "/line_item_count_plus";
  }else{
    url = "/line_items/" + line_item_id + "/line_item_count_minus";
  }
  $.ajax({
    url: url,
    type: "POST",
    dataType: "json",
    data: {line_item_id: line_item_id},
    success: function(res){
      if(res.state_code==1){
        $("badge").html(res.total_line_item_count);
        if(res.current_line_item_count!=0){
            obj.siblings(".line_item_quantity").html(res.current_line_item_count);
        }else{
            obj.toggle();
        }
        $(".badge").html(res.total_line_item_count);
      }
    }
  });
}
