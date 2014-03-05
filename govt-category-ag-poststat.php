<?php
session_start();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Government Category against Post Status</title>
<?php
include('header/header.php');
?>
<script type="text/javascript" language="javascript">
function district_change(str)
{
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
		document.getElementById("subdiv_result").innerHTML=xmlhttp.responseText;
		}
	  }
	xmlhttp.open("GET","ajax-master.php?dist="+str+"&opn=subdiv",true);
	xmlhttp.send();
}
function validate()
{
	var district=document.getElementById('district');
	if(district.value=='0')
	{
		document.getElementById('msg').innerHTML="Select District";
		district.focus();
		return false;
	}
}
</script>
</head>

<body>
<div width="100%" align="center">
<table cellpadding="2" cellspacing="0" border="0" width="100%">
<tr><td align="center"><table width="1000px" class="table_blue">
	<tr><td align="center"><div width="50%" class="h2"><?php print isset($environment)?$environment:""; ?></div></td></tr>
<tr><td align="center"><?php print $district; ?> DISTRICT</td></tr>
<tr>
  <td align="center">GOVT. CATEGORY AGAINST POST STATUS</td></tr>
<tr><td align="center"><form method="post" name="form1" id="form1" target="_blank" action="reports/govt-cat-ag-post-stat-report.php">
    <table width="60%" class="form" cellpadding="0">
	<tr><td align="center" colspan="2"><img src="images/blank.gif" alt="" height="2px" /></td></tr>
    <tr><td height="18px" colspan="2" align="center"><?php print isset($msg)?$msg:""; ?><span id="msg" class="error"></span></td></tr>
    <tr><td colspan="2"><img src="images/blank.gif" alt="" height="5px" /></td></tr>
    <tr>
	  <td align="left">District</td>
	  <td align="left"><select name="district" id="district" style="width:240px;" onchange="javascript:return district_change(this.value);">
      						<option value="0">-Select District-</option>
                            <?php 	include_once("function/master_fun.php");
									$rsDist=fatch_district_master('');
									$num_rows=rowCount($rsDist);
									if($num_rows>0)
									{
										for($i=1;$i<=$num_rows;$i++)
										{
											$rowDist=getRows($rsDist);
											echo "<option value='$rowDist[0]'>$rowDist[1]</option>";
										}
									}
									$rsBn=null;
									$num_rows=0;
									$rowSubDiv=null;
							?>
      				</select></td></tr>
	<tr>
	  <td align="left">Subdivision</td>
	  <td align="left" id="subdiv_result"><select name="Subdivision" id="Subdivision" style="width:240px;">
      				</select></td>
    </tr>   
    <tr><td colspan="2"><img src="images/blank.gif" alt="" height="2px" /></td></tr>
    <tr>
      <td colspan="2" align="center"><input type="submit" name="submit" id="submit" value="Submit" class="button" onclick="return validate();" /></td></tr>
      <tr><td colspan="2" align="center"><img src="images/blank.gif" alt="" height="5px" /></td></tr>
</table>
</form>
</td></tr></table>
</td></tr>
</table>
</div>
</body>
</html>