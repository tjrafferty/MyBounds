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

    #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto', 'sans-serif';
        line-height: 30px;
        padding-left: 10px;
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
                <table id="tableNeighbours" border="1">
                    <tr>
                        <th></th>
                        <th>KM</th>
                        <th>Miles</th>
                        <th>Feet</th>
                    </tr>
                </table>

                <div class="page-title-btn">
                </div>
            </div>

        </article>
    </section>

    <section class="map">
        <article>
            <div class="map-container">
                <div id="floating-panel"><input type="button" value="Rotate" onclick="rotate();"></div>

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
    var map;

    // Define the LatLng coordinates for the polygon's path.
    var propertyCoords = [
        {title: 'point1', lat: 33.898323, lng: -117.820007},
        {title: 'point2', lat: 33.898329, lng: -117.819106},
        {title: 'point3', lat: 33.898090, lng: -117.819201},
        {title: 'point4', lat: 33.898076, lng: -117.820012}
    ];

    function initMap() {
        var bounds = new google.maps.LatLngBounds();
        var i, latLng, marker, polyline, distances;

        var myOptions = {
            zoom: 15,
            center: {lat: 33.898217, lng: -117.819665},
            mapTypeId: 'satellite',
            heading: 90,
            scaleControl: true,
            tilt: 0
        }

        map = new google.maps.Map(document.getElementById("map"), myOptions);

        // Construct the polygon.
        var propertyPoly = new google.maps.Polygon({
            paths: propertyCoords,
            strokeColor: '#FF0000',
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: '#FF0000',
            fillOpacity: 0.15
        });

        var homeLatlng = new google.maps.LatLng(propertyCoords[0].lat, propertyCoords[0].lng);
        var content = {}
        for (i = 0; i < propertyCoords.length; i++) {
            latLng = new google.maps.LatLng(propertyCoords[i].lat, propertyCoords[i].lng);
            content.from = propertyCoords[i].title;
            if (i > 0) {
                homeLatlng = new google.maps.LatLng(propertyCoords[i].lat, propertyCoords[i-1].lng);
                content.from = propertyCoords[i-1].title;
            }
            // calculate the distance between latLng objs
            distances = calcDistance(homeLatlng, latLng);

            //Set info window content

            content.title = propertyCoords[i].title;
            content.distance = distances.feet;

            //Set marker location, and content
            setMarker(map, latLng, content);

            //Set Bounds
            bounds.extend(propertyCoords[i]);

            //Append Table Data
            $('#tableNeighbours').append(
                    '<tr>'
                    + '<td>' + propertyCoords[i].title + '</td>'
                    + '<td>' + distances.km + ' km</td>'
                    + '<td>' + distances.miles + ' miles</td>'
                    + '<td>' + distances.feet + ' feet</td>'
                    + '</tr>'
            );

        }

        propertyPoly.setMap(map);

        //Set Map
        map.setCenter(bounds.getCenter()); //or use custom center
        map.fitBounds(bounds);
        //remove one zoom level to ensure no marker is on the edge.
        map.setZoom(map.getZoom() - 1);
        // if you got only 1 marker or all markers are on the same address map will be zoomed too much.
        if (map.getZoom() > 15) {
            map.setZoom(15);
        }

    }

    function setMarker(map, latLng, content) {

        var marker, i
        var title = content.title;
        var info = "<h4>" + title + "</h4>" +
                "<p>(" + latLng.lat() + ", " + latLng.lng() + ")</p>" +
                "<p>" + content.distance + " feet from " + content.from + "</p>"


        marker = new google.maps.Marker({
            position: latLng,
            map: map,
            title: title,
            icon: 'https://maps.google.co.uk/intl/en_ALL/mapfiles/ms/micons/green-dot.png'
        });

        var infowindow = new google.maps.InfoWindow()

        google.maps.event.addListener(marker, 'click', (function (marker, info, infowindow) {
            return function () {
                infowindow.setContent(info);
                infowindow.open(map, marker);
            };
        })(marker, info, infowindow));

    }

    function calcDistance(p1, p2) {
        var distances = {};
        var gkmDistance = (google.maps.geometry.spherical.computeDistanceBetween(p1, p2) / 1000);
        var feet = (gkmDistance * 3280.8);
        var miles = (gkmDistance * 0.62137);
        distances.km = (gkmDistance).toFixed(2);
        distances.miles = miles.toFixed(2);
        distances.feet = feet.toFixed(2);

        return distances
    }

    function rotate90() {
        var heading = map.getHeading() || 0;
        map.setHeading(heading + 90);
    }

    function rotate() {
        // Determine if we're showing aerial imagery.
        map.setTilt(45)
        if (map.getTilt() !== 0) {
            rotate90()//window.setInterval(rotate90, 3000);
        }

    }

</script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB_YXzmbvjY4omeH2qwWRkOYP6av379yP0&callback=initMap&libraries=geometry">
</script>
</body>
</html>