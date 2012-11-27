$(document).ready(function(){
// login menu relocation 
  $('#ctl00_ContentActive_rptActive_ctl00_ctl00_panelMenu ul li:nth-child(3)').insertAfter('#about').addClass('edit');
  $('#ctl00_ContentActive_rptActive_ctl01_ctl00_panelMenu ul li:nth-child(3)').insertAfter('#about').addClass('edit');
  $('#suckerfishmenu ul.menu li.edit').append('<ul id="editdropdown"></ul>');
  for(var index = 2; index < $('#ctl00_ContentActive_rptActive_ctl00_ctl00_panelMenu ul li').length; index++){    
    $('#ctl00_ContentActive_rptActive_ctl00_ctl00_panelMenu ul li').eq(index).clone().appendTo('#editdropdown');    
  }
  for(var index = 2; index < $('#ctl00_ContentActive_rptActive_ctl01_ctl00_panelMenu ul li').length; index++){    
    $('#ctl00_ContentActive_rptActive_ctl01_ctl00_panelMenu ul li').eq(index).clone().appendTo('#editdropdown');    
  }

// move navbarsearch, hide on main search page
  $('#navbarsearch').appendTo('#suckerfishmenu');
  if ($('.searchSection').length) {
    $('#navbarsearch').hide();
  }

});
