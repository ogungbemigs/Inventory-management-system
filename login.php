<?php
	session_start();
	
	// Check if user is already logged in
	if(isset($_SESSION['loggedIn'])){
		$_SESSION['auth'] = true;
		$_SESSION['start'] = time();
		$_SESSION['expire'] = $_SESSION['start'] + (10*60);
		
		header('Location: dashboard.php');
		exit();
	}
	
	require_once('inc/config/constants.php');
	require_once('inc/config/db.php');
	require_once('inc/header.html');
?>
  <body>
	  
  <canvas id='animationCanvas'></canvas>
			<canvas id='canvas1'></canvas>

<?php
// Variable to store the action (login, register, passwordReset)
$action = '';
	if(isset($_GET['action'])){
		$action = $_GET['action'];
		if($action == 'register'){
?>
			<div class="container">
			  <div class="row justify-content-center">
			  <div class="col-sm-12 col-md-5 col-lg-5">
				<div class="card">
				  <div class="card-header">
					Register
				  </div>
				  <div class="card-body">
					<form action="">
					<div id="registerMessage"></div>
					  <div class="form-group">
						<label for="registerFullName">Name<span class="requiredIcon">*</span></label>
						<input type="text" class="form-control" id="registerFullName" name="registerFullName">
						<!-- <small id="emailHelp" class="form-text text-muted"></small> -->
					  </div>
					   <div class="form-group">
						<label for="registerUsername">Username<span class="requiredIcon">*</span></label>
						<input type="email" class="form-control" id="registerUsername" name="registerUsername" autocomplete="on">
					  </div>
					  <div class="form-group">
						<label for="registerPassword1">Password<span class="requiredIcon">*</span></label>
						<input type="password" class="form-control" id="registerPassword1" name="registerPassword1">
					  </div>
					  <div class="form-group">
						<label for="registerPassword2">Re-enter password<span class="requiredIcon">*</span></label>
						<input type="password" class="form-control" id="registerPassword2" name="registerPassword2">
					  </div>
					  <a href="login.php" class="btn btn-primary">Login</a>
					  <button type="button" id="register" class="btn btn-success">Register</button>
					 <!-- <a href="login.php?action=resetPassword" class="btn btn-warning">Reset Password</a> -->
					  <button type="reset" class="btn">Clear</button>
					</form>
				  </div>
				</div>
				</div>
			  </div>
			</div>
<?php
			require 'inc/footer.php';
			echo '</body></html>';
			exit();
		} elseif($action == 'resetPassword'){
?>
			<div class="container">
			  <div class="row justify-content-center">
			  <div class="col-sm-12 col-md-5 col-lg-5">
				<div class="card">
				  <div class="card-header">
					Reset Password
				  </div>
				  <div class="card-body">
					<form action="">
					<div id="resetPasswordMessage"></div>
					  <div class="form-group">
						<label for="resetPasswordUsername">Username</label>
						<input type="text" class="form-control" id="resetPasswordUsername" name="resetPasswordUsername">
					  </div>
					  <div class="form-group">
						<label for="resetPasswordPassword1">New Password</label>
						<input type="password" class="form-control" id="resetPasswordPassword1" name="resetPasswordPassword1">
					  </div>
					  <div class="form-group">
						<label for="resetPasswordPassword2">Confirm New Password</label>
						<input type="password" class="form-control" id="resetPasswordPassword2" name="resetPasswordPassword2">
					  </div>
					  <a href="login.php" class="btn btn-primary">Login</a>
					  <a href="login.php?action=register" class="btn btn-success">Register</a>
					 <!-- <button type="button" id="resetPasswordButton" class="btn btn-warning">Reset Password</button> -->
					  <button type="reset" class="btn">Clear</button>
					</form>
				  </div>
				</div>
				</div>
			  </div>
			</div>
<?php
			require 'inc/footer.php';
			echo '</body></html>';
			exit();
		}
	}	
?>
	<!-- Default Page Content (login form) -->
	
	<div class="login_header" >
				<h2 class="hdw">Hardware Unit</h2>
					<h4 id="h4">Inventory Management System</h4>
			</div>
		
		  

    <div class="container">
      <div class="row justify-content-center">
	  <div class="col-sm-12 col-md-5 col-lg-5">
		<div class="card">
		  <div class="card-header">
			Login
		  </div>
		  <div class="card-body">
			<form action="">
			<div id="loginMessage"></div>
			  <div class="form-group">
				<label for="loginUsername">Username</label>
				<input type="text" class="form-control" id="loginUsername" name="loginUsername">
			  </div>
			  <div class="form-group">
				<label for="loginPassword">Password</label>
				<input type="password" class="form-control" id="loginPassword" name="loginPassword">
			  </div>
			  <button type="button" id="login" class="custom-btn btn-1 btn-primary">Login</button>
			   <!--<a href="login.php?action=register" class="btn btn-success">Register</a>-->
			 <!-- <a href="login.php?action=resetPassword" class="btn btn-warning">Reset Password</a> -->
			  <button type="reset" class="custom-btn btn-6">Clear</button>
			</form>
		  </div>
		</div>
		</div>
      </div>
    </div>
<?php
	require 'inc/footer.php';
