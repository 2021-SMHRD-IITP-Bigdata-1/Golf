<%@page import="com.VO.memberVO"%>
<%@page import="com.VO.golfVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%// ���� ����
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   ArrayList<golfVO> list = new ArrayList<golfVO>();
   String uid = "cgi_4_1";
   String pwd = "smhrd1";
   String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:XE";
   String sql = "select * from golfinfo";%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Golf_0816</title>

    <!-- ��Ÿ�� ��Ʈ -->
    <link href="css/index.css" rel="stylesheet">

    <!-- js -->
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/index.js"></script>
</head>

<body>
<%
	//������ ���� �κ�
	ArrayList<golfVO> arr = (ArrayList<golfVO>)session.getAttribute("golf_session");
	memberVO loginvo = (memberVO)session.getAttribute("login_session");
%>
<%
	//�ʱ� ���� �������� �ٷ� �ѷ��� ����Ʈ ���������� jsp�� �����Ͽ����ϴ�.
    try {
          Class.forName("oracle.jdbc.driver.OracleDriver");
          conn = DriverManager.getConnection(url, uid, pwd);
          stmt = conn.createStatement();
          rs = stmt.executeQuery(sql);
          while (rs.next()) {
           	golfVO gvo = new golfVO();
           	gvo.setGolf_id(rs.getInt(1));
    		gvo.setGolf_name(rs.getString(2));
    		gvo.setLat(rs.getFloat(11));
    		gvo.setLag(rs.getFloat(12));
    		gvo.setGolf_img(rs.getString(13));
    		gvo.setGolf_holes(rs.getString(5));
    		gvo.setGolf_section(rs.getString(4));
    		gvo.setGolf_caddy(rs.getString(8));
    		list.add(gvo);
    		}
    	} catch (Exception e) {
    		e.printStackTrace();
    	} finally {
    		try {
    	if (rs != null) {
    		rs.close();
    	}
    	if (stmt != null) {
    		stmt.close();
    	}
    	if (conn != null) {
    		conn.close();
    	}
    		} catch (Exception e) {
    	e.printStackTrace();
    		}
    	}
%>



