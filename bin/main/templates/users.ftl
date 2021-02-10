<#import "pages/common.ftl" as c>

<@c.page>

<div class="row">
    <div class="col-md-6">
    	<div class="card text-white bg-primary mt-3 mb-3" style="max-width: 15rem;">
  			<div id="labelText" class="card-header">Пользователи</div>
		</div>
    </div>
    
    <div class="col-md-6 text-right">
    	<a class="btn btn-outline-primary mt-3" role="button" aria-pressed="true" href="/registration" data-toggle="tooltip" title="Добавление пользователя"><img src="/images/add.png" style="width: 35px; height: 35px;"></a>
    </div>
 </div>
 
 <#if userId??>
    <div class="alert alert-success mt-3 mb-3" role="alert">
        Пользователь #${userId} был успешно удалён из системы...
    </div>
</#if>

<div class="card-columns">
	
    <#list users as user>
    <div class="card  ${(user.active)?string('border-primary', 'border-danger')} mb-3">
         <div class="card-header bg-transparent ${(user.active)?string('border-primary', 'border-danger')}">
         	<div class="row">
    			<div class="col-md-6">
    				<h5 class="text text-primary mt-2">User's id:  ${user.id_employee}</h5>
    			</div>
    
    			<div class="col-md-2 text-right">
    				<a class="btn" role="button" aria-pressed="true" href="/users/edit/${user.username}" data-toggle="tooltip" title="Редактирование пользователя"><img src="/images/edit.png" style="width: 25px; height: 25px;"></a>
    			</div>
    			
    			<#if user.active>
	    			<div class="col-md-2 text-right">
	    				<a class="btn" role="button" aria-pressed="true" href="/users/block/${user.username}" data-toggle="tooltip" title="Блокировать пользователя"><img src="/images/unblock.png" style="width: 25px; height: 25px;"></a>
	    			</div>
    			<#else>
    				<div class="col-md-2 text-right">
	    				<a class="btn" role="button" aria-pressed="true" href="/users/block/${user.username}" data-toggle="tooltip" title="Снять блокировку пользователя"><img src="/images/block.png" style="width: 25px; height: 25px;"></a>
	    			</div>
    			</#if>
    			
    			<div class="col-md-2 text-right">
    				<a class="btn" role="button" aria-pressed="true" href="/users/delete/${user.username}" data-toggle="tooltip" title="Удаление пользователя"><img src="/images/delete.png" style="width: 25px; height: 25px;"></a>
    			</div>
    			
 			</div>
         </div>
         
           <div class="card-body text-primary">
    			<h5 class="card-title">Login: ${user.username}</h5>
    			<h5 class="card-text">User's role: ${user.role}</h5>
    			<div class="row">
    				<div class="col-6">
    					<h5 class="card-text">User's status:</h5>
    				</div>
    				
    				<div class="col-6 text-left">
    					<h5 class="card-text ${(user.active)?string('text-success', 'text-danger')}">${(user.active)?string('Active', 'Blocked')}</h5>
    				</div>
    			</div>
  		   </div>
  			
  		 <div class="card-footer bg-transparent  ${(user.active)?string('border-primary', 'border-danger')}">
	  		<div class="row">
		  		 <div class="col-6">
			      	 <h5>User's activity:</h5>
			     </div>
		     
		     	 <#assign count=0>
		     	 <#if user.desc_active>
				     <div class="col-2">  	
				        <img src="/images/pc.png" style="width: 35px; height: 35px;">
				        <#assign count=1>
				     </div> 
			     </#if>  	
			     
			     <#if user.web_active>
				     <div class="col-2">  	
				        <img src="/images/web.png" style="width: 35px; height: 35px;">
				        <#assign count=1>
				     </div> 
			     </#if> 
			     
			     <#if user.phone_active>
				     <div class="col-2">  	
				        <img src="/images/phone.png" style="width: 35px; height: 35px;">
				        <#assign count=1>
				     </div> 
			     </#if> 
			     
			      <#if count=0>
			      		<div class="col-6">
			        		<h5 class="text-danger">No activity...</h5>
			        	</div>
			      </#if>
	        </div>
       </div>
    </div>
    <#else>
    	<div class="alert alert-danger" role="alert">
 		 	No users...
		</div>
    </#list>
</div>
</@c.page>