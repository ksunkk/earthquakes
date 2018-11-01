class GoogleMap 
  # исходные настройки
  zoom =
    initialView: 15
    closeView: 18
  markers = []
  map = undefined

  constructor: (home) ->
    # определяем центр карты и параметры отображения
    lat = home["lat"]
    lon = home["lon"]
    myLatlng = new google.maps.LatLng(lat, lon)
    mapOptions =
      zoom: zoom.initialView
      center: myLatlng

    # создаём карту
    map = new google.maps.Map(document.getElementById("map"), mapOptions)

  addMarker: (location, title) ->
    # создаём маркер и добавляем в массив маркеров
    marker = new google.maps.Marker(
      position: location,
      title: title,
      map: map
    )
    markers.push marker

    # добавляем обработчик события
    google.maps.event.addListener marker, "click", ->
      map.setZoom zoom.closeView
      map.setCenter marker.getPosition()

  addMarkers: (markerList) ->
    # добавляем все маркеры
    _.each markerList, (marker) =>
      position = new google.maps.LatLng marker["lat"], marker["lon"]
      title = "#{marker['full_address']}"
      @addMarker position, title
  
  drawMarkers: (map) ->
    # отрисовываем маркеры
    _.each markers, (marker) ->
      marker.setMap map
      # ВАЖНО: вызов метода setMap на маркере отрисовывает маркер, вызов с параметром null – стирает
  
  showMarkers: ->
    @setAllMap map

  hideMarkers: ->
    @setAllMap null

  removeListeners: ->
    _.each markers, (marker) ->
      google.maps.event.clearInstanceListeners(marker)

  deleteMarkers: ->
    @hideMarkers()
    @removeListeners()
    markers = []
