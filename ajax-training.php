<?php
session_start();
extract($_GET);
include_once('inc/db_trans.inc.php');
include_once('function/training_fun.php');
$tr_cd=isset($_GET['tr_cd'])?decode($_GET['tr_cd']):"";
$act=isset($_GET['act'])?$_GET['act']:"";
if($tr_cd!='' && $act=='del')
{
	$cnt=check_training_delete(sprintf("%02d",$tr_cd));
	if($cnt==0)
	{
		$ret=delete_training_type(sprintf("%02d",$tr_cd));
		if($ret==1)
			echo "<script>location.replace('training-type-master.php');</script>";
	}
	else
	{
		echo "<script>alert('This training type already used.');</script>";
		echo "<script>location.replace('training-type-master.php');</script>";
	}
}

//=====================Training Area of Interest=========================
$area=isset($_GET['area'])?$_GET['area']:"";
$subdivision=isset($_GET['subdivision'])?$_GET['subdivision']:"";
$opn=isset($_GET['opn'])?$_GET['opn']:"";
if($opn=='areadtl')
{
	if($area!='' && $subdivision!='')
	{
		if($area=='Subdivision of PP')
		{
			echo "<td align='left'><span class='error'>*</span>Subdivision</td><td align='left'>\n";
			//echo "<select id='area' style='width:220px;'><option value='$subdivision'>".$_SESSION['subdiv_name']."</option></select>\n";
			echo "<select id='area' name='area' style='width:220px;'>\n";
			$rsSub=fatch_subdiv_from_personal_trainingpp_ag_subdiv($subdivision);
			$num_rows=rowCount($rsSub);
			if($num_rows>0)
			{
				for($i=1;$i<=$num_rows;$i++)
				{
					$rowSub=getRows($rsSub);
					echo "<option value='$rowSub[0]'>$rowSub[1]</option>\n";
					$rowSub=NULL;
				}
			}
			$rsSub=NULL;
			$num_rows=0;
			unset($rowSub,$rsSub,$num_rows);
			echo "</select></td>\n";
		}
		if($area=='Alloted Subdivision')
		{
			echo "<td align='left'><span class='error'>*</span>Alloted Subdivision</td><td align='left'>\n";
			echo "<select id='area' name='area' style='width:220px;'>\n";
			$rsForSub=fatch_forsubdiv_from_personal_trainingpp_ag_subdiv($subdivision);
			$num_rows=rowCount($rsForSub);
			if($num_rows>0)
			{
				for($i=1;$i<=$num_rows;$i++)
				{
					$rowForSub=getRows($rsForSub);
					echo "<option value='$rowForSub[0]'>$rowForSub[1]</option>\n";
					$rowForSub=NULL;
				}
			}
			$rsForSub=NULL;
			$num_rows=0;
			unset($rowForSub,$rsForSub,$num_rows);
			echo "</select></td>\n";
		}
		if($area=='Alloted PC')
		{
			echo "<td align='left'><span class='error'>*</span>Alloted PC</td><td align='left'>\n";
			echo "<select id='area' name='area' style='width:220px;'>\n";
			$rsForPC=fatch_forpc_from_personal_trainingpp_ag_subdiv($subdivision);
			$num_rows=rowCount($rsForPC);
			if($num_rows>0)
			{
				for($i=1;$i<=$num_rows;$i++)
				{
					$rowForPC=getRows($rsForPC);
					echo "<option value='$rowForPC[0]'>$rowForPC[1]</option>\n";
					$rowForPC=NULL;
				}
			}
			$rsForPC=NULL;
			$num_rows=0;
			unset($rowForPC,$rsForPC,$num_rows);
			echo "</select></td>\n";
		}
		if($area=='Assembly of Temporary Address')
		{
			echo "<td align='left'><span class='error'>*</span>Temporary Assembly</td><td align='left'>\n";
			echo "<select id='area' name='area' style='width:220px;'>\n";
			$rs_tempAss=fatch_tempass_from_personal_trainingpp_ag_subdiv($subdivision);
			$num_rows=rowCount($rs_tempAss);
			if($num_rows>0)
			{
				for($i=1;$i<=$num_rows;$i++)
				{
					$row_tempAss=getRows($rs_tempAss);
					echo "<option value='$row_tempAss[0]'>$row_tempAss[1]</option>\n";
					$row_tempAss=NULL;
				}
			}
			$rs_tempAss=NULL;
			$num_rows=0;
			unset($rs_tempAss,$row_tempAss,$num_rows);
			echo "</select></td>\n";
		}
		if($area=='Assembly of Permanent Address')
		{
			echo "<td align='left'><span class='error'>*</span>Permanent Assembly</td><td align='left'>\n";
			echo "<select id='area' name='area' style='width:220px;'>\n";
			$rs_permAss=fatch_permass_from_personal_trainingpp_ag_subdiv($subdivision);
			$num_rows=rowCount($rs_permAss);
			if($num_rows>0)
			{
				for($i=1;$i<=$num_rows;$i++)
				{
					$row_permAss=getRows($rs_permAss);
					echo "<option value='$row_permAss[0]'>$row_permAss[1]</option>\n";
					$row_permAss=NULL;
				}
			}
			$rs_permAss=NULL;
			$num_rows=0;
			unset($rs_permAss,$row_permAss,$num_rows);
			echo "</select></td>\n";
		}
		if($area=='Assembly of Office Address')
		{
			echo "<td align='left'><span class='error'>*</span>Office Assembly</td><td align='left'>\n";
			echo "<select id='area' name='area' style='width:220px;'>\n";
			$rs_permAss=fatch_ofcass_from_personal_trainingpp_ag_subdiv($subdivision);
			$num_rows=rowCount($rs_permAss);
			if($num_rows>0)
			{
				for($i=1;$i<=$num_rows;$i++)
				{
					$row_permAss=getRows($rs_permAss);
					echo "<option value='$row_permAss[0]'>$row_permAss[1]</option>\n";
					$row_permAss=NULL;
				}
			}
			$rs_permAss=NULL;
			$num_rows=0;
			unset($rs_permAss,$row_permAss,$num_rows);
			echo "</select></td>\n";
		}
	}
}
//========== training_tobe_alloted ==========
$venue=isset($_GET['venue'])?$_GET['venue']:"";
if($opn=='venuecap')
{	
	if($venue!='' || $venue!=NULL)
	{
		$v_Cap=0;
		$rsCap=venue_capacity($venue);
		$num_rows_cap=rowCount($rsCap);
		if($num_rows_cap>0)
		{
			$rowCap=getRows($rsCap);
			echo "Venue Capacity: ".$rowCap['maximumcapacity'];
			$v_Cap=$v_Cap+$rowCap['maximumcapacity'];
		}
		else
			echo "";
		
		echo "<input type='hidden' id='v_Cap' name='v_Cap' value='$v_Cap' />";
		unset($rowCap,$rsCap);
	}
}