<!------------------------------------------------------------------------ ���â -->
    <div id="modalbox"></div> <!-- ��޹ڽ� -->

    <!----------------------------------------------------------- ���â_1 : �α��� -->
        <div id="loginModalcontent">
            <div id="loginX">
                <img src="img/x.png">
            </div>
            <div id="loginbox">
                <div id="loginLogobox">
                    <img id="loginLogoimg" src="img/golf_list.png">
                    <p>Any Golf</p>
                </div>
                <form id="loginForm" action="login.do">
                            <input class="loginInput" type="text" name="loginId" placeholder="���̵�">
                            <input class="loginInput" type="text" name="loginPw" placeholder="��й�ȣ">
                            <input class="loginButton" id="loginButton" type="submit" value="�α���">
                            <input class="loginButton" id="findeButton" type="submit" value="���̵�/��й�ȣ ã��">
                </form>
            </div>
        </div>

    <!----------------------------------------------------------- ���â_2 : ȸ������ -->
    <div id="joinModalcontent">
        <div id="joinX">
            <img src="img/x.png">
        </div>
        <div id="joinbox">
            <div id="joinLogobox">
                <img id="joinLogoimg" src="img/golf_list.png">
                <p>ȸ������</p>
            </div>
            <!-- <form name="formName" method="post" enctype="multipart/form-data"> -->
            <form id="joinForm" action="join.do">
                <table id="joinTable">
                    <tr>
                        <td><h5>�̸�</h5></td>
                        <td><input class="joinInput" type="text" name="joinName" placeholder="�̸�"></td>
                    </tr>
                    <tr>
                        <td><h5>���̵�</h5></td>
                        <td><input class="joinInput" type="text" name="joinid" placeholder="���̵�"></td>
                    </tr>
                    <tr>
                        <td><h5>�н�����</h5></td>
                        <td><input class="joinInput" type="text" name="joinPw" placeholder="��й�ȣ"></td>
                    </tr>
                    <tr>
                        <td><h5>�н�����Ȯ��</h5></td>
                        <td><input class="joinInput" type="text" name="joinPwCheck" placeholder="��й�ȣ"></td>
                    </tr>
                    <tr>
                        <td><h5>��ȭ��ȣ</h5></td>
                        <td><input class="joinInput" type="text" name="joinCall" placeholder="��ȭ��ȣ('-' ����)"></td>
                    </tr>                    
                    <tr>
                        <td><h5>�г���</h5></td>
                        <td><input class="joinInput" type="text" name="joinNick" placeholder="�г���"></td>
                    </tr>
                    <tr>
                        <td><h5>�����ڼ���</h5></td>
                        <td>
                        <select class="joinInput" name="joinselect">
                            <option value="1">�Ϲ�</option>
                            <option value="2">ĳ��</option>
                            <option value="3">���</option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td><h5>������Ȯ��</h5></td>
                        <td id="filetd"><input id="joinInputFile" type="file" name="inputfile"></td>
                    </tr>
                    <tr>
                        <td><h5>�ٹ�������</h5></td>
                        <td>
                            <select class="joinInput" name="joingolf">
                                <option value="none">���þ���</option>
                                <option value="Ǫ�����强cc">Ǫ���ְ���cc</option>
                                <option value="����cc">����cc</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><h5>��������</h5></td>
                        <td>
                            <select class="joinInput" name="joinarea">
                                <option value="ȣ����">ȣ����</option>
                                <option>����1</option>                          
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><h5>�������</h5></td>
                        <td><input class="joinInput" type="date" name="joinBirth" placeholder="���̵�"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input class="joinButton" id="joinButton" type="submit" value="ȸ�����Խ�û"></td>
                    </tr>
                </table>     
            </form>
        </div>
    </div>        


    <!----------------------------------------------------------- ���â_3 : mypage_�������� -->
    <div id="mypageModalcontent">
        <div id="mypageX">
            <img src="img/x.png">
        </div>
        <div id="mypagebox">
            <div id="mypageLogobox">
                <img id="mypageLogoimg" src="img/golf_list.png">
                <p>My page</p>
            </div>

            <form id="mypageForm" action="updata.do">
                <table id="mypageTable">
                    <tr>
                        <td><h5>�̸�</h5></td>
                        <td id="mypageTableName" name="updataId">�����̸�</td>
                    </tr>
                    <tr>
                        <td><h5>���̵�</h5></td>
                        <td id="mypageTableId">���ξ��̵�</td>
                    </tr>
                     <tr>
                         <td><h5>�н�����</h5></td>
                        <td><input class="mypageInput" type="password" name="updataPw" placeholder="��й�ȣ"></td>
                    </tr>
                    <tr>
                        <td><h5>�н�����Ȯ��</h5></td>
                        <td><input class="mypageInput" type="password" name="updataPw" placeholder="��й�ȣ"></td>
                    </tr>
                    <tr>
                        <td><h5>��ȭ��ȣ</h5></td>
                        <td id="mypageInputcall"><input class="mypageInput" type="text" name="updataCall" placeholder="��ȭ��ȣ('-' ����)"></td>
                    </tr>                    
                    <tr>
                        <td><h5>�г���</h5></td>
                        <td id="mypageInputnick"><input class="mypageInput" type="text" name="updataNick" placeholder="�г���"></td>
                    </tr>
                    <tr>
                        <td><h5>��������</h5></td>
                        <td>
                            <select class="mypageInput" name="updataArea">
                                <option value="ȣ����">ȣ����</option>
                                <option>��������2</option>
                                <option>��������3</option>
                                </select>
                        </td>
                    </tr>
                    <tr>
                        <td><h5>�������</h5></td>
                        <td id="mypageInputbirth"><input class="mypageInput" type="date" name="updataBirth"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input id="mypageButton" type="submit" value="���������Ϸ�" onclick="showupdata()"></td>
                    </tr>
                </table>     
            </form> 

        </div>
    </div>



    <!----------------------------------------------------------- ���â_4 : jjim_���� -->
    <div id="jjimModalcontent">
        <div id="jjimX">
            <img src="img/x.png">
        </div>
        <div id="jjimbox">
            <div id="jjimLogobox">
                <img id="jjimLogoimg" src="img/golf_list.png">
                <p> My List </p>
            </div>

            <div id="jjimForm">
                    <ul class="jjimListBox">
                        <li class="jjimimg"><img src="img/mainBack.jpg"></li>
                        <li class="jjimGolfjang">
                            <ul>
                                <li>�������̸�!!!!</li>
                                <li>��Ȧ</li>
                                <li>�⺻</li>
                                <li>ĳ��</li>
                            </ul>
                        </li>
                        <li class="jjimDeleteBT"><p>�����</p></td>
                    </ul> 

                    <ul class="jjimListBox">
                        <li class="jjimimg"><img src="img/mainBack.jpg"></li>
                        <li class="jjimGolfjang">
                            <ul>
                                <li>�������̸�!!!!</li>
                                <li>��Ȧ</li>
                                <li>�⺻</li>
                                <li>ĳ��</li>
                            </ul>
                        </li>
                        <li class="jjimDeleteBT"><p>�����</p></td>
                    </ul> 
            </div> 

        </div>
    </div>



    <!----------------------------------------------------------- ���â_5 : golfmember(�����������) -->

    <div id="golfmemberModalcontent">
        <div id="golfmemberX">
            <img src="img/x.png">
        </div>
        <div id="golfmemberbox">
            <div id="golfmemberLogobox">
                <img id="golfmemberLogoimg" src="img/golf_list.png">
                <p>��������</p>
            </div>


            <form id="golfmemberForm">
                <table id="golfmemberTable">
                    <tr>
                        <td><h5>������</h5></td>
                        <td>������ �̸�</td>
                    </tr>
                    <tr>
                        <td><h5>����</h5></td>
                        <td>
                            <select class="golfmemberInput">
                                <option>������</option>
                                <option>������</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><h5>����</h5></td>
                        <td>
                            <select class="golfmemberInput">
                                <option>ȸ����</option>
                                <option>������</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><h5>��Ȧ</h5></td>
                        <td>
                            <select class="golfmemberInput">
                                <option>Ȧ��</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><h5>ĳ��</h5></td>
                        <td>
                            <select class="golfmemberInput">
                                <option>ĳ��Y</option>
                                <option>ĳ��N</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><h5>�ּ�</h5></td>
                        <td><input class="golfmemberInput" type="text" name="joinName"></td>
                    </tr>                   
                    <tr>
                        <td><h5>��ȭ��ȣ</h5></td>
                        <td><input class="golfmemberInput" type="text" name="joinName"></td>
                    </tr>                    
                    <tr>
                        <td><h5>����</h5></td>
                        <td>
                        <ul id="golfmemberPrice">
                            <li>
                                <Select class="golfmemberInput" id="golfmemberInput1">
                                    <option> 0 </option>
                                </select><span> ~ </span>
                                <select class="golfmemberInput" id="golfmemberInput2">
                                    <option> 0 </option>
                                </select> ��
                            </li>
                        </ul>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2"><input id="golfmemberButton" type="submit" value="���������Ϸ�"></td>
                    </tr>
                </table>     
            </form> 

        </div>
    </div>

