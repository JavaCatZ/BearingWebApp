<#import "pages/common.ftl" as c>

<@c.page>
<#assign admin=false>
<div class="row">
	<div class="col-3"></div>

 	<div class="col-6 align-self-center">
		<div class="card border-primary mt-3 ml-3 mb-3">
         	<div class="card-header bg-transparent text-primary border-primary"><h4 id="labelText">Редактирование пользователя #${user.id_employee}</h4></div>
           	<div class="card-body text-primary">
    			<form action="/edit/${user.getId_employee()}/${user.getUsername()}/user" method="post">
    			
  					<div class="form-group">
    					<label id="labelText" for="formGroupExampleInput">Логин</label>
    					<input id="labelText" type="text" class="form-control" name="username" value="${user.getUsername()}" placeholder="Введите логин">
  					</div>
  		
  					<div class="form-group">
    					<label id="labelText" for="formGroupExampleInput2">Пароль</label>
    					<input id="labelText" type="text" class="form-control" name="password" value="000000" placeholder="Введите новый пароль">
  					</div>
  		
  					<div class="form-group">
    					<label id="labelText" for="formGroupExampleInput2">Id пользователя</label>
    					<input id="labelText" type="text" class="form-control" name="id_employee" value="${user.getId_employee()}" placeholder="Введите id пользователя">
  					</div>
  					
  					<div class="custom-control custom-checkbox mb-3">
  						<#if user.isAdmin()>
  							<input id="customCheck1" type="checkbox" class="custom-control-input" name="role" checked>
  							<label id="labelText"class="custom-control-label" for="customCheck1">Администратор</label>
  							<#assign admin=true>
  						<#else>
  							<input id="customCheck1" type="checkbox" class="custom-control-input" name="role">
  							<label id="labelText"class="custom-control-label" for="customCheck1">Администратор</label>
  							<#assign admin=false>
  						</#if>
    				</div>		
  		
  					<input type="hidden" name="_csrf" value="${_csrf.token}" />
  		
  					<button id="labelText" type="submit" class="btn btn-primary">Сохранить</button>
				</form>
  			</div>
  			
  			<#if message??>
  				<div class="card-footer bg-transparent border-primary">
					<div class="alert alert-danger" role="alert">
 			 			${message}
					</div>
				</div>
			</#if>
    	</div>
	</div>

	<div class="col-3"></div>

</div>

</@c.page>