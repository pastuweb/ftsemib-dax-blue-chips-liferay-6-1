package com.appuntivarinet;

public class MyUtils {

	public static String getColore(String str){
		if(str.toUpperCase().contains("VENDI")){
			return "#FF0000";
		}else if(str.toUpperCase().contains("COMPRA")){
			return "#13c646";
		}else{
			return "#000000";
		}
	}
}