<!--------------------------------------------------------------- üũ�ڽ� -->
<div id="checkBox">
        <form action="front.do">
            <ul id="checkTitle">
                <li>
                    <ul id="checkTitleList">
                        <li><h3>���� ��</h3></li>
                        <li><h3>���� ��</h3></li>
                        <li><h3>ĳ�� ��</h3></li>
                        <li><h3>�ݾ� ��</h3></li>
                        <li><h3>����ġ</h3></li>
                    </ul>
                    <ul id="checkTitleBtbox">
                        <li id="checkTitleBt"><input type="submit" value="�˻�"></li>
                    </ul>

                    <ul id="checkMenuList">
                        <li>
                            <ul class="checkList">
                                <li><input type="checkbox" name="sudo"> ������</li>
                                <li><input type="checkbox" name="sudo"> ������</li>
                                <li><input type="checkbox" name="sudo"> ��õ��</li>
                                <li><input type="checkbox" name="sudo"> ����</li>
                                <li><input type="checkbox" name="sudo" value="ȣ����"> ȣ����</li>
                                <li><input type="checkbox" name="sudo"> ������</li>
                                <li><input type="checkbox" name="sudo"> ���ֱ�</li>
                            </ul>
                            <ul class="checkList">
                                <li><input type="checkbox" name="member" value="ȸ��"> ȸ����</li>
                                <li><input type="checkbox" name="member" value="����"> ������</li>
                            </ul>
                            <ul class="checkList">
                                <li><input type="checkbox" name="caddy" value="Y"> Y</li>
                                <li><input type="checkbox" name="caddy" value="N"> N</li>
                                <li><input type="checkbox" name="caddy" value="������"> ������</li>
                            </ul>
                            <ul class="checkList" id="checkList4">
                                <li>
                                    <Select>
                                        <option> 0 </option>
                                    </select><span> ~ ��</span>
                                    <select>
                                        <option> 0 </option>
                                    </select> ��
                                </li>
                            </ul>
                        </li>
                        <li id="checkboxUp">
                            ��
                        </li>
                    </ul>
                </li>
            </ul>
        </form>
    </div>  


