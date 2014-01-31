###* @jsx React.DOM ###
App.Nav = App.Nav || {}

App.Nav.PrimaryMobileNavigationSection = React.createClass
  displayName: "Primary Mobile Navigation"
  render: ->
    styles = display: if @props.showSubNav then "" else "none"
    React.DOM.ul({className:'nav-global_items ', style: styles}, @props.listNodes)
