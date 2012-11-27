$(document).ready(function(){
//move other position below primary title
  if ($('.sectionHeader2').length) {
    $('<br><span id="othpos">&nbsp;</span>').appendTo('.basicInfo tr:nth-child(1) td:nth-child(2)');
    $('.sectionHeader2').siblings().addClass('otherpos');
    $('.otherpos th').html('');
    var str = $('.otherpos').text();
    str = str.replace(";", "<br>");
    $("#othpos").html(str);
    $('.sectionHeader2').parents('.content_two_columns').hide();
  }

//TOC
  $('.PropertyItemHeader').addClass('toc-item');
  $('.toc-item').attr("id", function (arr) { 
    return 'toc-id' + arr; 
  });  
  $('.toc-item').each(function () { 
    var id = $(this).attr('id');
    var txt = $.trim($(this).text());
    var alink = '<li><a href=#'+id+'>'+txt+'</a></li>';
    $('#toc ul').append(alink); 
  });
  for (var i = 0; (typeof my !== 'undefined') && (i < my.gadgets.length); i++) {
    var gadg = my.gadgets[i].name;
    $('#toc ul').append('<li><a href="#remote_iframe_'+i+'_title">'+gadg+'</a></li>');
  }
  if ($('#toc ul li').length < 2 ) {
    $('#toc').hide();
  } 

//remove duplicate pubs heading
  $('.sectionHeader:contains("Publications")').hide(); 

//remove border for 1st section
  $('.PropertyItemHeader').first().css('border','none'); 
     

});
