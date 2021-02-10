<#import "pages/common.ftl" as c>

<@c.page>

<#switch messageType>
	<#case "messages">
	<div class="row">
			<div class="col-1"></div>
	
			<div class="col-10">
	
				<div class="text-white border border-white bg-primary rounded mt-3 mb-3 font-weight-bold">
  					<h2 class="text-white ml-3">Просмотр пакета #${message.id_packet}</h2>
  				</div>
	
				<div class="card border-primary mt-3 mb-3">
         			<div class="card-header bg-transparent border-primary">
         				<div class="row">
    						<div class="col-md-10">
    							<h4 class="text-primary mt-2">Id пакета: #${message.id_packet}</h4>
    						</div>
    					
    						<div class="col-2 text-right">
    							<a class="btn" role="button" aria-pressed="true" href="/packages/messages/delete/${message.id_packet}" data-toggle="tooltip" title="Удаление пакета #${message.id_packet}"><img id="special" src="/images/delete.png"></a>
    						</div>
 						</div>
         			</div>
         	
           			<div class="card-body text-primary">
    					<h5 class="card-title">Отправитель: id${message.id_sender}</h5>
    					<h5>Судно: ${message.vessel_info}</h5>
    					<h5 class="card-text">Тема: ${message.packet_theme}</h5>
    					<h5 class="card-text">Описание: ${message.packet_desc}</h5>
    				</div>			
    			
        			<div id="date" class="card-footer bg-transparent border-primary text-right"><h5>${message.date_time}</h5></div>
    			</div>
    		</div>
    		
    		<div class="col-1"></div>
		</div>
	<#break>
	
	<#case "fulls">
		<div class="modal fade" id="image-modal" tabindex="-1" role="dialog">
  			<div class="modal-dialog modal-lg">
    			<div class="modal-content">
      				<div class="modal-header">
        				<div class="modal-title text-primary font-weight-bold">Просмотр изображения</div>
      				</div>
      
      				<div class="modal-body">
        				<img style="min-width: 46rem; max-width: 48rem; height: auto" class="img-responsive center-block rounded" src="" alt="">
      				</div>
      	
      				<div class="modal-footer"> 
        				<button type="button" class="btn btn-default btn-outline-primary" data-dismiss="modal">Закрыть</button>
      				</div>
    			</div>
  			</div>
		</div>

		<div class="row">
			<div class="col-1"></div>
	
			<div class="col-10">
	
				<div class="text-white border border border-white bg-primary rounded mt-3 mb-3 font-weight-bold">
  					<h2 class="text-white ml-3">Просмотр пакета #${message.id_packet}</h2>
  				</div>
	
				<div class="card border-primary mt-3 mb-3">
         			<div class="card-header bg-transparent border-primary">
         				<div class="row">
    						<div class="col-md-10">
    							<h4 class="text-primary mt-2">Id пакета: #${message.id_packet}</h4>
    						</div>
    					
    						<div class="col-2 text-right">
    							<a class="btn" role="button" aria-pressed="true" href="/packets/fulls/delete/${message.id_packet}" data-toggle="tooltip" title="Удаление пакета #${message.id_packet}"><img id="special" src="/images/delete.png"></a>
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
    			
    					<div class="card-columns">
    						<#list message.packet_images as photo>
  								<div class="card border-primary mb-3" style="max-width: 20rem;">
    								<a href="#" class="thumbnail">
       									<img class="img-thumbnail" src="${resURL}${message.id_packet}/${photo}" alt="Error of load ${photo}">
    								</a>
  								</div>
  							</#list>
						</div>
    				</div>			
    			
        			<div id="date" class="card-footer bg-transparent border-primary text-right"><h5>${message.date_time}</h5></div>
    			</div>
    		</div>
    		
    		<div class="col-1"></div>
		</div>
	<#break>
	
</#switch>

</@c.page>