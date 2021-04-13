$(function() {
  var member_num = $('.js-team_member').length;
  $('#add_item_button').on('click', function() {
    var input =
        '<div class="js-team_member my-5" id="add_member_' + member_num + '">'
        + '<p>レシピ</p>'
        + '<input class="form-control form-control border-0 my-3" type="text" name="post[post_items_attributes][' + member_num + '][text]" id="team_members_attributes_' + member_num + '_text" placeholder="レシピを書いてね" >'
        + '<input class="form-control form-control border-0 my-3" type="file" name="post[post_items_attributes][' + member_num + '][img]" id="team_members_attributes_' + member_num + '_img" >'
        + '<span class="member_delete" data-id="'+ member_num + '">'
        +   'Delete'
        + '</span>'
        +'</div>'
    $('#team_members_box').append(input);
    member_num ++;
  });

  $('#team_members_box').on('click', '.member_delete', function() {
    var inputId = $(this).data('id');
    var defaultData = $(this).data('default');
    if (defaultData == 'default') {
      $(this).prev().prop('checked', true);
      $('#add_member_' + inputId).hide();
    }else{
      $('#add_member_' + inputId).remove();
    }
  });
});