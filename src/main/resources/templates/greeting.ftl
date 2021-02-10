<#import "pages/common.ftl" as c>
<#include "pages/security.ftl">

<@c.page>
	<div class="jumbotron">
  		<#if isAdmin>
  			<h2 class="display-4">Добрый день, ${name}</h2>
  			<hr class="my-4">
  			<p>Теперь можно приступать к работе</p>
  		<#else>
  			<h2 class="display-4">Добрый день, гость!</h2>
  			<hr class="my-4">
  			<p>Для начала работы пройдите авторизацию</p>
  			<a class="btn btn-primary btn-lg" href="/login" role="button">Войти</a>
  		</#if>
	</div>
</@c.page>