$(document).ready(function(){
// login menu relocation 
  $('#navbarsearch').appendTo('#suckerfishmenu');
  $('#ctl00_ContentActive_rptActive_ctl00_ctl00_panelMenu ul li:nth-child(3)').insertAfter('#about').addClass('edit');
  $('#ctl00_ContentActive_rptActive_ctl01_ctl00_panelMenu ul li:nth-child(3)').insertAfter('#about').addClass('edit');
  $('#suckerfishmenu ul.menu li.edit').append('<ul id="editdropdown"></ul>');
  for(var index = 2; index < $('#ctl00_ContentActive_rptActive_ctl00_ctl00_panelMenu ul li').length; index++){    
    $('#ctl00_ContentActive_rptActive_ctl00_ctl00_panelMenu ul li').eq(index).clone().appendTo('#editdropdown');    
  }
  for(var index = 2; index < $('#ctl00_ContentActive_rptActive_ctl01_ctl00_panelMenu ul li').length; index++){    
    $('#ctl00_ContentActive_rptActive_ctl01_ctl00_panelMenu ul li').eq(index).clone().appendTo('#editdropdown');    
  }


//show navbar search for results
//  var url = location.pathname;
//  if ("url:contains('x?')") {
//   $('#navbarsearch').show();
//  }

});