?>
  </body>
  <script>
	  window.addEventListener('load', function(){
    const canvas = document.getElementById('canvas1');
    const ctx = canvas.getContext('2d');
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

	const animationCanvas = document.getElementById('animationCanvas');
    const animationCtx = animationCanvas.getContext('2d');
    animationCanvas.width = window.innerWidth;
    animationCanvas.height = window.innerHeight;

    ctx.lineCap = 'round';
    ctx.shadowColor = 'black';
    ctx.shadowOffsetX = 20;
    ctx.shadowOffsetY = 20;
    ctx.shadowBlur = 10;

    class Fractal {
        #ctx;
        #width;
        #height;
        constructor(ctx, width, height){
            this.#ctx = ctx;
            this.#width = width;
            this.#height = height;
            this.size = this.#width < this.#height ? this.#width * 0.3 : this.#height * 0.3;
            this.maxLevel = 3;
            this.branches = 5;

            this.sides = Math.floor(Math.random() * 7 + 4);
            this.scale = Math.random() * 0.2 + 0.2;
            this.spread = Math.random() * Math.PI;
            this.color = 'hsl(' + Math.random() * 360 + ', 100%, 50%)';
            this.lineWidth = Math.random() * 20 + 10;
        }
        #drawLine(level){
            if (level > this.maxLevel) return;
            this.#ctx.strokeStyle = this.color;
            this.#ctx.beginPath();
            this.#ctx.moveTo(0, 0);
            this.#ctx.lineTo(this.size, 0);
            this.#ctx.stroke();
            for (let i = 0; i < this.branches; i++){
                this.#ctx.save();
                this.#ctx.translate((this.size * i)/this.branches, 0);
                this.#ctx.scale(this.scale, this.scale);

                this.#ctx.save();
                this.#ctx.rotate(this.spread);
                this.#drawLine(level + 1);
                this.#ctx.restore();

                this.#ctx.save();
                this.#ctx.rotate(-this.spread);
                this.#drawLine(level + 1);
                this.#ctx.restore();

                this.#ctx.restore();
            }
        }
        draw(){
            this.#randomize();
            this.#ctx.clearRect(0,0,this.#width, this.#height);
            this.#ctx.lineWidth = this.lineWidth;
            this.#ctx.save();
            this.#ctx.translate(this.#width * 0.5, this.#height * 0.5);
            for (let i = 0; i < this.sides; i++){
                this.#drawLine(0);
                this.#ctx.rotate((Math.PI * 2)/this.sides)
            }
            this.#ctx.restore();
        }
        resize(width, height){
            this.#width = width;
            this.#height = height;
            this.size = this.#width < this.#height ? this.#width * 0.4 : this.#height * 0.4;
        }
        #randomize(){
            this.sides = Math.floor(Math.random() * 7 + 4);
            this.scale = Math.random() * 0.2 + 0.2;
            this.spread = Math.random() * Math.PI;
            this.color = 'hsl(' + Math.random() * 360 + ', 100%, 50%)';
            this.lineWidth = Math.random() * 20 + 10;
        }
    }
    const fractal = new Fractal(ctx, canvas.width, canvas.height);
    fractal.draw();

    window.addEventListener('resize', function(){
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
        ctx.shadowColor = 'black';
        ctx.shadowOffsetX = 20;
        ctx.shadowOffsetY = 20;
        ctx.shadowBlur = 10;
        fractal.resize(canvas.width, canvas.height)
        fractal.draw();
    });

    window.addEventListener('click', function(){
        fractal.draw();
    });

	let particles = [];
	const numberOfParticles = 20;
	const particleImage = new Image();
	particleImage.src = canvas.toDataURL();

	particleImage.addEventListener('load', function(){
		class Particle {
		constructor(canvasWidth, canvasHeight, image){
			this.canvasWidth = canvasWidth;
			this.canvasHeight = canvasHeight;
			this.image = image;
			this.sizeModifier = Math.random() * 10 + 3;
			this.width = image.width/this.sizeModifier;
			this.height = image.height/this.sizeModifier;
			this.x = Math.random() * this.canvasWidth;
			this.y = Math.random() * this.canvasHeight;
			this.speed = Math.random() * 2 + 1;
			this.angle = 0;
			this.va = Math.random() * 0.05 - 0.025;
			}
			draw(context){
				context.save();
				context.translate(this.x, this.y);
				context.rotate(this.angle);
				context.drawImage(this.image,0-this.width/2, 0- this.height/2, this.width, this.height);

				//context.strokeStyle = 'white';
				//context.strokeRect(-this.width/2,  -this.height/2, this.width, this.height);
				context.restore();
			}
			update(){
				this.angle += this.va;
				if (this.y > this.canvasHeight + this.height) {
					this.x = Math.random() * this.canvasWidth;
					this.y = 0 -this.height;
				}
				else this.y+=this.speed;
			}
		}
		for (let i = 0; i < numberOfParticles; i++){
			particles.push(new Particle(canvas.width, canvas.height, particleImage));
		}
		function animate(){
			animationCtx.clearRect(0,0,animationCanvas.width,animationCanvas.height)
			particles.forEach(particle => {
				particle.draw(animationCtx);
				particle.update();
			})
			requestAnimationFrame(animate);
		}
		animate();
	});
});
</script>
</html>
