###* @jsx React.DOM ###
#= require plinth/plugins/tbg-responsiveresize
App.Mixins = App.Mixins || {}

App.Mixins.WindowResizeMixin =
  getInitialState: ->
    windowSize: $(window).width()
    breakpoint: null

  componentWillMount: ()->
    $window = $(window)
    $window.on 'responsiveResize', this.resizeWindow
    $window.trigger 'resize'

  resizeWindow: (e,breakpoint)->
    @setState
      windowSize: $(window).width()
      breakpoint: breakpoint
