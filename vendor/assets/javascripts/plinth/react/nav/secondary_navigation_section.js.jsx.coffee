###* @jsx React.DOM ###
App.Nav = App.Nav || {}

App.Nav.SecondaryNavigationSection = React.createClass
  displayName: "Secondary Navigation"

  render: ->
    listNodes = @props.secondaryItems.map (item, k)-> App.Nav.ListItem({item: item, key: "secondary_#{k}" })
    React.DOM.div({className:'nav-global_secondary'},
        React.DOM.ul({className:'nav-global_items inline-list'}, listNodes)
    )
