<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchResults.ascx.cs" Inherits="Profiles.Search.Modules.SearchResults.SearchResults" %>
<asp:Literal runat="server" ID="litEverythingResults"></asp:Literal>

<style type="text/css">
.backLink { display: none; }
.profilesPage .profilesPageColumnLeft { display: none; }
.profiles .profilesContentMain { width: 680px; margin: 10px 60px 0 10px !important; }
.profiles .profilesContentPassive { width: 192px; padding: 4px 20px 0 0; width: 140px\9; }
#tblSearchResults { width: 680px; margin-top: 10px\9; }
/* get rid of grey background on everything search results for IE */
.profiles .profilesPage { background-color: #FFF\9; width: 972px\9; padding-left: 8px\9; padding-bottom: 10px\9; margin-bottom: -10px\9; }
* html .profiles .profilesContentMain { margin: 10px 0 0 10px !important; }
*+html .profiles .profilesContentMain { margin: 10px 0 0 10px !important; }
* html .profiles .profilesContentPassive { width: 152px; padding: 4px 0 0 0; }
*+html .profiles .profilesContentPassive { width: 152px; padding: 4px 0 0 0; }
* html .criteria { float: right; margin: 0 -20px; }
*+html .criteria { float: right; margin: 0 -20px; }
* html .profiles .profilesFooter { margin-top: -40px; }
*+html .profiles .profilesFooter { margin-top: -40px; }
.profiles .profilesContentPassive { float: right\9; }  /* fix IE9 layout */
* html .profiles #ctl00_divPageColumnRightCenter { width: 680px; }  
*+html .profiles #ctl00_divPageColumnRightCenter { width: 680px; }  
</style>



<script type="text/javascript">
$(document).ready(function(){
//  $('#filters').insertAfter('#filtersContainer span');
  $('<div class="passiveSectionHead" style="padding:4px 0">Search Results Filters</div>').prependTo('#filters');

  //show full right column in IE8 (this breaks IE9)
  if ($.browser.msie && ($.browser.version=="8.0")) {
    $('.profiles #ctl00_divPageColumnRightCenter').css('width','960px');
  }

  //everything search results layout broken in IE6-7
  if ($.browser.msie && ($.browser.version=="6.0" || $.browser.version=="7.0")) {
    $('.listTable').insertBefore('.searchSection');
//    $('#filtersContainer').insertBefore('.listTable');
    $('.listTablePagination').insertAfter('.listTable');
    $('.profilesContentPassive').prependTo('.profilesPage').addClass('criteria');
    $('.criteria').children().css('white-space','normal');
  }

});
</script>