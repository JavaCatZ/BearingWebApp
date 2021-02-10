<#import "pages/common.ftl" as c>

<@c.page>

<div class="row">
	<div class="col-3"></div>

 	<div class="col-6 align-self-center">
		<div class="card border-primary mt-3 ml-3 mb-3">
         	<div class="card-header bg-transparent text-primary border-primary"><h4 id="labelText">Добавление нового пользователя:</h4></div>
           	<div class="card-body text-primary">
    			<form action="/registration" method="post">
    			
  					<div class="form-group">
    					<label id="labelText" for="formGroupExampleInput">Введите логин</label>
    					<input id="labelText" type="text" class="form-control ${(usernameError??)?string('is-invalid', '')}" name="username" placeholder="Логин"/>
    					<#if usernameError??>
               		 		<div class="invalid-feedback">
                    			${usernameError}
                			</div>
            			</#if>
  					</div>
  		
  					<div class="form-group">
    					<label id="labelText" for="formGroupExampleInput2">Введите пароль</label>
    					<input id="labelText" type="text" class="form-control ${(passwordError??)?string('is-invalid', '')}" name="password" placeholder="Пароль">
    					<#if passwordError??>
               		 		<div class="invalid-feedback">
                    			${passwordError}
                			</div>
            			</#if>
  					</div>
  		
  					<div class="form-group">
    					<label id="labelText" for="formGroupExampleInput2">Введите id пользователя</label>
    					<input id="labelText" type="text" class="form-control ${(id_employeeError??)?string('is-invalid', '')}" name="id_employee" placeholder="Id пользователя">
    					<#if id_employeeError??>
               		 		<div class="invalid-feedback">
                    			${id_employeeError}
                			</div>
            			</#if>
  					</div>
  					
  					<div class="custom-control custom-checkbox mb-3">
  						<input id="customCheck1" type="checkbox" class="custom-control-input" name="role">
  						<label id="labelText"class="custom-control-label" for="customCheck1">Администратор</label>
					</div>
    				
  					<input type="hidden" name="_csrf" value="${_csrf.token}" />
  		
  					<button id="labelText" type="submit" class="btn btn-primary">Добавить</button>
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