class NavigationBarButton
  constructor: (options={})->
    @title = options.title
    @onTap = options.onTap
    @imagePath = options.imagePath
    @imageAsOriginal = options.imageAsOriginal
    @styleClass = options.styleClass
    @styleId = options.styleId
    @styleCSS = options.styleCSS

  toParams: () ->
    params = {}
    if @title?
      params.title = @title
    else
      # iOS requires app.path, Android app.absolutePath
      relativeTo = if typeof AndroidAPIBridge is 'undefined'
         steroids.app.path
      else
        steroids.app.absolutePath

      params.imagePath = relativeTo + @imagePath

    params.imageAsOriginal = @imageAsOriginal
    params.styleClass = @styleClass
    params.styleId = @styleId
    params.styleCSS = @styleCSS

    return params

  getCallback: () ->
    if @onTap?
      return @onTap