<!----------------------------------------- ���̵�� �����̵�_ 1 _ ����Ʈ�ڽ�(sideListContain) + ��������(sidePageContain) -->  
<div id="slideSidebox">
    <!-- ������⺻��������Ʈ�ڽ�-->
    <div id="sideListContain">
    <% if( arr == null) { %>
    	<% for(int i = 0; i < list.size(); i++) { %>
    	<% String str = list.get(i).getGolf_name(); %>
        <div class="golfList" id="<%= i %>" onclick="getInfo()">
            <ul class="golfListGolfjang" >
                <li class="golfListimg" ><img src="<%=list.get(i).getGolf_img() %>" id="<%= i %>"></li>
                <li class="golfListText">
                    <ul>
                        <li><%= list.get(i).getGolf_name() %></li>
                        <li>Ȧ : <%= list.get(i).getGolf_holes() %></li>
                        <li>�⺻ : <%= list.get(i).getGolf_section() %></li>
                        <li>ĳ�� : <%= list.get(i).getGolf_caddy() %></li>
                    </ul>
                </li>
            </ul>     
        </div>
	<% } %>
	<% }else{ %>
		<% for(int i = 0; i < arr.size(); i++) { %>
    	<% String str = arr.get(i).getGolf_name(); %>
    	<div class="golfList" id="<%= i %>" onclick="getInfo()">
            <ul class="golfListGolfjang">
                <li class="golfListimg" ><img src="<%=arr.get(i).getGolf_img() %>" id="<%= i %>"></li>
                <li class="golfListText">
                    <ul>
                        <li><%= arr.get(i).getGolf_name() %></li>
                        <li>Ȧ : <%= arr.get(i).getGolf_holes() %></li>
                        <li>�⺻ : <%= arr.get(i).getGolf_section() %></li>
                        <li>ĳ�� : <%= arr.get(i).getGolf_caddy() %></li>
                    </ul>
                </li>
            </ul>     
        </div>
     	<% } %>
    <% } %>

    </div> <!-- sideListContain _ ���̵� ����Ʈ �����̵� ���� -->
    
    <!-- ������ �������� �ڽ�-->
    <div id="sidePageContain">
        <div id="sidePageContainClose">
            <img src="img/x.png">
        </div>
        <div id="golfinfoPage">
            <div id="golfImg">
                <img id="golfinfoimg" src="img/mainBack.jpg">
            </div>
            <div id="golfTitle">
                <ul>
                    <li id="golfjangName"><h2 id="golfName">������ �̸�!</h2></li>
                    <li id="reviewStar">�١١١١�</li>
                    <li id="golfSimpleInfo">
                        <ul>
                            <li id="golfjanggibon">�⺻</li>
                            <li id="golfjanghole">Ȧ</li>
                            <li id="golfjangcaddy">ĳ��</li>
                        </ul>
                        <ul>
                            <li>�ּ�</li>
                            <li>��ȭ</li>
                            <li>����</li>
                        </ul>
                        <ul>
                            <li id="golfjangaddr">�ش�������ּҺ������</li>
                            <li id="golfjangcall">000)000-0000</li>
                            <li>0~99999999</li>
                        </ul>
                    </li>
                </ul>
            </div>

            <div>
                <ul id="golfInfoMenu">
                    <li id="information">������ ����</li>
                    <li id="review" onclick="getReview()">����</li>
                    <li id="serch">�ֺ����</li>
                </ul>
            </div>

            <div id="golfInfoBox">
                <!-- ������ ����, ����, ��� �� div�ڽ� -->
                <div id=""></div>
                <div id=""></div>
                <div id=""></div>
                
            </div>
        </div>
    </div> <!--sidePageContain _ ���̵� �������� �����̵� ���� �ڽ� 2--> 

    <!-- ������ ���̵�� �ݱ� ȭ��ǥ -->
    <div id="sideContainClose"> <p>��</p> </div>

