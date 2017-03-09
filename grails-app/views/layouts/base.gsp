<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="MyBounds"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta property="og:image" content="${g.createLink(absolute: true, uri: assetPath(src: 'logos/mybounds-logo-.png'))}"/>
    <meta property="og:site_name" content="MyVounds"/>

    <g:if test="${page && page.name}">
        <meta property="og:title" content="${page.name}"/>
    </g:if>
    <g:if test="${page && page.metaDescription}">
        <meta name="description" content="${page.metaDescription}">
        <meta property="og:description" content="${page.metaDescription}"/>
    </g:if>
    <g:if test="${page && page.metaKeywords}">
        <meta name="keywords" content="${page.metaKeywords}">
    </g:if>
    <link rel="shortcut icon" sizes="64x64" href="${assetPath(src: 'favicons/mpc_fav2g_64.png')}" type="image/png">
    <link rel="shortcut icon" sizes="32x32" href="${assetPath(src: 'favicons/mpc_fav2g_32.png')}" type="image/png">
    <link rel="shortcut icon" sizes="24x24" href="${assetPath(src: 'favicons/mpc_fav2g_24.png')}" type="image/png">
    <link rel="shortcut icon" sizes="16x16" href="${assetPath(src: 'favicons/mpc_fav2g_16.png')}" type="image/png">
    <%--<link href='http://fonts.googleapis.com/css?family=Ubuntu:300, 400' rel='stylesheet' type='text/css'>--%>

    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>

    <script type="text/javascript">
        //var env = '${grailsApplication.config.mpc.environment}';
    </script>

    <%-- Layout Head--%>
    <g:layoutHead/>
</head>

<body class="${g.pageProperty(name: 'body.class')}" data-page="${g.pageProperty(name: 'body.data-page')}"
      data-id="${g.pageProperty(name: 'body.data-id')}">


<div class="flex vertical flex-wrapper wrapper">
    <%-- Header --%>
    <g:render template="/templates/header"/>
    <!-- /header -->

    <%-- Layout Body --%>
    <main>
        <g:layoutBody/>
    </main>

    <%-- Render Footer --%>
    <g:render template="/templates/footer"/>

</div>
</body>
</html>
