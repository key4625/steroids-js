describe "Navigation Bar", ->
  it "should show", (done) ->
    steroids.navigationBar.show {},
    {
      onSuccess: -> done()
    }

  it "should update with an image", (done) ->
    steroids.view.navigationBar.update(
      {
        titleImagePath: "/icons/pill@2x.png"
      }
      {
        onSuccess: -> done()
        onFailure: (error) -> done new Error JSON.stringify(error)
      }
    )
