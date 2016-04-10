$(function(){
  $(".order_button").each(function(){
    $(this).click(function(){
      var obj=$(this);
      var id=obj.attr("id");
      var url;
      if($(this).hasClass("add_to_cart")) {
        var url = "/delivery/" + id + "/addToCart";
      }else {
        url= "/delivery/" + id + "/removeFromCart";
      }
      $.ajax({
        url: url,
        type: "POST",
        dataType: "json",
        data: {id:id},
        success: function(res){
          if(res.code==0){
            orderButtonToggle(obj);
          }
        }
      });
    })
  })
})

function orderButtonToggle(obj){
  obj.toggle();
  obj.siblings().toggle();
}


function orderFood(e){

  return false;
}
