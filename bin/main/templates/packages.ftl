<#import "pages/common.ftl" as c>
<#import "pages/pager.ftl" as p>
<#include "pages/security.ftl">

<@c.page>

<div class="btn-group mt-3 mb-3" role="group" aria-label="Basic example">
  <a class="btn btn-primary" href="/packages/coords" data-toggle="tooltip" title="Показать пакеты с координатами">Координаты</a>
  <a class="btn btn-primary" href="/packages/messages" data-toggle="tooltip" title="Показать пакеты с сообщениями">Сообщения</a>
  <a class="btn btn-primary" href="/packages/fulls" data-toggle="tooltip" title="Показать пакеты с полным содержанием">Полные</a>
</div>

<#if packetId??>
    <div class="alert alert-success mt-3 mb-3" role="alert">
        Пакет #${packetId} был успешно удалён из системы...
    </div>
</#if>

<#switch messageType>

  	<#case "coords">
  	  <@p.pager url page />
  		<div class="card-columns">
    		<#list page.content as message>
    			<div class="card border-primary mb-3" style="max-width: 35rem;">   			
         			<div class="card-header bg-transparent border-primary">
         				<div class="row">
         					<div class="col-md-10">
    							<h4 class="text-primary mt-2">Id пакета:  ${message.id_packet}</h4>
    						</div>
    					
    						<div class="col-md-2 text-right">
    							<a class="btn" role="button" aria-pressed="true" href="/packages/coords/delete/${message.id_packet}" data-toggle="tooltip" title="Удаление пакета #${message.id_packet}"><img src="/images/delete.png" style="width: 25px; height: 25px;"></a>
    						</div>
    					</div>
         			</div>
         			
           				<div class="card-body text-primary">
    						<h5 class="card-title">Отправитель: id${message.id_sender}</h5>
    						<h5>Судно: ${message.vessel_info}</h5>
    						<h5 class="card-text">Широта: ${message.latitude}</h5>
    						<h5 class="card-text">Долгота: ${message.longitude}</h5>
  						</div>
        			<div id="date" class="card-footer bg-transparent border-primary text-right"><h5>${message.date_time}</h5></div>
    			</div>
    		<#else>
    			<div class="alert alert-danger ml-3" role="alert">
 		 			No coordinate packets...
				</div>
    		</#list>
		</div>
	  <@p.pager url page />
  	<#break>
  	
  	<#case "messages">
  	  <@p.pager url page />
  		<div class="card-columns">
    		<#list page.content as message>
    			<div class="card border-primary mb-3" style="max-width: 55rem;">
         			<div class="card-header bg-transparent border-primary">
         				<div class="row">
    						<div class="col-md-8">
    							<h4 class="text-primary mt-2">Id пакета:  ${message.id_packet}</h4>
    						</div>
    
    						<div class="col-2">
    							<a class="btn" role="button" aria-pressed="true" href="/packages/messages/view/${message.id_packet}" data-toggle="tooltip" title="Детальный просмотр пакета #${message.id_packet}"><img src="/images/eye.png" style="width: 30px; height: 30px;"></a>
    						</div>
    					
    						<div class="col-2 text-right">
    							<a class="btn" role="button" aria-pressed="true" href="/packages/messages/delete/${message.id_packet}" data-toggle="tooltip" title="Удаление пакета #${message.id_packet}"><img src="/images/delete.png" style="width: 25px; height: 25px;"></a>
    						</div>
 						</div>
         			
         			</div>
           				<div class="card-body text-primary">
    						<h5 class="card-title">Отправитель: id${message.id_sender}</h5>
    						<h5>Судно: ${message.vessel_info}</h5>
    						<h5 class="card-text">Тема: ${message.packet_theme}</h5>
    						<h5 class="card-text">Сообщение: ${message.packet_desc}</h5>
  						</div>
        			<div id="date" class="card-footer bg-transparent border-primary text-right"><h5>${message.date_time}</h5></div>
    			</div>
   			 <#else>
    			<div class="alert alert-danger ml-3" role="alert">
 		 			No message packets...
				</div>
    		</#list>
		</div>
	  <@p.pager url page />
    <#break>
  
  	<#case "fulls">
  	  <@p.pager url page />
  		<div class="card-deck">
    		<#list page.content as message>
    			<div class="card border-primary mb-3" style="min-width: 25rem; max-width: 35rem;">
         			<div class="card-header bg-transparent border-primary">
         				<div class="row">
    						<div class="col-md-9">
    							<h4 class="text-primary mt-2">Id пакета: ${message.id_packet}</h4>
    						</div>
    
    						<div class="col-1 text-rigth">
    							<a class="btn" role="button" aria-pressed="true" href="/packages/fulls/view/${message.id_packet}" data-toggle="tooltip" title="Детальный просмотр пакета #${message.id_packet}"><img id="special" src="/images/eye.png"></a>
    						</div>
    					
    						<div class="col-2 text-right">
    							<a class="btn" role="button" aria-pressed="true" href="/packages/fulls/delete/${message.id_packet}" data-toggle="tooltip" title="Удаление пакета #${message.id_packet}"><img id="special" src="/images/delete.png"></a>
    						</div>
 						</div>
         			</div>
           				<div class="card-body text-primary">
    						<h5 class="card-title">Отправитель: id${message.id_sender}</h5>
    						<h5>Судно: ${message.vessel_info}</h5>
    						<h5 class="card-text">Широта: ${message.latitude}</h5>
    						<h5 class="card-text">Долгота: ${message.longitude}</h5>
    						<h5 class="card-text">Категория: ${message.packet_cat}</h5>
    						<h5 class="card-text">Тема: ${message.packet_theme}</h5>
    						<h5 class="card-text">Описание: ${message.packet_desc}</h5>
    						
    						<hr class="my-4">
    						
    							<div id="${message.id_packet}" class="carousel slide" data-ride="carousel">
    							
    								<#assign count=0>
    							
  									<ol class="carousel-indicators">
  										<#list message.packet_images as photo>
  										
    										<#if count == 0>
      											<li data-target="#${message.id_packet}" data-slide-to="${count}" class="active"></li>
      										<#else>
      											<li data-target="#${message.id_packet}" data-slide-to="${count}"></li>
    										</#if>
    										
    										<#assign count++>
    										
    									</#list>
  									</ol>
  									
  									<#assign count=0>
  									
  									<div class="carousel-inner">
    						 			
    						 			<#list message.packet_images as photo>
    						 				<#if count == 0>
    						 					<div class="carousel-item active">
      												<img class="d-block w-100" max-width="100%" height="auto" src="${resURL}${message.id_packet}/${photo}" alt="  Error of load ${photo}">
      												<div class="carousel-caption d-none d-md-block">
    													<p>Название фото: ${photo}</p>
  													</div>
    											</div>
    						 			
    						 				<#else>
    											<div class="carousel-item">
      												<img class="d-block w-100" max-width="100%" height="auto" src="${resURL}${message.id_packet}/${photo}" alt="  Error of load ${photo}">
      												<div class="carousel-caption d-none d-md-block">
    													<p>Название фото: ${photo}</p>
  													</div>
    											</div>
    										</#if>
    										
    										<#assign count++>
    									</#list>
    									
    									<#assign count=0>
  									</div>
  							
  									<a class="carousel-control-prev" href="#${message.id_packet}" role="button" data-slide="prev">
    									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    									<span class="sr-only">Previous</span>
  									</a>
  							
  									<a class="carousel-control-next" href="#${message.id_packet}" role="button" data-slide="next">
    									<span class="carousel-control-next-icon" aria-hidden="true"></span>
    									<span class="sr-only">Next</span>
  									</a>
								</div>	
  						</div>
        			<div id="date" class="card-footer bg-transparent border-primary text-right"><h5>${message.date_time}</h5></div>
    			</div>
   			 <#else>
    			<div class="alert alert-danger ml-3" role="alert">
 		 			No full packets...
				</div>
    		</#list>
		</div>
	  <@p.pager url page />
    <#break>
    
</#switch>

</@c.page>