</div> <!-- slideSidebox _1_ ���̵� �ܺ� ��ü �ڽ� -->




<!----------------------------------------- ���̵�� �����̵�_ 2 _ ���ΰԽ��Ǹ���Ʈ�ڽ�(sideListContain) + ��������(sidePageContain) -->  
<div id="joinslideSidebox"> <!-- ���� �����̵� ��ü�ڽ� -->
    <!-- ���ΰԽ��Ǹ���Ʈ�ڽ�-->
    <div id="joinsideListContain"> <!-- ���θ���Ʈ ��ü�ڽ�-->
        <div id="joinBoardSearch"> <!-- ���θ���Ʈ �˻���ü�ڽ�-->
            
                <ul id="joinBoardMenu">
                    <li>
                        <select class="joinListSearch">
                            <option>ȣ����</option>
                        </select>
                    </li>
                    <li><input type="text"></li>
                    <li><input type="submit" value="�˻�"></li>
                    <li><button id="writeBT">�۾���</button></li>
                </ul>
            
        </div>
        <div class="joinBoardList"> <!-- ���θ��Խñ� ����Ʈ �ڽ�-->
            <ul class="joinList">
                <li class="joinList1"> 0001</li>
                <li class=joinList2> ���Ӹ� </li>
                <li class="joinList3"> ������������ </li>
                <li class="joinList4"> 2021-08-09 </li>
            </ul>
        </div>
    </div> <!-- sideListContain _ ���̵� ����Ʈ �����̵� ���� -->
    
    <!-- ���ΰԽ��� �������� �ڽ�-->
    <div id="joinsidePageContain">
        <div id="joinsidePageContainClose">
            <img src="img/x.png">
        </div>
        <div id="joininfoPage">

            <!-- ���ΰԽ��� ������ �������  -->



        </div>
    </div> <!--sidePageContain _ ���̵� �������� �����̵� ���� �ڽ� 2--> 

    <!-- ������ ���̵�� �ݱ� ȭ��ǥ -->
    <div id="joinsideContainClose"> <p>��</p> </div>

</div> <!-- slideSidebox _2_ ���̵� �ܺ� ��ü �ڽ� -->


<!--------------------------------------------------------------- main ��ü�ڽ� -->
<div id="fullbox">
    <!---------------------------------------------------------- ��ܹڽ� -->
    <div id="contain1">
        <!-------------------------- �ΰ�ڽ�-->
        <div id="logobox">Any �� Golf</div>

        <!-------------------------- �α��θ޴��ڽ� -->
        <div id="memberbox">
                <li class="membermenu" id="golfmember">�������</li>
                <li class="membermenu" id="jjim"> �� </li>
                <li class="membermenu" id="mypage" onclick="getloginInfo()">��������</li>
                <%if(loginvo==null){ %>
                <li class="membermenu" id="join">ȸ������</li>
                <li class="membermenu" id="login">�α���</li>
                <%}else{ %>
                <li class="membermenu"><%=loginvo.getMember_nick()%></li>
                <li class="membermenu" id="logout"><a id="logouta" href="logout.do">�α׾ƿ�</a></li>
                <%} %>
            </ul>
        </div>

    </div>

    <!----------------------------------------------------------- �ϴܹڽ� -->
    <div id="contain2">
        <!-------------------------- ���̵� �޴� �ڽ� -->
        <div id="sidebox">
            
            <ul id="sidemenulist">
                <il class="sidemenu" id="list">
                    <img class="sidemenuicon" src="img/golf_list.png">
                    <p class="sidemenutext">������</p>
                </il>
                <il class="sidemenu" id="comm">
                    <img class="sidemenuicon" src="img/list.png">
                    <p class="sidemenutext">�Խ���</p>
                </il>
                <il class="sidemenu" id="commcaddy">
                    <img class="sidemenuicon" src="img/list.png">
                    <p class="sidemenutext">ĳ��</p>
                </il>
            </ul>
            
        </div><!--�����޴��ڽ� -->
        <div id="mapbox">
        <!-- ������ ǥ���� div �Դϴ� -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6d1ce6f8899e60fa17f31b2756fe009a"></script>
		<script>
			var mapContainer = document.getElementById('mapbox'), // ������ ǥ���� div 
    		mapOption = { 
        	center: new kakao.maps.LatLng(35.684981, 128.021940), // ������ �߽���ǥ
        	level: 13 // ������ Ȯ�� ����
    		};
			// ������ ǥ���� div��  ���� �ɼ�����  ������ �����մϴ�
			var map = new kakao.maps.Map(mapContainer, mapOption);
			//���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			// ������ Ȯ�� �Ǵ� ��ҵǸ� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���ϵ��� �̺�Ʈ�� ����մϴ�
			kakao.maps.event.addListener(map, 'zoom_changed', function() {            
			    // ������ ���� ������ ���ɴϴ�
			    var level = map.getLevel();
			   	map.setMaxLevel(13);	    
			});
			//��Ŀ�� ǥ�õ� ��ġ�Դϴ� 
			<% if( arr == null) { %>
			<% for(int i = 0; i < list.size(); i++) { %>
			   var markerPosition  = new kakao.maps.LatLng(<%= list.get(i).getLat()%>, <%= list.get(i).getLag()%>);
			   // ��Ŀ�� �����մϴ�
			   var marker = new kakao.maps.Marker({
			       position: markerPosition
			   });
			   // ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
			   marker.setMap(map);
			   <% } %>
			   <% }else{ %>
			   <% for(int i=0; i< arr.size(); i++) { %>
			   var markerPosition  = new kakao.maps.LatLng(<%= arr.get(i).getLat()%>, <%= arr.get(i).getLag()%>);
			   // ��Ŀ�� �����մϴ�
			   var marker = new kakao.maps.Marker({
			       position: markerPosition
			   });
			   // ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
			   marker.setMap(map);
			   <% } %>
			   <% } %>
		</script>
        </div>
    </div>


