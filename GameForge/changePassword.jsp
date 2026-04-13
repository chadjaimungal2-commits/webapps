<html>
<head>
    <link rel="stylesheet" href="navbar.css">
     <link rel="stylesheet" type="text/css" href="index.css">



    <style>
        #heading1{
            color: darkblue;
            text-align: center;
            font-family: Helvetica;
        }
        table{
            border: 1px solid gray;
            align-content: center;
            width: 40%;
            padding: 15px;
            border-spacing: 15px;
        }

         table.center {
            margin-left:auto;
            margin-right:auto;
        }
        #td1{
            width: 45%;
            padding-left: 45px;
            font-family: Helvetica;
        }
        #td2{
            padding-left: 35px;
        }

    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>

	<h1 id="heading1"> Change Password </h1>
	<br/> <br/>


    <form action="ChangePasswordFeedback.html" method="post" onsubmit="return validate()" >

    <table class="center">

			<tr>
				<td  id="td1"> Username: </td>
				<td id="td2"> <input type="email" name="uName"  size="30" id="userName" required /> </td>
			</tr>

            <tr>
				<td id="td1"> Old Password: </td>
				<td id="td2"> <input type="password" name="oldPassword"  size="30" id="oldPass" required /> </td>
			</tr>

            <tr>
				<td id="td1"> New Password: </td>
				<td id="td2"> <input type="password" name="pw1"  size="30" id="newPass1" placeholder="min. 7 characters" required/> </td>			
			</tr>

            <tr>
				<td id="td1"> Confirm New Password: </td>
				<td id="td2"> <input type="password" name="pw2"  size="30" id="newPass2" required /> </td>
			</tr>

			<tr>
				<td>  </td>
                <td id="td2"> <input type="submit" value="Update Password"  />
                    <button type="reset"  > Reset Form</button>

                </td>
			</tr>

			<tr>
		</table>

    </form>

    <script>
           //Add javaScript functions here
           function usingNewPassword(){

            var  OldP=document.getElementById("oldPass").value;
             var  NewP=document.getElementById("newPass1").value;

             if(OldP ==NewP){
                alert("You need a different Password");
                document.getElementById("oldPass").style.backgroundColor="C8DBE9";
                document.getElementById("newPass1").style.backgroundColor="C8DBE9";
                return false;

             }
             else{
                document.getElementById("oldPass").style.backgroundColor="";
                document.getElementById("newPass1").style.backgroundColor="";

             }
           }

           function matchingNewPasswords(){
            var newp1=document.getElementById("newPass1").value;
            var newp2=document.getElementById("newPass2").value;

            if (newp1 == newp2){
                 document.getElementById("newPass1").style.backgroundColor="";
                document.getElementById("newPass2").style.backgroundColor="";

                return true;
            }
            else{
                alert("New Passwords must Match Exactly");
                 document.getElementById("newPass1").style.backgroundColor="C8DBE9";
                document.getElementById("newPass2").style.backgroundColor="C8DBE9";
                return false;


            }
           }

           function passwordLength(){
             var newp1=document.getElementById("newPass1").value;
             if (newp1.length <6){
                alert=("You must have 6 or more Characters");
                document.getElementById("newPass1").style.backgroundColor="C8DBE9";
                return false;
             }
             else{
                document.getElementById("newPass1").style.backgroundColor="";
             }


           }

           function validate(){
            var result1 =usingNewPassword();
            if(result1 == false){
                return false;
            }
            var result2 =matchingNewPasswords();
                if(result2= false){
                    return false;
                    
                }

            var result3 =passwordLength();
            if (result3== false){
                return false;
            }
            

           }


    </script>

</body>
</html>