$training_venue=isset($_GET['training_venue'])?$_GET['training_venue']:"";
$tr_type=isset($_GET['tr_type'])?$_GET['tr_type']:"";
$training_dt=isset($_GET['training_dt'])?$_GET['training_dt']:"";
$training_time=isset($_GET['training_time'])?$_GET['training_time']:"";
if($opn=='trnalloted')
{
	if($training_venue!='' && $tr_type!='')
	{
		$alloted=0;
		$rsTraining=training_alloted($training_venue,$tr_type,$training_dt,$training_time);
		$num_rows_Training=rowCount($rsTraining);
		if($num_rows_Training>0)
		{
			echo "<tr><td align='center' colspan='2'><b>For Selected Venue & Selected Training Type Training is scheduled</b></td></tr>";
			echo "<tr><td>&nbsp;</td><td align='left'>Date: ".$training_dt." &amp; Time: ".$training_time."</td>";
			echo "<tr><td>&nbsp;</td><td align='left'>";
			for($i=0;$i<$num_rows_Training;$i++)
			{
				$rowTraining=getRows($rsTraining);
				
				echo $rowTraining['post_stat'].": ".$rowTraining['total']."; ";
				$alloted=$alloted+$rowTraining['total'];
				$rowTraining=NULL;
			}
			echo "</td></tr>";
		}
		else
			echo "";
		
		echo "<input type='hidden' id='trn_alloted' name='trn_alloted' value='$alloted' />";
		unset($rowTraining,$rsTraining,$num_rows_Training);
	}
}
$subdiv=isset($_GET['subdiv'])?$_GET['subdiv']:"";
if($opn=='trnreq')
{
	if($subdiv!='' && $subdiv!=NULL)
	{
		$rsTr=fatch_training_type('');
		for($k=0;$k<=rowCount($rsTr);$k++)
		{
			$rowTr=getRows($rsTr);
			echo "<tr>";
			echo "<td align='left' width='30%'>".$rowTr['training_desc']."</td>\n";
			echo "<td align='left'>";
			$rsTrReq=training_required($subdiv,$rowTr['training_code']);
			$num_rows_TrReq=rowCount($rsTrReq);
			if($num_rows_TrReq>0)
			{
				
				for($i=0;$i<$num_rows_TrReq;$i++)
				{
					$rowTrReq=getRows($rsTrReq);
					echo $rowTrReq['post_stat'].": ".$rowTrReq['total'].";&nbsp;&nbsp;";
					$rowTrReq=NULL;
				}
			}
			else
				echo "";
			
			echo "</td>";
			echo "</tr>";
			unset($rsSelectedPP,$num_rows_TrReq);
			$rowTr=NULL;
		}
		unset($rsTr,$rowTr);
	}
}
if($opn=='trnalloted_forsub')
{
	if($subdiv!='' && $subdiv!=NULL)
	{
		$rsTr=fatch_training_type('');
		for($k=0;$k<=rowCount($rsTr);$k++)
		{
			$rowTr=getRows($rsTr);
			echo "<tr>";
			echo "<td align='left' width='30%'>".$rowTr['training_desc']."</td>\n";
			echo "<td align='left'>";
			$rsTrReq=training_alloted_forsub($subdiv,$rowTr['training_code']);
			$num_rows_TrReq=rowCount($rsTrReq);
			if($num_rows_TrReq>0)
			{
				
				for($i=0;$i<$num_rows_TrReq;$i++)
				{
					$rowTrReq=getRows($rsTrReq);
					echo $rowTrReq['post_stat'].": ".$rowTrReq['total'].";&nbsp;&nbsp;";
					$rowTrReq=NULL;
				}
			}
			else
				echo "";
			
			echo "</td>";
			echo "</tr>";
			unset($rsSelectedPP,$num_rows_TrReq);
			$rowTr=NULL;
		}
		unset($rsTr,$rowTr);
	}
}
//===================== Member Available for Area & Post Status =========================
$post_stat=isset($_GET['post_stat'])?$_GET['post_stat']:"";
//$subdivision=$_GET['subdivision'];
$areapref=isset($_GET['areapref'])?$_GET['areapref']:"";
//$area=$_GET['area'];
if($opn=='membavl')
{
	if($areapref=='Subdivision of PP')
		$areapref='1';
	if($areapref=='Alloted Subdivision')
		$areapref='2';
	if($areapref=='Alloted PC')
		$areapref='3';
	if($areapref=='Assembly of Temporary Address')
		$areapref='4';
	if($areapref=='Assembly of Permanent Address')
		$areapref='5';
	if($areapref=='Assembly of Office Address')
		$areapref='6';
	if($post_stat!='' && $subdivision!='' && $areapref!='' && $area!='' && $tr_type!='')
	{
		$rsMembAvl=member_available($post_stat,$subdivision,$areapref,$area,$tr_type);
		$num_rows_MembAvl=rowCount($rsMembAvl);
		$rowMembAvl=getRows($rsMembAvl);
		if($num_rows_MembAvl>0)
		{		
			echo "Member Available: <span id='memb_avl'>".$rowMembAvl['memb_avl']."</span>";
		}
		else
			echo "";
		
		$rowMembAvl=NULL;
		$rsMembAvl=NULL;
		unset($rsMembAvl,$rowMembAvl,$num_rows_MembAvl);
	}
}
//=======================Training Attendance===========================
if($opn=='venue')
{
	$sub_div=$_GET['sub_div'];
		echo "<select name='training_venue' id='training_venue' style='width:200px;' onchange='return training_type_change();'>\n
	    <option value='0'>-Select Training Venue-</option>\n";

			$rsTrainingVenue=fatch_training_venue_ag_subdiv($sub_div);
			$num_rows=rowCount($rsTrainingVenue);
			if($num_rows>0)
			{
				for($i=1;$i<=$num_rows;$i++)
				{
					$rowTrainingVenue=getRows($rsTrainingVenue);
					echo "<option value='$rowTrainingVenue[0]'>$rowTrainingVenue[1]</option>\n";
					$rowTrainingVenue=NULL;
				}
			}
			$rsTrainingVenue=NULL;
			$num_rows=0;
			unset($rsTrainingVenue,$rowTrainingVenue,$num_rows);
	    echo "</select>\n";
}
if($opn=='date_time')
{
	$trn_type=$_GET['trn_type'];
	$venue=$_GET['venue'];
	
	echo "<select name='trn_dt_time' id='trn_dt_time' style='width:200px;' onchange='return trn_dt_time_change(this.value);'>\n
	<option value='0'>-Select Training Date Time-</option>\n";

		$rsTrainingDtTime=fatch_training_datetime($trn_type,$venue);
		$num_rows=rowCount($rsTrainingDtTime);
		if($num_rows>0)
		{
			for($i=1;$i<=$num_rows;$i++)
			{
				$rowTrainingDtTime=getRows($rsTrainingDtTime);
				echo "<option value='$rowTrainingDtTime[0]'>$rowTrainingDtTime[1]</option>\n";
				$rowTrainingVenue=NULL;
			}
		}
		$rsTrainingDtTime=NULL;
		$num_rows=0;
		unset($rsTrainingDtTime,$rowTrainingVenue,$num_rows);
   echo "</select>\n";
}
if($opn=='personnel')
{
	$schedule_cd=$_GET['sch'];

	$rsPer=fatch_personnel_ag_sch($schedule_cd);
	$num_rows=rowCount($rsPer);
	if($num_rows>0)
	{
		for($i=1;$i<=$num_rows;$i++)
		{
			$rowPer=getRows($rsPer);
			echo "<tr><td align='center' width='25%'>$rowPer[0]<input type='hidden' name='hidId$i' value='$rowPer[0]' /></td><td align='left' width='65%'>$rowPer[1]</td><td align='center' width='10%'><input type='checkbox' name='chkbox$i' /></td></tr>";
			$rowPer=NULL;
		}
	}
	$rsPer=NULL;
	$num_rows=0;
	unset($rsPer,$rowPer,$num_rows);
}
if($opn=='tal')
{
	include_once('function/pagination.php');
	global $subdivision; global $venuename; global $usercode;
	$sub_div=isset($_GET["sub_div"])?$_GET["sub_div"]:"";
	$training_type=isset($_GET["training_type"])?$_GET["training_type"]:"";
	$training_venue=isset($_GET["training_venue"])?$_GET["training_venue"]:"";
	$frmdt=isset($_GET["frmdt"])?$_GET["frmdt"]:"";
	$todt=isset($_GET["todt"])?$_GET["todt"]:"";
	
	$usercode=isset($_SESSION)?$_SESSION['user_cd']:"";
	$delcode=isset($_GET["delcode"])?$_GET["delcode"]:"";
	if($delcode!="" && $delcode!=NULL)
	{
//		$total=chk_trainingvenue(decode($delcode));
//		if($total=="0")
//		{
			$aa=delete_training_allocation(decode($delcode));
			if($aa>0)
				echo "<span class='alert-success'>Record deleted successfully</span><br /><br />\n";
//		}
//		else
//		{
//			echo "<span class='error'>Record already used</span><br />\n";
//		}
	}
	
	$rstraining_allocation_list_T=fatch_training_allocation_list($sub_div,$training_type,$training_venue,$frmdt,$todt,$usercode);
	$num_rows_T = rowCount($rstraining_allocation_list_T);
	
	$items = 50; // number of items per page.
	$all = $_GET['a'];
	if($all == "all")
	{
		$items = $num_rows_T;
	}
	$nrpage_amount = $num_rows_T/$items;
	$page_amount = ceil($num_rows_T/$items);
	$page_amount = $page_amount-1;
	$page = $_GET['p'];
	$section='training-allocation-list';
	if($page < "1")
	{
		$page = "0";
	}
	$p_num = $items*$page;
	
	$rstraining_alloc_list=fatch_training_allocation_listAct($sub_div,$training_type,$training_venue,$frmdt,$todt,$usercode,$p_num,$items);
	$num_rows = rowCount($rstraining_alloc_list);
	if($num_rows<1)
	{
		echo "No record found";
		//echo $officeid.",".$officename.",".$frmdt.",".$todt.",".$usercode;
	}
	else
	{
		echo "<table width='100%' cellpadding='0' cellspacing='0' border='0' id='table1'>\n";
		echo "<tr height='30px'><th>Sl.</th><th>Training Venue</th>
				<th>Date</th>
				<th>Time</th>
				<th>Post Status</th>
				<th>No of PP</th>
				<th>Delete</th></tr>\n";
		for($i=1;$i<=$num_rows;$i++)
		{
		  $rowTraining_alloc_list=getRows($rstraining_alloc_list);
		  $schedule_code='"'.encode($rowTraining_alloc_list['schedule_code']).'"';
		  echo "<tr><td align='right' width='4%'>$i.</td><td align='left' width='30%'>$rowTraining_alloc_list[venuename]</td><td width='15%' align='center'>$rowTraining_alloc_list[training_dt]</td>";
		  echo "<td width='15%' align='left'>$rowTraining_alloc_list[training_time]</td><td width='15%' align='left'>$rowTraining_alloc_list[poststatus]</td>";
		  echo "<td width='10%' align='left'>$rowTraining_alloc_list[no_pp]</td>";
		  echo "<td align='center' width='5%'><img src='images/delete.png' alt='' height='20px'";
		  if($rowTraining_alloc_list['usercode']==$usercode)
		  	echo " onclick='javascript:delete_training_allocation($schedule_code);' ";
		  else
	  		echo " onclick='alert(\"You do not have sufficient privilege to do the operation\");'";
		  echo " /></td></tr>\n";
		  $rowTraining_alloc_list=NULL;
		}
		echo "</table>\n";
		paging();
	}
	unset($rstraining_alloc_list,$num_rows,$rowTraining_alloc_list);
}
?>