</div> <!-- fullbox : ��üȭ�� -->

<script>
		function getInfo() {
			var id_num = $(event.srcElement).attr("id")
			console.log(id_num)
			$.ajax({
				//��û�� ���� ������
				url : "GetSrcList",
				//���� ������ Ÿ��
				dataType : "json",
				success : function(data){
					$("#golfName").html(data[id_num].golf_name);
					$("#golfinfoimg").attr("src", data[id_num].golf_img);
					$("#golfjanggibon").html(data[id_num].golf_section);
					$("#golfjanghole").html(data[id_num].golf_holes);
					$("#golfjangcaddy").html(data[id_num].golf_caddy);
					$("#golfjangaddr").html(data[id_num].golf_address);
					$("#golfjangcall").html(data[id_num].golf_call);
					//$("#golftitlehole").html(data[id_num].golf_hole);
					//$("#golftitlelocation").html(data[id_num].golf_area);
					//$("#imgex").attr("src", data[id_num].caddy);					
				},
				error : function() {
					alert("����!")
				}
			});	
		}
		function getloginInfo() {
			var id_num = $(event.srcElement).attr("id")
			console.log(id_num)
			$.ajax({
				//��û�� ���� ������
				url : "GetUserInfo",
				//���� ������ Ÿ��
				dataType : "json",
				success : function(data){
					$("#mypageTableName").html(data[0].member_name);
					$("#mypageTableId").html(data[0].member_id);
					$("#mypageInputcall input").attr('placeholder', data[0].member_call);
					$("#mypageInputnick input").attr('placeholder', data[0].member_nick);			
				},
				error : function() {
					alert("����!")
				}
			});	
		}
		function showupdata(){
			
			
			$("#loginButton").click();
			alert("ȸ�������� ���ŵǾ����ϴ� �ٽ� �α������ּ��� ^^");
			$("#logouta").click();
			
		}
		
		function getReview() {
			$.ajax({
				//��û�� ���� ������
				url : "GetReivew",
				//���� ������ Ÿ��
				dataType : "json",
				success : function(data){
					for(var i in data){
						//console.log(data[i].member_nick);
						//var ri = "<div id="golfChangeBox">";
						//ri += "<div class="golfinfoInner">";
						//ri += "<h3>"+data[i].member_nick+"</h3>"; 
						//ri += "</div>";
						//ri += "</div>";
						//$('#golfInfoBox').append(ri);
						var h1 = "<h1>"+data[i].member_nick+"</h1>";
						$('#golfInfoBox').append(h1);
					}	
				},
				error : function() {
					alert("����!")
				}
			});	
		}
		
		
</script>

</body>
</html>