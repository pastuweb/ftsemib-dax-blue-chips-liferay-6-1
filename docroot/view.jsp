<%
/**
 * Copyright (c) Pasturenzi Francesco
 * This is the VIEW of the Portlet.
 */
%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>
<%@ taglib uri="http://liferay.com/tld/security" prefix="liferay-security" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ taglib uri="http://liferay.com/tld/util" prefix="liferay-util" %>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page import="javax.portlet.PortletURL" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.appuntivarinet.*" %>

<link type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet" />
<portlet:defineObjects />
<liferay-theme:defineObjects />
<%


List<String> listaFtesMib = (List<String>) request.getAttribute("listaFtesMib");
List<String> listaDax = (List<String>) request.getAttribute("listaDax");


String[] indicator = new String[4];
String spanRSI = new String("");
String spanADX = new String("");
String spanSTOC = new String("");
String spanSTOCRSI = new String("");
String[] indicatorRSI = new String[2];
String valRSI = new String("");
String azioneRSI = new String("");
String[] indicatorSTOC = new String[2];
String valSTOC = new String("");
String azioneSTOC = new String("");
String[] indicatorSTOCRSI = new String[2];
String valSTOCRSI = new String("");
String azioneSTOCRSI = new String("");
String[] indicatorADX = new String[2];
String valADX = new String("");
String azioneADX = new String("");
%>
	<div id="wrapper" style="width:1102px;margin:auto;position:relative">
			
			<div style="text-align:center;width:1102px;height:50px;padding:3px;margin:auto;background:#000000;position:relative;">
				<a href="http://http://it.investing.com" target="_blank">
					<img src="<%=request.getContextPath() %>/images/investing-com-logo.png" style="width:300px;float:left;margin-top:-15px;" alt="Investing.com logo" title="Investing.com"/>
				</a>
				<div style="position:absolute;top:5px;right:10px;color:#FFFFFF;font-weight:bold;">
					developed by 
					<a href="http://wwww.pastuweb.com" target="_blank">
						 <img src="<%=request.getContextPath() %>/images/pastuweb.png" style="width:40px;" alt="Pastuweb logo" title="Pastuweb"/>
					</a>
				</div>
				<p style="width:700px;margin-left:370px;position:relative;color:#FFFFFF;font-weight:bold;font-size:16px;">
				Componenti con Indicatori di <span style="color:#FF0000;">FTSE-MIB</span> e <span style="color:#FF0000;">DAX</span> by <a href="#">Investing.com</a>
				</p>
				<span style="clear:left;"></span>
			</div>
			<div>
				<table border="1" cellpadding="1" cellspacing="1" style="width:1110px;">
	<tbody>
		<tr>
			<td>
				&nbsp;</td>
				
			<%
			String[] strFTSE = listaFtesMib.get(0).split("==");
			String[] summarFTSE = strFTSE[0].split("::");
			String timeParsing = strFTSE[1].split(" ")[0]+" (giornaliero)";
			String toDoFtse = strFTSE[2];
			String spanFTSE = new String("");
			String valFTSE = summarFTSE[1];
			String pipFTSE = summarFTSE[2];
			String percFTSE = summarFTSE[3];
			if(Float.parseFloat(pipFTSE.replace(",",".")) < 0){
				spanFTSE = "#FF0000";
			}else{
				spanFTSE = "#13c646";
			}

			
			String[] strDAX = listaDax.get(0).split("==");
			String[] summarDAX = strDAX[0].split("::");
			String toDoDax = strDAX[2];
			String spanDAX = new String("");
			String valDAX = summarDAX[1];
			String pipDAX = summarDAX[2];
			String percDAX = summarDAX[3];
			if(Float.parseFloat(pipDAX.replace(",",".")) < 0){
				spanDAX = "#FF0000";
			}else{
				spanDAX = "#13c646";
			}
			
			%>
			
			<td  style="text-align:center;color:#FF0000;font-weight:bold">
				<a href="http://it.investing.com/indices/it-mib-40-technical?period=86400" style="text-decoration:none;font-size:18px;font-weight:bold;color:<%=spanFTSE%>;" target="_blank">FTSE MIB</a> <span style="color:<%=spanFTSE%>"><%=valFTSE %></span> [<span style="color:<%=spanFTSE%>"><%=pipFTSE %></span><span style="font-size:18px;font-weight:bold;color:<%=spanFTSE%>"><%=percFTSE%></span>]</td>
			<td  style="text-align:center;color:#FF0000;font-weight:bold">
				<a href="http://it.investing.com/indices/germany-30-technical?period=86400" style="text-decoration:none;font-size:18px;font-weight:bold;color:<%=spanDAX%>;" target="_blank">DAX</a> <span style="color:<%=spanDAX%>"><%=valDAX %></span> [<span style="color:<%=spanDAX%>"><%=pipDAX %></span><span style="font-size:18px;font-weight:bold;color:<%=spanDAX%>"><%=percDAX%></span>]</td>
			<td>
				&nbsp;</td>
		</tr>
		<tr>
			<td>
				&nbsp;</td>
			<td style="text-align:center;font-weight:bold;font-size:15px;">
				<%=timeParsing %></td>
			<td  style="text-align:center;font-weight:bold;font-size:15px;">
				<%=timeParsing %></td>
			<td>
				&nbsp;</td>
		</tr>
		<tr>
			<td style="text-align:center;color:#0000FF;font-weight:bold">
				Sottostante</td>
			<td>
				<table border="1" cellpadding="0" cellspacing="0" style="width:460px;border-collapse:collapse;">
					<tbody>
						<tr style="font-weight:bold;width:460px;">
							<td style="padding:2px;width:110px;">
								RSI(14)</td>
							<td style="padding:2px;width:110px;">
								STOC(9,6)</td>
							<td style="padding:2px;width:110px;">
								STOCRSI(14)</td>
							<td style="padding:2px;width:110px;">
								ADX(14)</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td>
				<table border="1" cellpadding="0" cellspacing="0" style="width:460px;border-collapse:collapse;">
					<tbody>
						<tr style="font-weight:bold;width:460px;">
							<td style="padding:2px;width:110px;">
								RSI(14)</td>
							<td style="padding:2px;width:110px;">
								STOCH(9,6)</td>
							<td style="padding:2px;width:110px;">
								STOCHRSI(14)</td>
							<td style="padding:2px;width:110px;">
								ADX(14)</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td style="text-align:center;color:#0000FF;font-weight:bold">
				Sottostante</td>
		</tr>
		<tr >

			<%
			String[] strENI = listaFtesMib.get(1).split("==");

			String toDoEni = strENI[2];
			indicator = strENI[1].split("::");
			indicatorRSI = indicator[0].split(":");
			valRSI = indicatorRSI[1];
			azioneRSI = indicatorRSI[2];
			if(azioneRSI.equalsIgnoreCase("VENDI")){
				spanRSI = "#FF0000";
			}else if(azioneRSI.equalsIgnoreCase("COMPRA")){
				spanRSI = "#13c646";
			}else{
				spanRSI = "#000000";
			}
			
			indicatorSTOC = indicator[1].split(":");
			valSTOC = indicatorSTOC[1];
			azioneSTOC = indicatorSTOC[2];
			if(azioneSTOC.equalsIgnoreCase("VENDI")){
				spanSTOC = "#FF0000";
			}else if(azioneSTOC.equalsIgnoreCase("COMPRA")){
				spanSTOC = "#13c646";
			}else{
				spanSTOC = "#000000";
			}
			
			indicatorSTOCRSI = indicator[2].split(":");
			valSTOCRSI = indicatorSTOCRSI[1];
			azioneSTOCRSI = indicatorSTOCRSI[2];
			if(azioneSTOCRSI.equalsIgnoreCase("VENDI")){
				spanSTOCRSI = "#FF0000";
			}else if(azioneSTOCRSI.equalsIgnoreCase("COMPRA")){
				spanSTOCRSI = "#13c646";
			}else{
				spanSTOCRSI = "#000000";
			}
			
			indicatorADX = indicator[3].split(":");
			valADX = indicatorADX[1];
			azioneADX = indicatorADX[2];
			if(azioneADX.equalsIgnoreCase("VENDI")){
				spanADX = "#FF0000";
			}else if(azioneADX.equalsIgnoreCase("COMPRA")){
				spanADX = "#13c646";
			}else{
				spanADX = "#000000";
			}

			%>
			<td>
				<a href="http://it.investing.com/equities/eni-technical?period=86400" target="_blak">ENI</a> [62G]</td>
			<td>
				<table border="1" cellpadding="0" cellspacing="0" style="width:460px;border-collapse:collapse;">
					<tbody>
						<tr class="componente"  style="width:460px;">
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valRSI %> [<span style="color:<%=spanRSI%>"><%=azioneRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOC %> [<span style="color:<%=spanSTOC%>"><%=azioneSTOC %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOCRSI %> [<span style="color:<%=spanSTOCRSI%>"><%=azioneSTOCRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valADX %> [<span style="color:<%=spanADX%>"><%=azioneADX %></span>]</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td>
			<%
			String[] strEON = listaDax.get(1).split("==");
			
			String toDoEON = strEON[2];
			indicator = strEON[1].split("::");
			indicatorRSI = indicator[0].split(":");
			valRSI = indicatorRSI[1];
			azioneRSI = indicatorRSI[2];
			if(azioneRSI.equalsIgnoreCase("VENDI")){
				spanRSI = "#FF0000";
			}else if(azioneRSI.equalsIgnoreCase("COMPRA")){
				spanRSI = "#13c646";
			}else{
				spanRSI = "#000000";
			}
			
			indicatorSTOC = indicator[1].split(":");
			valSTOC = indicatorSTOC[1];
			azioneSTOC = indicatorSTOC[2];
			if(azioneSTOC.equalsIgnoreCase("VENDI")){
				spanSTOC = "#FF0000";
			}else if(azioneSTOC.equalsIgnoreCase("COMPRA")){
				spanSTOC = "#13c646";
			}else{
				spanSTOC = "#000000";
			}
			
			indicatorSTOCRSI = indicator[2].split(":");
			valSTOCRSI = indicatorSTOCRSI[1];
			azioneSTOCRSI = indicatorSTOCRSI[2];
			if(azioneSTOCRSI.equalsIgnoreCase("VENDI")){
				spanSTOCRSI = "#FF0000";
			}else if(azioneSTOCRSI.equalsIgnoreCase("COMPRA")){
				spanSTOCRSI = "#13c646";
			}else{
				spanSTOCRSI = "#000000";
			}
			
			indicatorADX = indicator[3].split(":");
			valADX = indicatorADX[1];
			azioneADX = indicatorADX[2];
			if(azioneADX.equalsIgnoreCase("VENDI")){
				spanADX = "#FF0000";
			}else if(azioneADX.equalsIgnoreCase("COMPRA")){
				spanADX = "#13c646";
			}else{
				spanADX = "#000000";
			}


			%>
				<table border="1" cellpadding="0" cellspacing="0" style="width:460px;border-collapse:collapse;">
					<tbody>
						<tr class="componente"  style="width:460px;">
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valRSI %> [<span style="color:<%=spanRSI%>"><%=azioneRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOC %> [<span style="color:<%=spanSTOC%>"><%=azioneSTOC %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOCRSI %> [<span style="color:<%=spanSTOCRSI%>"><%=azioneSTOCRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valADX %> [<span style="color:<%=spanADX%>"><%=azioneADX %></span>]</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td>
				<a href="http://it.investing.com/equities/e.on-technical?period=86400" target="_blak">E.ON</a> [10%]</td>
		</tr>
			<%
			String[] strENEL = listaFtesMib.get(2).split("==");
			
			String toDoENEL = strENEL[2];
			indicator = strENEL[1].split("::");
			indicatorRSI = indicator[0].split(":");
			valRSI = indicatorRSI[1];
			azioneRSI = indicatorRSI[2];
			if(azioneRSI.equalsIgnoreCase("VENDI")){
				spanRSI = "#FF0000";
			}else if(azioneRSI.equalsIgnoreCase("COMPRA")){
				spanRSI = "#13c646";
			}else{
				spanRSI = "#000000";
			}
			
			indicatorSTOC = indicator[1].split(":");
			valSTOC = indicatorSTOC[1];
			azioneSTOC = indicatorSTOC[2];
			if(azioneSTOC.equalsIgnoreCase("VENDI")){
				spanSTOC = "#FF0000";
			}else if(azioneSTOC.equalsIgnoreCase("COMPRA")){
				spanSTOC = "#13c646";
			}else{
				spanSTOC = "#000000";
			}
			
			indicatorSTOCRSI = indicator[2].split(":");
			valSTOCRSI = indicatorSTOCRSI[1];
			azioneSTOCRSI = indicatorSTOCRSI[2];
			if(azioneSTOCRSI.equalsIgnoreCase("VENDI")){
				spanSTOCRSI = "#FF0000";
			}else if(azioneSTOCRSI.equalsIgnoreCase("COMPRA")){
				spanSTOCRSI = "#13c646";
			}else{
				spanSTOCRSI = "#000000";
			}
			
			indicatorADX = indicator[3].split(":");
			valADX = indicatorADX[1];
			azioneADX = indicatorADX[2];
			if(azioneADX.equalsIgnoreCase("VENDI")){
				spanADX = "#FF0000";
			}else if(azioneADX.equalsIgnoreCase("COMPRA")){
				spanADX = "#13c646";
			}else{
				spanADX = "#000000";
			}


			%>
		<tr>
			<td>
				<a href="http://it.investing.com/equities/enel-technical?period=86400" target="_blak">ENEL</a> [35G]</td>
			<td>
				<table border="1" cellpadding="0" cellspacing="0" style="width:460px;border-collapse:collapse;">
					<tbody>
						<tr class="componente"  style="width:460px;">
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valRSI %> [<span style="color:<%=spanRSI%>"><%=azioneRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOC %> [<span style="color:<%=spanSTOC%>"><%=azioneSTOC %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOCRSI %> [<span style="color:<%=spanSTOCRSI%>"><%=azioneSTOCRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valADX %> [<span style="color:<%=spanADX%>"><%=azioneADX %></span>]</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td>
			<%
			String[] strSIEMENS = listaDax.get(2).split("==");
			
			String toDoSIEMENS = strSIEMENS[2];
			indicator = strSIEMENS[1].split("::");
			indicatorRSI = indicator[0].split(":");
			valRSI = indicatorRSI[1];
			azioneRSI = indicatorRSI[2];
			if(azioneRSI.equalsIgnoreCase("VENDI")){
				spanRSI = "#FF0000";
			}else if(azioneRSI.equalsIgnoreCase("COMPRA")){
				spanRSI = "#13c646";
			}else{
				spanRSI = "#000000";
			}
			
			indicatorSTOC = indicator[1].split(":");
			valSTOC = indicatorSTOC[1];
			azioneSTOC = indicatorSTOC[2];
			if(azioneSTOC.equalsIgnoreCase("VENDI")){
				spanSTOC = "#FF0000";
			}else if(azioneSTOC.equalsIgnoreCase("COMPRA")){
				spanSTOC = "#13c646";
			}else{
				spanSTOC = "#000000";
			}
			
			indicatorSTOCRSI = indicator[2].split(":");
			valSTOCRSI = indicatorSTOCRSI[1];
			azioneSTOCRSI = indicatorSTOCRSI[2];
			if(azioneSTOCRSI.equalsIgnoreCase("VENDI")){
				spanSTOCRSI = "#FF0000";
			}else if(azioneSTOCRSI.equalsIgnoreCase("COMPRA")){
				spanSTOCRSI = "#13c646";
			}else{
				spanSTOCRSI = "#000000";
			}
			
			indicatorADX = indicator[3].split(":");
			valADX = indicatorADX[1];
			azioneADX = indicatorADX[2];
			if(azioneADX.equalsIgnoreCase("VENDI")){
				spanADX = "#FF0000";
			}else if(azioneADX.equalsIgnoreCase("COMPRA")){
				spanADX = "#13c646";
			}else{
				spanADX = "#000000";
			}


			%>
				<table border="1" cellpadding="0" cellspacing="0" style="width:460px;border-collapse:collapse;">
					<tbody>
						<tr class="componente"  style="width:460px;">
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valRSI %> [<span style="color:<%=spanRSI%>"><%=azioneRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOC %> [<span style="color:<%=spanSTOC%>"><%=azioneSTOC %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOCRSI %> [<span style="color:<%=spanSTOCRSI%>"><%=azioneSTOCRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valADX %> [<span style="color:<%=spanADX%>"><%=azioneADX %></span>]</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td>
				<a href="http://it.investing.com/equities/siemens-technical?period=86400" target="_blak">SIEMENS</a> [9,84%]</td>
		</tr>
		<tr>
			<%
			String[] strINTESA = listaFtesMib.get(3).split("==");
			
			String toDoINTESA = strINTESA[2];
			indicator = strINTESA[1].split("::");
			indicatorRSI = indicator[0].split(":");
			valRSI = indicatorRSI[1];
			azioneRSI = indicatorRSI[2];
			if(azioneRSI.equalsIgnoreCase("VENDI")){
				spanRSI = "#FF0000";
			}else if(azioneRSI.equalsIgnoreCase("COMPRA")){
				spanRSI = "#13c646";
			}else{
				spanRSI = "#000000";
			}
			
			indicatorSTOC = indicator[1].split(":");
			valSTOC = indicatorSTOC[1];
			azioneSTOC = indicatorSTOC[2];
			if(azioneSTOC.equalsIgnoreCase("VENDI")){
				spanSTOC = "#FF0000";
			}else if(azioneSTOC.equalsIgnoreCase("COMPRA")){
				spanSTOC = "#13c646";
			}else{
				spanSTOC = "#000000";
			}
			
			indicatorSTOCRSI = indicator[2].split(":");
			valSTOCRSI = indicatorSTOCRSI[1];
			azioneSTOCRSI = indicatorSTOCRSI[2];
			if(azioneSTOCRSI.equalsIgnoreCase("VENDI")){
				spanSTOCRSI = "#FF0000";
			}else if(azioneSTOCRSI.equalsIgnoreCase("COMPRA")){
				spanSTOCRSI = "#13c646";
			}else{
				spanSTOCRSI = "#000000";
			}
			
			indicatorADX = indicator[3].split(":");
			valADX = indicatorADX[1];
			azioneADX = indicatorADX[2];
			if(azioneADX.equalsIgnoreCase("VENDI")){
				spanADX = "#FF0000";
			}else if(azioneADX.equalsIgnoreCase("COMPRA")){
				spanADX = "#13c646";
			}else{
				spanADX = "#000000";
			}


			%>
			<td>
				<a href="http://it.investing.com/equities/intesa-sanpaolo-technical?period=86400" target="_blak">INTESA</a> [34G]</td>
			<td>
				<table border="1" cellpadding="0" cellspacing="0" style="width:460px;border-collapse:collapse;">
					<tbody>
						<tr class="componente"  style="width:460px;">
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valRSI %> [<span style="color:<%=spanRSI%>"><%=azioneRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOC %> [<span style="color:<%=spanSTOC%>"><%=azioneSTOC %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOCRSI %> [<span style="color:<%=spanSTOCRSI%>"><%=azioneSTOCRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valADX %> [<span style="color:<%=spanADX%>"><%=azioneADX %></span>]</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td>
			<%
			String[] strALLIANZ = listaDax.get(3).split("==");
			
			String toDoALLIANZ = strALLIANZ[2];
			indicator = strALLIANZ[1].split("::");
			indicatorRSI = indicator[0].split(":");
			valRSI = indicatorRSI[1];
			azioneRSI = indicatorRSI[2];
			if(azioneRSI.equalsIgnoreCase("VENDI")){
				spanRSI = "#FF0000";
			}else if(azioneRSI.equalsIgnoreCase("COMPRA")){
				spanRSI = "#13c646";
			}else{
				spanRSI = "#000000";
			}
			
			indicatorSTOC = indicator[1].split(":");
			valSTOC = indicatorSTOC[1];
			azioneSTOC = indicatorSTOC[2];
			if(azioneSTOC.equalsIgnoreCase("VENDI")){
				spanSTOC = "#FF0000";
			}else if(azioneSTOC.equalsIgnoreCase("COMPRA")){
				spanSTOC = "#13c646";
			}else{
				spanSTOC = "#000000";
			}
			
			indicatorSTOCRSI = indicator[2].split(":");
			valSTOCRSI = indicatorSTOCRSI[1];
			azioneSTOCRSI = indicatorSTOCRSI[2];
			if(azioneSTOCRSI.equalsIgnoreCase("VENDI")){
				spanSTOCRSI = "#FF0000";
			}else if(azioneSTOCRSI.equalsIgnoreCase("COMPRA")){
				spanSTOCRSI = "#13c646";
			}else{
				spanSTOCRSI = "#000000";
			}
			
			indicatorADX = indicator[3].split(":");
			valADX = indicatorADX[1];
			azioneADX = indicatorADX[2];
			if(azioneADX.equalsIgnoreCase("VENDI")){
				spanADX = "#FF0000";
			}else if(azioneADX.equalsIgnoreCase("COMPRA")){
				spanADX = "#13c646";
			}else{
				spanADX = "#000000";
			}


			%>
				<table border="1" cellpadding="0" cellspacing="0" style="width:460px;border-collapse:collapse;">
					<tbody>
						<tr class="componente"  style="width:460px;">
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valRSI %> [<span style="color:<%=spanRSI%>"><%=azioneRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOC %> [<span style="color:<%=spanSTOC%>"><%=azioneSTOC %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOCRSI %> [<span style="color:<%=spanSTOCRSI%>"><%=azioneSTOCRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valADX %> [<span style="color:<%=spanADX%>"><%=azioneADX %></span>]</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td>
				<a href="http://it.investing.com/equities/allianz-ag-technical?period=86400" target="_blak">ALLIANZ</a> [8,03%]</td>
		</tr>
		<tr>
			<%
			String[] strUNICREDIT = listaFtesMib.get(4).split("==");
			
			String toDoUNICREDIT = strUNICREDIT[2];
			indicator = strUNICREDIT[1].split("::");
			indicatorRSI = indicator[0].split(":");
			valRSI = indicatorRSI[1];
			azioneRSI = indicatorRSI[2];
			if(azioneRSI.equalsIgnoreCase("VENDI")){
				spanRSI = "#FF0000";
			}else if(azioneRSI.equalsIgnoreCase("COMPRA")){
				spanRSI = "#13c646";
			}else{
				spanRSI = "#000000";
			}
			
			indicatorSTOC = indicator[1].split(":");
			valSTOC = indicatorSTOC[1];
			azioneSTOC = indicatorSTOC[2];
			if(azioneSTOC.equalsIgnoreCase("VENDI")){
				spanSTOC = "#FF0000";
			}else if(azioneSTOC.equalsIgnoreCase("COMPRA")){
				spanSTOC = "#13c646";
			}else{
				spanSTOC = "#000000";
			}
			
			indicatorSTOCRSI = indicator[2].split(":");
			valSTOCRSI = indicatorSTOCRSI[1];
			azioneSTOCRSI = indicatorSTOCRSI[2];
			if(azioneSTOCRSI.equalsIgnoreCase("VENDI")){
				spanSTOCRSI = "#FF0000";
			}else if(azioneSTOCRSI.equalsIgnoreCase("COMPRA")){
				spanSTOCRSI = "#13c646";
			}else{
				spanSTOCRSI = "#000000";
			}
			
			indicatorADX = indicator[3].split(":");
			valADX = indicatorADX[1];
			azioneADX = indicatorADX[2];
			if(azioneADX.equalsIgnoreCase("VENDI")){
				spanADX = "#FF0000";
			}else if(azioneADX.equalsIgnoreCase("COMPRA")){
				spanADX = "#13c646";
			}else{
				spanADX = "#000000";
			}


			%>
			<td>
				<a href="http://it.investing.com/equities/unicredito-technical?period=86400" target="_blak">UNICREDIT</a> [33G]</td>
			<td>
				<table border="1" cellpadding="0" cellspacing="0" style="width:460px;border-collapse:collapse;">
					<tbody>
						<tr class="componente"  style="width:460px;">
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valRSI %> [<span style="color:<%=spanRSI%>"><%=azioneRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOC %> [<span style="color:<%=spanSTOC%>"><%=azioneSTOC %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOCRSI %> [<span style="color:<%=spanSTOCRSI%>"><%=azioneSTOCRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valADX %> [<span style="color:<%=spanADX%>"><%=azioneADX %></span>]</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td>
			<%
			String[] strBAYER = listaDax.get(4).split("==");
			
			String toDoBAYER = strBAYER[2];
			indicator = strBAYER[1].split("::");
			indicatorRSI = indicator[0].split(":");
			valRSI = indicatorRSI[1];
			azioneRSI = indicatorRSI[2];
			if(azioneRSI.equalsIgnoreCase("VENDI")){
				spanRSI = "#FF0000";
			}else if(azioneRSI.equalsIgnoreCase("COMPRA")){
				spanRSI = "#13c646";
			}else{
				spanRSI = "#000000";
			}
			
			indicatorSTOC = indicator[1].split(":");
			valSTOC = indicatorSTOC[1];
			azioneSTOC = indicatorSTOC[2];
			if(azioneSTOC.equalsIgnoreCase("VENDI")){
				spanSTOC = "#FF0000";
			}else if(azioneSTOC.equalsIgnoreCase("COMPRA")){
				spanSTOC = "#13c646";
			}else{
				spanSTOC = "#000000";
			}
			
			indicatorSTOCRSI = indicator[2].split(":");
			valSTOCRSI = indicatorSTOCRSI[1];
			azioneSTOCRSI = indicatorSTOCRSI[2];
			if(azioneSTOCRSI.equalsIgnoreCase("VENDI")){
				spanSTOCRSI = "#FF0000";
			}else if(azioneSTOCRSI.equalsIgnoreCase("COMPRA")){
				spanSTOCRSI = "#13c646";
			}else{
				spanSTOCRSI = "#000000";
			}
			
			indicatorADX = indicator[3].split(":");
			valADX = indicatorADX[1];
			azioneADX = indicatorADX[2];
			if(azioneADX.equalsIgnoreCase("VENDI")){
				spanADX = "#FF0000";
			}else if(azioneADX.equalsIgnoreCase("COMPRA")){
				spanADX = "#13c646";
			}else{
				spanADX = "#000000";
			}


			%>
				<table border="1" cellpadding="0" cellspacing="0" style="width:460px;border-collapse:collapse;">
					<tbody>
						<tr class="componente"  style="width:460px;">
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valRSI %> [<span style="color:<%=spanRSI%>"><%=azioneRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOC %> [<span style="color:<%=spanSTOC%>"><%=azioneSTOC %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOCRSI %> [<span style="color:<%=spanSTOCRSI%>"><%=azioneSTOCRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valADX %> [<span style="color:<%=spanADX%>"><%=azioneADX %></span>]</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td>
				<a href="http://it.investing.com/equities/bayer-ag-technical?period=86400" target="_blak">BAYER</a> [7,64%]</td>
		</tr>
		<tr>
		<%
			String[] strGENERALI = listaFtesMib.get(5).split("==");
			
			String toDoGENERALI = strGENERALI[2];
			indicator = strGENERALI[1].split("::");
			indicatorRSI = indicator[0].split(":");
			valRSI = indicatorRSI[1];
			azioneRSI = indicatorRSI[2];
			if(azioneRSI.equalsIgnoreCase("VENDI")){
				spanRSI = "#FF0000";
			}else if(azioneRSI.equalsIgnoreCase("COMPRA")){
				spanRSI = "#13c646";
			}else{
				spanRSI = "#000000";
			}
			
			indicatorSTOC = indicator[1].split(":");
			valSTOC = indicatorSTOC[1];
			azioneSTOC = indicatorSTOC[2];
			if(azioneSTOC.equalsIgnoreCase("VENDI")){
				spanSTOC = "#FF0000";
			}else if(azioneSTOC.equalsIgnoreCase("COMPRA")){
				spanSTOC = "#13c646";
			}else{
				spanSTOC = "#000000";
			}
			
			indicatorSTOCRSI = indicator[2].split(":");
			valSTOCRSI = indicatorSTOCRSI[1];
			azioneSTOCRSI = indicatorSTOCRSI[2];
			if(azioneSTOCRSI.equalsIgnoreCase("VENDI")){
				spanSTOCRSI = "#FF0000";
			}else if(azioneSTOCRSI.equalsIgnoreCase("COMPRA")){
				spanSTOCRSI = "#13c646";
			}else{
				spanSTOCRSI = "#000000";
			}
			
			indicatorADX = indicator[3].split(":");
			valADX = indicatorADX[1];
			azioneADX = indicatorADX[2];
			if(azioneADX.equalsIgnoreCase("VENDI")){
				spanADX = "#FF0000";
			}else if(azioneADX.equalsIgnoreCase("COMPRA")){
				spanADX = "#13c646";
			}else{
				spanADX = "#000000";
			}


			%>
			<td>
				<a href="http://it.investing.com/equities/generali-ass-technical?period=86400" target="_blak">GENERALI</a> [25G]</td>
			<td>
				<table border="1" cellpadding="0" cellspacing="0" style="width:460px;border-collapse:collapse;">
					<tbody>
						<tr class="componente"  style="width:460px;">
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valRSI %> [<span style="color:<%=spanRSI%>"><%=azioneRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOC %> [<span style="color:<%=spanSTOC%>"><%=azioneSTOC %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOCRSI %> [<span style="color:<%=spanSTOCRSI%>"><%=azioneSTOCRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valADX %> [<span style="color:<%=spanADX%>"><%=azioneADX %></span>]</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td>
			<%
			String[] strDT = listaDax.get(5).split("==");
			
			String toDoDT = strDT[2];
			indicator = strDT[1].split("::");
			indicatorRSI = indicator[0].split(":");
			valRSI = indicatorRSI[1];
			azioneRSI = indicatorRSI[2];
			if(azioneRSI.equalsIgnoreCase("VENDI")){
				spanRSI = "#FF0000";
			}else if(azioneRSI.equalsIgnoreCase("COMPRA")){
				spanRSI = "#13c646";
			}else{
				spanRSI = "#000000";
			}
			
			indicatorSTOC = indicator[1].split(":");
			valSTOC = indicatorSTOC[1];
			azioneSTOC = indicatorSTOC[2];
			if(azioneSTOC.equalsIgnoreCase("VENDI")){
				spanSTOC = "#FF0000";
			}else if(azioneSTOC.equalsIgnoreCase("COMPRA")){
				spanSTOC = "#13c646";
			}else{
				spanSTOC = "#000000";
			}
			
			indicatorSTOCRSI = indicator[2].split(":");
			valSTOCRSI = indicatorSTOCRSI[1];
			azioneSTOCRSI = indicatorSTOCRSI[2];
			if(azioneSTOCRSI.equalsIgnoreCase("VENDI")){
				spanSTOCRSI = "#FF0000";
			}else if(azioneSTOCRSI.equalsIgnoreCase("COMPRA")){
				spanSTOCRSI = "#13c646";
			}else{
				spanSTOCRSI = "#000000";
			}
			
			indicatorADX = indicator[3].split(":");
			valADX = indicatorADX[1];
			azioneADX = indicatorADX[2];
			if(azioneADX.equalsIgnoreCase("VENDI")){
				spanADX = "#FF0000";
			}else if(azioneADX.equalsIgnoreCase("COMPRA")){
				spanADX = "#13c646";
			}else{
				spanADX = "#000000";
			}


			%>
				<table border="1" cellpadding="0" cellspacing="0" style="width:460px;border-collapse:collapse;">
					<tbody>
						<tr class="componente"  style="width:460px;">
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valRSI %> [<span style="color:<%=spanRSI%>"><%=azioneRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOC %> [<span style="color:<%=spanSTOC%>"><%=azioneSTOC %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOCRSI %> [<span style="color:<%=spanSTOCRSI%>"><%=azioneSTOCRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valADX %> [<span style="color:<%=spanADX%>"><%=azioneADX %></span>]</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td>
				<a href="http://it.investing.com/equities/dt-telekom-technical?period=86400" target="_blak">DEU.TELEK.</a> [7,27%]</td>
		</tr>
		<tr>
		<%
			String[] strLUX = listaFtesMib.get(6).split("==");
			
			String toDoLUX = strLUX[2];
			indicator = strLUX[1].split("::");
			indicatorRSI = indicator[0].split(":");
			valRSI = indicatorRSI[1];
			azioneRSI = indicatorRSI[2];
			if(azioneRSI.equalsIgnoreCase("VENDI")){
				spanRSI = "#FF0000";
			}else if(azioneRSI.equalsIgnoreCase("COMPRA")){
				spanRSI = "#13c646";
			}else{
				spanRSI = "#000000";
			}
			
			indicatorSTOC = indicator[1].split(":");
			valSTOC = indicatorSTOC[1];
			azioneSTOC = indicatorSTOC[2];
			if(azioneSTOC.equalsIgnoreCase("VENDI")){
				spanSTOC = "#FF0000";
			}else if(azioneSTOC.equalsIgnoreCase("COMPRA")){
				spanSTOC = "#13c646";
			}else{
				spanSTOC = "#000000";
			}
			
			indicatorSTOCRSI = indicator[2].split(":");
			valSTOCRSI = indicatorSTOCRSI[1];
			azioneSTOCRSI = indicatorSTOCRSI[2];
			if(azioneSTOCRSI.equalsIgnoreCase("VENDI")){
				spanSTOCRSI = "#FF0000";
			}else if(azioneSTOCRSI.equalsIgnoreCase("COMPRA")){
				spanSTOCRSI = "#13c646";
			}else{
				spanSTOCRSI = "#000000";
			}
			
			indicatorADX = indicator[3].split(":");
			valADX = indicatorADX[1];
			azioneADX = indicatorADX[2];
			if(azioneADX.equalsIgnoreCase("VENDI")){
				spanADX = "#FF0000";
			}else if(azioneADX.equalsIgnoreCase("COMPRA")){
				spanADX = "#13c646";
			}else{
				spanADX = "#000000";
			}


			%>
			<td>
				<a href="http://it.investing.com/equities/luxottica-technical?period=86400" target="_blak">LUXOTTICA</a> [19G]</td>
			<td>
				<table border="1" cellpadding="0" cellspacing="0" style="width:460px;border-collapse:collapse;">
					<tbody>
						<tr class="componente"  style="width:460px;">
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valRSI %> [<span style="color:<%=spanRSI%>"><%=azioneRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOC %> [<span style="color:<%=spanSTOC%>"><%=azioneSTOC %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOCRSI %> [<span style="color:<%=spanSTOCRSI%>"><%=azioneSTOCRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valADX %> [<span style="color:<%=spanADX%>"><%=azioneADX %></span>]</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td>
			<%
			String[] strSAP = listaDax.get(6).split("==");

			String toDoSAP = strSAP[2];
			indicator = strSAP[1].split("::");
			indicatorRSI = indicator[0].split(":");
			valRSI = indicatorRSI[1];
			azioneRSI = indicatorRSI[2];
			if(azioneRSI.equalsIgnoreCase("VENDI")){
				spanRSI = "#FF0000";
			}else if(azioneRSI.equalsIgnoreCase("COMPRA")){
				spanRSI = "#13c646";
			}else{
				spanRSI = "#000000";
			}
			
			indicatorSTOC = indicator[1].split(":");
			valSTOC = indicatorSTOC[1];
			azioneSTOC = indicatorSTOC[2];
			if(azioneSTOC.equalsIgnoreCase("VENDI")){
				spanSTOC = "#FF0000";
			}else if(azioneSTOC.equalsIgnoreCase("COMPRA")){
				spanSTOC = "#13c646";
			}else{
				spanSTOC = "#000000";
			}
			
			
			indicatorSTOCRSI = indicator[2].split(":");
			valSTOCRSI = indicatorSTOCRSI[1];
			azioneSTOCRSI = indicatorSTOCRSI[2];
			if(azioneSTOCRSI.equalsIgnoreCase("VENDI")){
				spanSTOCRSI = "#FF0000";
			}else if(azioneSTOCRSI.equalsIgnoreCase("COMPRA")){
				spanSTOCRSI = "#13c646";
			}else{
				spanSTOCRSI = "#000000";
			}
			
			indicatorADX = indicator[3].split(":");
			valADX = indicatorADX[1];
			azioneADX = indicatorADX[2];
			if(azioneADX.equalsIgnoreCase("VENDI")){
				spanADX = "#FF0000";
			}else if(azioneADX.equalsIgnoreCase("COMPRA")){
				spanADX = "#13c646";
			}else{
				spanADX = "#000000";
			}

			
			%>
				<table border="1" cellpadding="0" cellspacing="0" style="width:460px;border-collapse:collapse;">
					<tbody>
						<tr class="componente"  style="width:460px;">
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valRSI %> [<span style="color:<%=spanRSI%>"><%=azioneRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOC %> [<span style="color:<%=spanSTOC%>"><%=azioneSTOC %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valSTOCRSI %> [<span style="color:<%=spanSTOCRSI%>"><%=azioneSTOCRSI %></span>]</td>
							<td class="indicatore" style="padding:2px;width:110px;">
								<%=valADX %> [<span style="color:<%=spanADX%>"><%=azioneADX %></span>]</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td>
				<a href="http://it.investing.com/equities/sap-ag-technical?period=86400" target="_blak">SAP</a> [5,99%]</td>
		</tr>
	</tbody>
</table>

<portlet:renderURL var="refreshView">
	<portlet:param name="jspPage" value="view.jsp" />
</portlet:renderURL>
<div style="text-align:right;position:absolute;top:270px;right:-50px;">
	<a href="<%=refreshView.toString() %>" >
		<img style="border:0px;" src="<%=request.getContextPath() %>/images/update.png" alt="Refresh" title="Refresh" />
	</a>
</div>
 
 
 <div style="text-align:center">
 <br>
 FTSE MIB = <span style="font-weight:bold;color:<%=MyUtils.getColore(toDoFtse) %>"><%=toDoFtse %></span> <span style="font-weight:bold;color:#0000ff;">||</span> 
 	ENI = <span style="font-weight:bold;color:<%=MyUtils.getColore(toDoEni) %>"><%=toDoEni %></span> <span style="font-weight:bold;color:#0000ff;">||</span> 
 	ENEL = <span style="font-weight:bold;color:<%=MyUtils.getColore(toDoENEL) %>"><%=toDoENEL %></span> <span style="font-weight:bold;color:#0000ff;">||</span> 
 	INTESA = <span style="font-weight:bold;color:<%=MyUtils.getColore(toDoINTESA) %>"><%=toDoINTESA %></span> <span style="font-weight:bold;color:#0000ff;">||</span> 
 	UNICREDIT = <span style="font-weight:bold;color:<%=MyUtils.getColore(toDoUNICREDIT) %>"><%=toDoUNICREDIT %></span> <span style="font-weight:bold;color:#0000ff;">||</span> 
 	GENERALI = <span style="font-weight:bold;color:<%=MyUtils.getColore(toDoGENERALI) %>"><%=toDoGENERALI %></span> <span style="font-weight:bold;color:#0000ff;">||</span> 
 	LUXOTTICA = <span style="font-weight:bold;color:<%=MyUtils.getColore(toDoLUX) %>"><%=toDoLUX %></span>
 <br><br>
 DAX = <span style="font-weight:bold;color:<%=MyUtils.getColore(toDoDax) %>"><%=toDoDax %></span> <span style="font-weight:bold;color:#0000ff;">||</span> 
 	E.ON = <span style="font-weight:bold;color:<%=MyUtils.getColore(toDoEON) %>"><%=toDoEON %></span> <span style="font-weight:bold;color:#0000ff;">||</span> 
 	SIEMENS = <span style="font-weight:bold;color:<%=MyUtils.getColore(toDoSIEMENS) %>"><%=toDoSIEMENS %></span> <span style="font-weight:bold;color:#0000ff;">||</span> 
 	ALLIANZ = <span style="font-weight:bold;color:<%=MyUtils.getColore(toDoALLIANZ) %>"><%=toDoALLIANZ %></span> <span style="font-weight:bold;color:#0000ff;">||</span> 
 	BAYER = <span style="font-weight:bold;color:<%=MyUtils.getColore(toDoBAYER) %>"><%=toDoBAYER %></span> <span style="font-weight:bold;color:#0000ff;">||</span> 
 	DEU.TELEK. = <span style="font-weight:bold;color:<%=MyUtils.getColore(toDoDT) %>"><%=toDoDT %></span> <span style="font-weight:bold;color:#0000ff;">||</span> 
 	SAP = <span style="font-weight:bold;color:<%=MyUtils.getColore(toDoSAP) %>"><%=toDoSAP %></span> 
 <br>
 </div>
</div>	

		
<script type="text/javascript">		
		AUI().use('get', function(A){
			A.Get.script('http://code.jquery.com/jquery-1.9.1.js', {
		         onSuccess: function(A){
		        	 
		        	 $(".componente").hover(
		       			  function () {
		       				  $(this).css("background","#fafca4");
		       			  }, 
		       			  function () {
		       				  $(this).css("background","");
		       			  }
		       		);

		       		$(".indicatore").hover(
		       				  function () {
		       					  $(this).css("background","#ffcd77");
		       				  }, 
		       				  function () {
		       					  $(this).css("background","");
		       				  }
		       			);
		        	 
		         }
			 });
			
		});
		

</script>
