<#include "security.ftl">

<nav class="navbar navbar-expand-md sticky-top border-top-0 border-primary rounded-bottom">
    
    <img src="/images/logo.png" class="navbar-brand" width="60" height="70">
    
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav">
        	<#if isAdmin>
        		<li class="nav-item">
                	<a id="navbarText" class="btn btn-outline-primary ml-3" role="button" aria-pressed="true" href="/map">Карта</a>
            	</li>
        	
        		<li class="nav-item">
                	<a id="navbarText" class="btn btn-outline-primary ml-3" role="button" aria-pressed="true" href="/packages">Пакеты</a>
            	</li>
            	
            	<li class="nav-item">
                	<a id="navbarText" class="btn btn-outline-primary ml-3" role="button" aria-pressed="true" href="/users">Пользователи</a>
            	</li>
            	
            	<li class="nav-item">
                	<a id="navbarText" class="btn btn-outline-primary ml-3" role="button" aria-pressed="true" href="/ships">Суда</a>
            	</li>
            	
        	<#else>
        		<li class="nav-item">
                	<a id="navbarText" class="btn btn-outline-primary ml-3" role="button" aria-pressed="true" href="/greeting">Главная</a>
            	</li>
			</#if>        
        </ul>
    </div>
    
    <#if isAdmin>
     	<div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
        	<ul class="navbar-nav">
            	<li class="nav-item">
            		<form  action="/logout" method="post">	
  						<div id="navbarText" class="navbar-text ml-3 mr-3 pl-3 pr-3 text-primary text-center border border-success rounded">${name}</div>	
 						<input type="hidden" name="_csrf" value="${_csrf.token}" />
 						<button type="submit" class="btn btn-outline-primary" data-toggle="tooltip" data-placement="bottom" title="Выход"><a><img src="/images/logout.png" style="width: 25px; height: 20px;"></a></button>
					</form>
            	</li>    
        	</ul>
    	</div>
    </#if>
</nav>