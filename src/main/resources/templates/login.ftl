<#import "pages/common.ftl" as c>

<@c.page>

<div class="row">
	<div class="col-3"></div>

	<div class="col-6 align-self-center">
		<#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
    		<div class="alert alert-danger mt-3 ml-3 mb-3" role="alert">
        		${Session.SPRING_SECURITY_LAST_EXCEPTION.message}: введите корректные данные
    		</div>
		</#if>
	
		<div class="card border-primary mt-3 ml-3 mb-3">
         	<div class="card-header bg-transparent border-primary"><h4>Авторизация</h4></div>
           	<div class="card-body text-primary">
    			<form  action="/login" method="post">
    			
  					<div class="form-group">
    					<label for="formGroupExampleInput">Ваш логин</label>
    					<input type="text" class="form-control" name="username" placeholder="Логин">
    					<small class="form-text text-muted">Введите сюда свой логин</small>
  					</div>
  
  					<div class="form-group">
    					<label for="formGroupExampleInput">Ваш пароль</label>
    					<input type="password" class="form-control" name="password" placeholder="Пароль">
    					<small class="form-text text-muted">Введите сюда свой пароль</small>
  					</div>
 					
 					<input type="hidden" name="_csrf" value="${_csrf.token}" />
 
 					<button type="submit" class="btn btn-primary">Вход</button>
				</form>
  			</div>	
    	</div>
	</div>
	
	<div class="col-3"></div>
</div>
		
</@c.page>