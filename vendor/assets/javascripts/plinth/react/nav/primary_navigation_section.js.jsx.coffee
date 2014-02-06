###* @jsx React.DOM ###
App.Nav = App.Nav || {}

App.Nav.PrimaryNavigationSection = React.createClass
  displayName: "Primary Navigation"

  render: ->
    React.DOM.div({className:'nav-global_primary'},
        React.DOM.ul({className:'nav-global_items'}, @props.listNodes)
    )
