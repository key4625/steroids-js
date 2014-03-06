
class window.MapviewController

  # always put everything inside PhoneGap deviceready
  document.addEventListener "deviceready", ->

    # Make Navigation Bar to appear with a custom title text
    steroids.navigationBar.show { title: "Map View" }

  @testMapViewAsModal: () ->
    # create a new mapView with simple parameters
    mapView = new steroids.views.MapView "Sattelite"
    
    steroids.modal.show {
      view: mapView
    }

  @testMapViewFullParams: () ->
    
    # create a new mapView
    mapView = new steroids.views.MapView 
      # mapType can be: Standard, Sattelite or Hybrid
      mapType: "Standard"
      
      # Doing so causes the map view to use Core Location to find the user’s location and add an annotation of type MKUserLocation to the map.
      showsUserLocation: true
      
      # region to be displayed displayed in the mapView
      region: 
        center: 
          # The latitude in degrees. Positive values indicate latitudes north of the equator. Negative values indicate latitudes south of the equator.
          latitude: 41.2889
          # The longitude in degrees. Measurements are relative to the zero meridian, with positive values extending east of the meridian and negative values extending west of the meridian.
          longitude: 174.7772
  
        span: 
          # The amount of north-to-south distance (measured in meters) to use for the span.
          latitudinalMeters: 1000
          # The amount of east-to-west distance (measured in meters) to use for the span.
          longitudinalMeters: 2000

    steroids.layers.push 
      view: mapView

  @testMapViewHybvridWithOverlay: () ->
    mapView = new steroids.views.MapView 
      mapType: "Hybrid"
      location: "/views/mapview/mapoverlay.html"
    steroids.layers.push 
      view: mapView
    