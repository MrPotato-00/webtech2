<html>
    <head>
        <script>
            function login(){
                var username= document.getElementById("username").value;
                var pasword= document.getElementById("password").value;
                var error_page= document.getElementById("error-page");
                if (username=="" || password==""){
                    error_page.innerText= "Username or Password cannot be empty."
                }

				let jax= new XMLHttpRequest();
				jax.open("GET", "checklogin.jsp?username=" + username + '&password='+password,true);
				jax.onreadystatechange= function(){
					if(jax.readyState==4 && jax.status==200){
                        if(response.trim()=="success"){
                            window.location.href="hellopage.html";
                        }
                        else{
                            error_page.innerText= "Login Error. Check Credentials."
                        }
					}
				};
				
				jax.send();
            }
        </script>
    </head>
    <body>
        <form method="POST">
            <label>Username:</label>
            <input type="text" id="username" class="input-box">
            <br><br>
            <label>Password:</label>
            <input type="password" id="password" class="input-box">
            <br><br>
            <button onclick="login()">Login</button>
            <p id="error-page"></p>
        </form>
    </body>
</html>