###* @jsx React.DOM ###
App.Sidebar = App.Sidebar || {}
App.Sidebar.Slat = App.Sidebar.Slat || {}

App.Sidebar.Slat.Basic = React.createClass
  displayName: "Basic Slat"

  render: ->
    data = @props.data
    React.DOM.div( { className: "img-block" },
      [
        React.DOM.div( {className:"img"}, 
          React.DOM.img( {src:data.thumb} )
        ), 
        React.DOM.div( {className:"content"}, 
          [
            React.DOM.h3( {className:"h5 sidebar__slat-title"}, data.title),
            React.DOM.p( {className: "sidebar__slat-description"}, data.description),
          ]
        )
      ]
    )
