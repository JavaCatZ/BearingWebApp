<#import "pages/common.ftl" as c>

<@c.page>
	<div class="row mt-3 mb-3">
		<div class="col-1"></div>
			<div class="col-10">
				<div class="card text-white bg-primary mt-3 mb-3" style="max-width: 15rem;">
  					<div id="labelText" class="card-header">Карта судов в море</div>
				</div>
				
				<div id="map" class="border border-primary rounded" style="width: 100%; height: 50rem;"></div>	
			</div>
		<div class="col-1"></div>
	</div>
</@c.page>