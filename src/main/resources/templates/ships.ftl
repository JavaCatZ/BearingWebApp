<#import "pages/common.ftl" as c>

<@c.page>

<div class="row">
   <div class="col-1"></div>
	    <div class="col-10">
			<div class="row">
				<div class="col-6">
				    <div class="card text-white bg-primary mt-3">
				  		<div id="labelText" class="card-header">Список судов и краткая информация о них</div>
					</div>
				</div>
				<div class="col-6"></div>	
	 		</div>
	 		
    		<#list ships as ship>
    			<div class="card  border-primary mb-3 mt-3">
         			<div class="card-header bg-transparent border-primary">
         				<div class="row">
	         				<div class="col-md-6 text-left">
	    						<h5 class="text text-primary mt-2">${ship.name}</h5>
	    					</div>
	    					
	    					<div class="col-md-6 text-right">
	    						<a class="btn btn-outline-primary mt-3" role="button" aria-pressed="true" href="/ships/delete/${ship.id_num}" data-toggle="tooltip" title="Удаление судна"><img src="/images/delete.png" style="width: 1rem; height: auto;"></a>
	    					</div>
    					</div>
         			</div>
         
		           <div class="card-body text-primary">
		    			<div class="row">
		    				<div class="col-6">
		    					<img class="border-primary rounded m1-3 mt-1" style="min-width: 22rem; max-width: 24rem; height: auto" src="${resURL}ships/${ship.photo}" alt="Error of load ${ship.photo}">
		    				</div>
		    				
		    				<div class="col-6">
		    					<h5 class="card-title">Id судна:  ${ship.id_num}</h5>
		    					<h5 class="card-title">Флаг: ${ship.flag}</h5>
		    					<h5 class="card-text">Год спуска: ${ship.year}</h5>
		    					<h5 class="card-title">Длина: ${ship.length}</h5>
		    					<h5 class="card-text">Ширина: ${ship.width}</h5>
		    					<h5 class="card-title">Высота: ${ship.height}</h5>
		    					<h5 class="card-text">Водоизмещение: ${ship.disp}</h5>
		    					<h5 class="card-text">Скорость: ${ship.speed}</h5>
		    					<h5 class="card-text">Экипаж: ${ship.crew}</h5>
		    				</div>
		    			</div>
		  		   </div>	
		  		   
		  		   <div class="card-footer bg-transparent border-primary">
	  					<div class="row">
		  		 			<div class="col-6">
			      	 			<h5>Рабочий статус:</h5>
			     			</div>
			     			
			     			<div class="col-6">
			      	 			<h5 class="card-text text-success">В эксплуатации</h5>
			     			</div>
		  		  		 </div>  
		  		  </div>
    			</div>
    		<#else>
    			<div class="alert alert-danger" role="alert">
 		 			No ships...
				</div>	 
    		</#list>	
    </div>
 	<div class="col-1"></div>
  </div>

</@c.page>