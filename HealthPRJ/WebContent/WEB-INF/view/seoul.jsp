<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login</title>
</head>
<body>
<div class="content">

			<div class="map"><img id="seoulmap" usemap="#map" src="/resources/img/map.png" alt="서울시지도"></div>
			
			<map name="map">
				<area shape="poly" coords="470,183,417,206,399,235,415,242,414,256,434,270,465,232,472,236,480,228,481,201,470,183" onmouseover="MapSelect('01');" onmouseout="MapClear();" href="?SearchGroup2=강동구" alt="강동구">
				<area shape="poly" coords="398,236,377,269,361,272,345,268,355,291,388,307,404,328,408,348,419,347,418,336,432,336,450,310,452,296,431,287,436,272,411,257,409,241,397,234" onmouseover="MapSelect('02');" onmouseout="MapClear();" href="?SearchGroup2=송파구" alt="송파구">
				<area shape="poly" coords="284,258,303,300,306,318,321,324,331,341,366,336,373,349,379,356,387,354,395,359,409,345,390,305,355,294,343,266,302,249,283,256" onmouseover="MapSelect('03');" onmouseout="MapClear();" href="?SearchGroup2=강남구" alt="강남구">
				<area shape="poly" coords="283,262,252,291,244,330,256,355,267,347,284,362,308,349,308,388,351,391,366,385,378,356,364,337,332,344,283,261" onmouseover="MapSelect('04');" onmouseout="MapClear();" href="?SearchGroup2=서초구" alt="서초구">
				<area shape="poly" coords="254,289,245,330,236,330,224,305,192,303,168,316,186,293,195,276,217,275,253,288" onmouseover="MapSelect('05');" onmouseout="MapClear();" href="?SearchGroup2=동작구" alt="동작구">
				<area shape="poly" coords="164,322,174,332,182,355,207,390,231,384,254,359,245,332,223,315,223,304,188,304,162,321" onmouseover="MapSelect('06');" onmouseout="MapClear();" href="?SearchGroup2=관악구" alt="관악구">
				<area shape="poly" coords="163,322,135,320,133,332,146,366,165,391,201,379,180,353,172,331,164,321" onmouseover="MapSelect('07');" onmouseout="MapClear();" href="?SearchGroup2=금천구" alt="금천구">
				<area shape="poly" coords="71,288,71,287,59,307,69,322,57,340,94,340,121,310,135,319,170,321,155,305,147,281,133,276,123,288,102,284,89,293,74,284,70,283" onmouseover="MapSelect('08');" onmouseout="MapClear();" href="?SearchGroup2=구로구" alt="구로구">
				<area shape="poly" coords="141,228,148,245,139,262,135,274,153,285,159,308,167,315,187,296,194,275,172,269,162,244,140,228" onmouseover="MapSelect('09');" onmouseout="MapClear();" href="?SearchGroup2=영등포구" alt="영등포구">
				<area shape="poly" coords="69,242,71,281,89,289,116,281,125,285,136,273,147,242,140,225,133,232,117,225,118,247,104,257,87,248,80,229,69,241" onmouseover="MapSelect('10');" onmouseout="MapClear();" href="?SearchGroup2=양천구" alt="양천구">
				<area shape="poly" coords="41,151,43,172,12,206,7,228,33,237,34,251,51,238,64,243,81,229,92,252,111,255,118,247,120,224,127,230,139,224,41,149" onmouseover="MapSelect('11');" onmouseout="MapClear();" href="?SearchGroup2=강서구" alt="강서구">
				<area shape="poly" coords="349,130,355,153,351,171,363,194,384,194,407,158,400,119,379,125,348,129" onmouseover="MapSelect('12');" onmouseout="MapClear();" href="?SearchGroup2=중랑구" alt="중랑구">
				<area shape="poly" coords="292,193,291,181,329,147,351,143,350,172,363,193,353,211,332,203,321,190,290,192" onmouseover="MapSelect('13');" onmouseout="MapClear();" href="?SearchGroup2=동대문구" alt="동대문구">
				<area shape="poly" coords="387,195,364,198,336,254,367,261,407,210,386,211,386,195" onmouseover="MapSelect('14');" onmouseout="MapClear();" href="?SearchGroup2=광진구" alt="광진구">
				<area shape="poly" coords="294,196,294,197,295,213,279,231,286,246,300,239,333,254,355,211,329,203,321,191,293,196" onmouseover="MapSelect('15');" onmouseout="MapClear();" href="?SearchGroup2=성동구" alt="성동구">
				<area shape="poly" coords="239,194,227,206,230,217,267,222,277,232,295,212,294,192,238,192" onmouseover="MapSelect('16');" onmouseout="MapClear();" href="?SearchGroup2=중구" alt="중구">
				<area shape="poly" coords="233,220,209,253,217,264,241,276,255,276,286,246,277,229,232,218" onmouseover="MapSelect('17');" onmouseout="MapClear();" href="?SearchGroup2=용산구" alt="용산구">
				<area shape="poly" coords="143,160,131,180,113,187,176,242,191,239,211,254,235,219,227,206,214,213,194,213,193,201,142,161" onmouseover="MapSelect('18');" onmouseout="MapClear();" href="?SearchGroup2=마포구" alt="마포구">
				<area shape="poly" coords="148,166,162,157,159,129,170,84,201,70,209,64,219,69,238,95,216,111,220,132,188,165,176,166,162,178,149,167" onmouseover="MapSelect('19');" onmouseout="MapClear();" href="?SearchGroup2=은평구" alt="은평구">
				<area shape="poly" coords="162,182,178,166,190,166,220,130,220,182,234,196,229,207,196,214,192,203,161,182" onmouseover="MapSelect('20');" onmouseout="MapClear();" href="?SearchGroup2=서대문구" alt="서대문구">
				<area shape="poly" coords="238,101,214,114,223,152,220,183,234,194,292,195,293,178,270,160,248,153,253,124,239,97" onmouseover="MapSelect('21');" onmouseout="MapClear();" href="?SearchGroup2=종로구" alt="종로구">
				<area shape="poly" coords="254,96,253,96,242,102,251,123,247,151,268,159,289,179,331,148,352,145,352,129,337,125,327,113,305,132,288,127,254,94" onmouseover="MapSelect('22');" onmouseout="MapClear();" href="?SearchGroup2=성북구" alt="성북구">
				<area shape="poly" coords="277,21,259,34,259,53,250,61,253,94,287,126,302,130,328,111,320,98,285,70,277,19" onmouseover="MapSelect('23');" onmouseout="MapClear();" href="?SearchGroup2=강북구" alt="강북구">
				<area shape="poly" coords="287,0,279,21,287,68,314,95,327,81,327,6,305,9" onmouseover="MapSelect('24');" onmouseout="MapClear();" href="?SearchGroup2=도봉구" alt="도봉구">
				<area shape="poly" coords="362,6,325,14,326,84,321,105,343,126,369,122,388,123,390,113,399,84,375,78,382,34,378,13,362,5" onmouseover="MapSelect('25');" onmouseout="MapClear();" href="?SearchGroup2=노원구" alt="노원구">
				<area shape="poly" coords="173,245,172,263,192,274,212,273,209,262,190,246,175,244" onmouseover="MapSelect('26');" onmouseout="MapClear();" href="javascript:void(0);" alt=" ">
			</map>

		</div>
</body>
</html>
