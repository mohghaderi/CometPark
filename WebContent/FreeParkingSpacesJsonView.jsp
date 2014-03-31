<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="utf-8"%><%@ page import="java.util.List" %><%@ page import="CometPark.ParkingSpaceController" %><%

String msg = "";


ParkingSpaceController c = new ParkingSpaceController();
msg = c.FindFreeParkingSpacesJson();


%><%= msg %>