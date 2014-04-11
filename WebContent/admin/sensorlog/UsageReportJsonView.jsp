<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="utf-8"%><%@ page import="java.util.List" %><%@ page import="CometPark.SensorLogController" %><%String msg = "";

    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
    //response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT");
    response.setHeader("Expires", "0");
    response.setHeader("Pragma","no-cache"); 

SensorLogController c = new SensorLogController();
msg = c.getListJson();%><%= msg %>