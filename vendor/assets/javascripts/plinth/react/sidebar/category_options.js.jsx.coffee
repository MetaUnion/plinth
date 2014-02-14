###* @jsx React.DOM ###
App.Sidebar = App.Sidebar || {}

App.Sidebar.CategoryOptions = React.createClass
  displayName: "Category Options"


  # 
  # Render
  # 

  render: ->
    opts = @props.group.data.map (option, k)=>
      React.DOM.option({value: option.URL, key: "cat_opt_#{@props.group.groupName}_#{k}"}, option.label)

    React.DOM.optgroup({ label: @props.group.groupName}, opts )
