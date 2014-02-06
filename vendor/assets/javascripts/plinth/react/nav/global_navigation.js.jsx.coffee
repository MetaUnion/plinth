###* @jsx React.DOM ###
#= require ./global_logo
#= require ./list_item
#= require ./primary_navigation_section
#= require ./primary_mobile_navigation_section
#= require ./primary_mobile_button
#= require ./secondary_navigation_section
#= require ../mixins/window_resize
App.Nav = App.Nav || {}

App.Nav.GlobalNavigation = React.createClass
  displayName: "Global Navigation"

  mixins: [App.Mixins.WindowResizeMixin]

  getInitialState: ->
    displayCount: null
    showSubNav: false

  getDefaultProps: ->
    primaryItems:   []
    secondaryItems: []

  componentWillMount: ->
    @loadNavigationData()

  componentDidMount: ->
    @didMountPrimaryNavigation()

  componentDidUpdate: (prevProps, prevState)->
    @updatePrimaryNavigation(prevProps, prevState)

  loadNavigationData: ->
    data = $.parseJSON(window.navJson)
    @props.primaryItems   = data.primary_navigation
    @props.secondaryItems = data.secondary_navigation


  #
  # Navigation controller methods
  #

  updatePrimaryNavigation: (prevProps, prevState)->
    @_resetDisplayCount() if prevState.windowSize != @state.windowSize
    @hideToFit()

  didMountPrimaryNavigation: ->
    @state.displayCount?= @props.primaryItems.length 
    @hideToFit()

  _is_overflowing: ->
    @refs.mobile_button.getDOMNode().offsetTop > 5

  _resetDisplayCount: ->
     @setState displayCount: @props.primaryItems.length

  hideToFit: ->
    return true if not @_is_overflowing() or @state.displayCount <= 0
    @setState displayCount: @state.displayCount-1

  toggleSubNav: ->
    @setState showSubNav: if @state.showSubNav then false else true

  #
  # Render Methods
  #


  moreButton: (count)->
    hide = @props.primaryItems.length == count
    App.Nav.PrimaryMobileButton({ref: "mobile_button", hide: hide, handleSubNavToggle: @toggleSubNav, count: count, key: "nav_toggle"})

  inlineListNodes: (count)->
    nodes = @props.primaryItems.map( (item, k)->
      display = if !count? or count > k then true else false
      App.Nav.ListItem({item: item, display: display, key: "inline_#{k}" })
    )
    nodes.push @moreButton(count)
    nodes

  blockListNodes: (count)->
    @props.primaryItems.map( (item, k)->
      display = if !count? or count > k then false else true
      App.Nav.ListItem({item: item, display: display, key: "block_#{k}"})
    )

  render: ->
    count = @state.displayCount
    block_listNodes = @blockListNodes(count)
    inline_listNodes = @inlineListNodes(count)
    React.DOM.div( {className:"nav-global"},
      [
        App.Nav.PrimaryMobileNavigationSection({listNodes: block_listNodes, showSubNav: @state.showSubNav, key: "primary_mobile_nav"}),
        App.Nav.GlobalLogo({key: "logo"}),
        App.Nav.SecondaryNavigationSection({secondaryItems: @props.secondaryItems, ref: "secondary_nav", key: "secondary_nav"}),
        App.Nav.PrimaryNavigationSection({listNodes: inline_listNodes, showSubNav: @state.showSubNav, key: "primary_nav"})
      ]
    )
