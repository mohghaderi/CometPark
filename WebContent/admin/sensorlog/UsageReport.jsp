<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Usage Report</title>

<link rel="stylesheet" type="text/css" media="screen" href="../../themes/redmond/jquery-ui-1.8.2.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../../themes/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../../themes/ui.multiselect.css" />

<script src="../../plugins/jquery/jquery.js" type="text/javascript"></script>
<script src="../../plugins/jquery/jquery-ui-custom.min.js" type="text/javascript"></script>
<script src="../../plugins/jquery/jquery.layout.js" type="text/javascript"></script>

<script src="../../plugins/jqGrid/js/i18n/grid.locale-en.js" type="text/javascript"></script>
<script src="../../plugins/jqGrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$.jgrid.no_legacy_api = true;
	$.jgrid.useJSON = true;
</script>

<!-- <script src="../../plugins/jquery/ui.multiselect.js" type="text/javascript"></script> -->
<!-- <script src="../../plugins/jquery/jquery.tablednd.js" type="text/javascript"></script> -->
<!-- <script src="../../plugins/jquery/jquery.contextmenu.js" type="text/javascript"></script> -->


<script type="text/javascript">
	$.jgrid.no_legacy_api = true;
	$.jgrid.useJSON = true;
</script>


<script type="text/javascript">

	jQuery(document).ready(function(){
		
		jQuery("#list2").jqGrid({
		   	url:'UsageReportJsonView.jsp',
			datatype: "json",
		   	colNames:['Log Date','Sensor ID', 'Vacancy'],
		   	colModel:[
		   		{name:'LogDate',index:'LogDate', width:150, sortable:false},
		   		{name:'SensorId',index:'SensorId', width:90, sortable:false},
		   		{name:'NewIsVacant',index:'NewIsVacant', width:100, sortable:false}
		   	],
		   	rowNum:1000,
		   	rowList:[1000],
		   	//pager: '#pager2',
		   	sortname: 'id',
		    viewrecords: true,
		    width: 500,
			height: "100%",
		    caption:"Usage Report"
		});
		
	});


</script>


</head>
<body>
	<table id="list2"></table>
	<div id="pager2"></div>
</body>
</html>