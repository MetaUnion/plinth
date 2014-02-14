###* @jsx React.DOM ###
#= require plinth/react/mixins/window_resize
#= require ./categories
#= require ./panels
App.Sidebar = App.Sidebar || {}

App.Sidebar.SidebarContainer = React.createClass
  displayName: "Sidebar Container"

  # mixins: [App.Mixins.WindowResizeMixin]

  # 
  # Lifecycle
  # 

  componentDidMount: ->
    @$parent = $(@getDOMNode()).parent()
    @initalPosition = @$parent.offset().top
    @$window = $(window)
    @_bindSecondaryEvents()

  componentWillUnmount: ->
    window.removeEventListener 'scroll', @handleScroll

  # 
  # Methods
  #i 

  _bindSecondaryEvents: ->
    @scrollTimer = null
    # $(window).on 'scroll', @handleScroll.bind(this)
    window.addEventListener 'scroll', @handleScroll#.bind(this)


  # Ensure that the the logic heavy scroll check is not 
  # fired too often.
  #
  handleScroll: (e)->
    clearTimeout(@scrollTimer)  if @scrollTimer?
    @scrollTimer = setTimeout( @fixSidebar.bind(@,e)  , 5)

  fixSidebar: (e)->
    fix = @$window.scrollTop() > @initalPosition
    return false unless fix isnt @isFixed
    @$parent[ if fix then 'addClass' else 'removeClass']('is-fixed')
    @isFixed = fix


  # 
  # Render
  # 

  render: ->
    React.DOM.div( { className: 'sidebar__container'}, 
        [
          App.Sidebar.Categories(),
          App.Sidebar.Panels()
        ]
    )
