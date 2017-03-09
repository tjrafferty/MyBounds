<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Eureka Property Lines | PropertyPlotter</title>
    <meta name="description"
          content="Plot property lines on google maps with coordinates.">
    <style>
    /* Always set the map height explicitly to define the size of the div
     * element that contains the map. */

    section.map {
        height: 600px;
    }

    #map {
        height: 100%;
    }

    .map-container {
        border: 1px solid #3e8f3e;
        height: 600px;

    }

    /* Optional: Makes the sample page fill the window. */
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
    }
    </style>
</head>

<body data-page="plotter">
<div class="main-container">
    <section class="bg-section header plotter-header">
        <article>
            <div class="hero-copy">
                <h1>Property Plotter.</h1>

                <h2>4312 Eureka Ave</h2>
            </div>
        </article>

        <div class="bg bg12"></div>
    </section>
    <%--
        <section class="ready-qualify grey">
            <article>
                <h1>Ready to Qualify? <a class="btn btn-danger" href="/qualify">Yes</a></h1>
            </article>
        </section>
    --%>
    <section class="header-copy">
        <article>
            <div class="flex space-between page-header">
                <div class="page-title"><h2>4312 Eureka Ave, Yorba Linda, CA 92886</h2></div>

                <div class="page-title-btn">
                </div>
            </div>

        </article>
    </section>

    <section class="map">
        <article>
            <div class="map-container">
                <div id="map"></div>
            </div>

            <div class="row">
                <div class="col-sm-12">

                </div>
            </div>
        </article>
    </section>
</div>

<script>
    /*

     */

    function initMap() {

        var myOptions = {
            zoom: 15,
            center: {lat: 33.898217, lng: -117.819665},
            mapTypeId: 'satellite'
        }

        var map = new google.maps.Map(document.getElementById("map"), myOptions);

        // Define the LatLng coordinates for the polygon's path.
        var propertyCoords = [
            {lat: 33.898323, lng: -117.820007},
            {lat: 33.898329, lng: -117.819106},
            {lat: 33.898090, lng: -117.819201},
            {lat: 33.898076, lng: -117.820012}
        ];

        // Construct the polygon.
        var propertyPoly = new google.maps.Polygon({
            paths: propertyCoords,
            strokeColor: '#FF0000',
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: '#FF0000',
            fillOpacity: 0.15
        });

        var bounds = new google.maps.LatLngBounds();
        var i;

        for (i = 0; i < propertyCoords.length; i++) {
            bounds.extend(propertyCoords[i]);
        }
        
        propertyPoly.setMap(map);
        map.setCenter(bounds.getCenter()); //or use custom center
        map.fitBounds(bounds);
        //remove one zoom level to ensure no marker is on the edge.
        map.setZoom(map.getZoom() - 1);

        // set a minimum zoom
        // if you got only 1 marker or all markers are on the same address map will be zoomed too much.
        if (map.getZoom() > 15) {
            map.setZoom(15);
        }
    }
</script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB_YXzmbvjY4omeH2qwWRkOYP6av379yP0&callback=initMap">
</script>
</body>
</html>