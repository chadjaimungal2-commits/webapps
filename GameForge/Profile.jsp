<%@ page import="java.util.List" %>
<%@ page import="GameFG.DBConnect" %>
<%@ page import="java.sql.*" %>


 

<html>

    <head>  
     <title> Profile USER</title>
     <link rel="stylesheet" href="navbar.css">
     <link rel="stylesheet" href="GameForgeDesign.css">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
     
     


    </head>

    

<body>
     <%@ include file="navbar.jsp" %>
     <h1 id="profile-header">Profile</h1>

<div class="container">

    <div class="card">
        <h2>User Profile</h2>

        <div class="avatar-wrapper">
            <img id="previewImage" src="default.png" alt="Profile Image">
        </div>

        <input type="file" accept="image/*" id="fileInput" hidden>

        <button class="btn" onclick="document.getElementById('fileInput').click()">
            Upload Image
        </button>

    </div>

</div>

<script>
    const fileInput = document.getElementById('fileInput');
    const previewImage = document.getElementById('previewImage');

    fileInput.addEventListener('change', function () {
        const file = this.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                previewImage.src = e.target.result;

            };
            reader.readAsDataURL(file);/*takes the selected file (meaning your image) and turns it into a long text string that represents the image*/
        }
    });
</script>
     

    
   
     


</body>












</html>
