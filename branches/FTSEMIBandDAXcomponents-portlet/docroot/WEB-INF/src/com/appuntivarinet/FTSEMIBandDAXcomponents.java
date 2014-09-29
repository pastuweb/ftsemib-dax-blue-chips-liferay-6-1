package com.appuntivarinet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.GenericPortlet;
import javax.portlet.PortletException;
import javax.portlet.PortletMode;
import javax.portlet.PortletPreferences;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.PortletURL;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomNodeList;
import com.gargoylesoftware.htmlunit.html.HtmlElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.liferay.portal.util.PortalUtil;

public class FTSEMIBandDAXcomponents extends GenericPortlet {
	
	public static Log log = LogFactory.getLog("FTSEMIBandDAXcomponents");
	
	/* initialize the default parameter of "portlet.xml" */
	protected String editJSP;
	protected String viewJSP;
	
	public void init() throws PortletException{
		viewJSP = getInitParameter("view-jsp");
	}
	
	
	//set the Portlet's default View
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException{
		PortletPreferences prefs = renderRequest.getPreferences();
		
		
		/* Default value */
		List<String> urlFtesMib = new ArrayList<String>();
		urlFtesMib.add(0, "http://it.investing.com/indices/it-mib-40-technical?period=86400");
		urlFtesMib.add(1,"http://it.investing.com/equities/eni-technical?period=86400");
		urlFtesMib.add(2,"http://it.investing.com/equities/enel-technical?period=86400");
		urlFtesMib.add(3,"http://it.investing.com/equities/intesa-sanpaolo-technical?period=86400");
		urlFtesMib.add(4,"http://it.investing.com/equities/unicredito-technical?period=86400");
		urlFtesMib.add(5,"http://it.investing.com/equities/generali-ass-technical?period=86400");
		urlFtesMib.add(6,"http://it.investing.com/equities/luxottica-technical?period=86400");
		List<String> urlDax = new ArrayList<String>();
		urlDax.add(0,"http://it.investing.com/indices/germany-30-technical?period=86400");
		urlDax.add(1,"http://it.investing.com/equities/e.on-technical?period=86400");
		urlDax.add(2,"http://it.investing.com/equities/siemens-technical?period=86400");
		urlDax.add(3,"http://it.investing.com/equities/allianz-ag-technical?period=86400");
		urlDax.add(4,"http://it.investing.com/equities/bayer-ag-technical?period=86400");
		urlDax.add(5,"http://it.investing.com/equities/dt-telekom-technical?period=86400");
		urlDax.add(6,"http://it.investing.com/equities/sap-ag-technical?period=86400");

		List<String> listaFtesMib = getListaIndicatori(urlFtesMib);
		List<String> listaDax = getListaIndicatori(urlDax);
		
		renderRequest.setAttribute("listaFtesMib", listaFtesMib);
		renderRequest.setAttribute("listaDax", listaDax);
		
		include(viewJSP, renderRequest, renderResponse);
	}
	
	
	/* special method: used to dispatch to right JSP */
	protected void include(String path, RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException{
		PortletRequestDispatcher portletRequestDispatcher = getPortletContext().getRequestDispatcher(path);
		if(portletRequestDispatcher == null){
			log.info("path : "+path+" non e valido.");
		}else{
			portletRequestDispatcher.include(renderRequest, renderResponse);
		}
	}

	public List<String> getListaIndicatori(List<String> urls) throws FailingHttpStatusCodeException, MalformedURLException, IOException{
			
		String componente = new String("");
		List<String> result = new ArrayList<String>();
		
		WebClient browser = new WebClient();
		browser.setJavaScriptEnabled(false);	
		
		long startTime = System.currentTimeMillis();

		for (String url : urls) {
			componente = "";
			HtmlPage page = browser.getPage(url);
			System.out.println("Lettura Pagina: "+url);
			
			if(url.contains("it-mib-40")){
				componente = "FTSE MIB";
			}else if(url.contains("eni")){
				componente = "ENI";
			}else if(url.contains("enel")){
				componente = "ENEL";
			}else if(url.contains("intesa")){
				componente = "INTESA";
			}else if(url.contains("generali")){
				componente = "GENERALI";
			}else if(url.contains("unicredito")){
				componente = "UNICREDIT";
			}else if(url.contains("luxottica")){
				componente = "LUXOTTICA";
			}else if(url.contains("germany-30")){
				componente = "DAX";
			}else if(url.contains("e.on")){
				componente = "E.ON";
			}else if(url.contains("siemens")){
				componente = "SIEMENS";
			}else if(url.contains("dt-telekom")){
				componente = "DET.TELEK.";
			}else if(url.contains("bayer")){
				componente = "BAYER";
			}else if(url.contains("sap")){
				componente = "SAP";
			}else if(url.contains("allianz")){
				componente = "ALLIANZ";
			}

			//recupero Status Corrente
			String titolo = componente;
			if(componente.equals("FTSE MIB") || componente.equals("DAX")){
				
				String dateParsing = new String("");
				HtmlElement divSummStatus = page.getElementById("quotes_summary_current_data");
				DomNodeList<HtmlElement> divs_ris1 = divSummStatus.getElementsByTagName("div");
				for (HtmlElement div : divs_ris1) {
					if(div.getAttribute("class").equals("inlineblock")){
							DomNodeList<HtmlElement> span_summ = div.getElementsByTagName("span");
							//System.out.println(titolo+" current value = "+span_summ.get(0).getTextContent());
							componente = componente+"::"+span_summ.get(0).getTextContent();
							//System.out.println(titolo+" current pip   = "+span_summ.get(1).getTextContent());
							componente = componente+"::"+span_summ.get(1).getTextContent();
							//System.out.println(titolo+" current var%  = "+span_summ.get(3).getTextContent());
							componente = componente+"::"+span_summ.get(3).getTextContent();
							break;
					}
				}
				DomNodeList<HtmlElement> divs = page.getElementsByTagName("div");
				for (HtmlElement div : divs) {
					if(div.getAttribute("class").equals("halfSizeColumn float_lang_base_2")){
						DomNodeList<HtmlElement> h3s = div.getElementsByTagName("h3");
						DomNodeList<HtmlElement> spans = h3s.get(0).getElementsByTagName("span");
						dateParsing = spans.get(1).getTextContent();
						break;
					}
				}
				HtmlElement divToDo = page.getElementById("techStudiesInnerBoxRightBottom");
				componente = componente+"=="+dateParsing+ "=="+divToDo.getElementsByTagName("div").get(0).getElementsByTagName("span").get(0).getTextContent();;
			}else{
				componente = componente+"==";

				
				//recupero valori indicatori
				DomNodeList<HtmlElement> tables = page.getElementsByTagName("table");
				for (HtmlElement table : tables) {
					if(table.getAttribute("class").contains("technicalIndicatorsTbl")){
						HtmlElement tBodyTableSummIndicat = table.getElementsByTagName("tbody").get(0);
						DomNodeList<HtmlElement> trs = tBodyTableSummIndicat.getElementsByTagName("tr");
						for (HtmlElement tr : trs) {
							if(tr.getAttribute("id").equals("pair_0")){
								//System.out.println(titolo+" - RSI(14) = "+tr.getElementsByTagName("td").get(1).getTextContent()+" ["+tr.getElementsByTagName("td").get(2).getTextContent()+"]");
								componente = componente+"RSI:"+tr.getElementsByTagName("td").get(1).getTextContent()+":"+tr.getElementsByTagName("td").get(2).getTextContent();
							}else if(tr.getAttribute("id").equals("pair_1")){
								//System.out.println(titolo+" - STOC(9,6) = "+tr.getElementsByTagName("td").get(1).getTextContent()+" ["+tr.getElementsByTagName("td").get(2).getTextContent()+"]");
								componente = componente+"::STOC:"+tr.getElementsByTagName("td").get(1).getTextContent()+":"+tr.getElementsByTagName("td").get(2).getTextContent();
							}else if(tr.getAttribute("id").equals("pair_2")){
								//System.out.println(titolo+" - STOCRSI(14) = "+tr.getElementsByTagName("td").get(1).getTextContent()+" ["+tr.getElementsByTagName("td").get(2).getTextContent()+"]");
								componente = componente+"::STOCRSI:"+tr.getElementsByTagName("td").get(1).getTextContent()+":"+tr.getElementsByTagName("td").get(2).getTextContent();
							}else if(tr.getAttribute("id").equals("pair_4")){
								//System.out.println(titolo+" - ADX(14) = "+tr.getElementsByTagName("td").get(1).getTextContent()+" ["+tr.getElementsByTagName("td").get(2).getTextContent()+"]");
								componente = componente+"::ADX:"+tr.getElementsByTagName("td").get(1).getTextContent()+":"+tr.getElementsByTagName("td").get(2).getTextContent();
							}
						}
						break;
					}
				}
				HtmlElement divToDo = page.getElementById("techStudiesInnerBoxRightBottom");
				componente = componente + "=="+divToDo.getElementsByTagName("div").get(0).getElementsByTagName("span").get(0).getTextContent();
			}

			System.out.println(componente);		
			result.add(componente);
		}
		long endTime = System.currentTimeMillis();

		System.out.println("That took " + (endTime - startTime) + " milliseconds " + ((endTime-startTime)/1000) + "seconds");
		
		
		
		return result;
	}

}
