<html>
    <head>
        <script>
            function changepass(){
                var username= document.getElementById("username").value;
                var old_password= document.getElementById("old_passwordd").value;
                var new_password= document.getElementById("new_password").value;
                var confirm_new_password= document.getElementById("confirm_new_password").value;
                var display_message= document.getElementById("display-message");

                if (new_password!==confirm_new_password){
                    display_message.innerHTML= "New Password do not match! Check again."
                    return;
                }

				let jax= new XMLHttpRequest();
				jax.open("POST", "changepass.jsp",true);
				jax.onreadystatechange= function(){
					if(jax.readyState==4 && jax.status==200){ 
                        display_message.innerText= xhr.responseText;
					}
				};
				
				jax.send('username=' + username + '&old_password='+ old_password+ '&new_password='+new_password);
            }
        </script>
    </head>
    <body>

        <label>Username:</label>
        <input type="text" id="username" required>
        <br><br>
        <label>Old Password:</label>
        <input type="password" id="old_password" required>
        <br><br>
        <label>New Password:</label>
        <input type="password" id="new_password" required>
        <br><br>
        <label>Confirm New Password:</label>
        <input type="password" id="confirm_new_password" required>
        <br><br>
        <label id="display-message"></label>
        <input type="submit" value="Change Password" onclick="changepass()">
    </body>
</html>