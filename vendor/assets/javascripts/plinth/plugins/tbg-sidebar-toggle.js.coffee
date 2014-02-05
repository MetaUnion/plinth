# ============================================================
# TBG sidebarToggle v0.0.1
# http://URL
# ============================================================
# Copyright 2012 The Beans Group
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

plugin = ($)->

  "use strict"  

  # CLOSE CLASS DEFINITION
  # 
  # @example how to use the class
  #     sidebartoggleinstance = new sidebartoggle $('.my-element')
  #     # toggle element
  #     sidebartoggleinstance.toggle()
  #
  # @example Self initalising plugin
  #     %a{href: "#", data: { 'sidebarToggle': true }
  class SidebarToggle

    # Construct a new Toggle instance
    #
    # @param [Object] element HTMLElement on which the toggle event will be called from
    #
    constructor: ( element ) ->
      @$el = $(element)
      @$canvas = $('.off-canvas')

    # Expose the Class 
    _constructor: SidebarToggle

    # class that is added to the canvas when clicked
    _toggleClass: "off-canvas-active"

    # Toggle the canvas -Toggle _toggleClass on the canvas when the element is clicked
    #
    toggle : -> @$canvas.toggleClass( @_toggleClass )
  
  # CLOSE PLUGIN DEFINITION
  # ==========================
  
  $.fn.sidebarToggle = ( option ) ->
    this.each ->
      $this = $(@)
      data = $this.data 'sidebarTogglePlugin'
      if !data then $this.data 'sidebarTogglePlugin', (data = new SidebarToggle @)
      if typeof option is 'string' then data[option]()

  $.fn.sidebarToggle.Constructor = SidebarToggle
  
  
  # DATA API
  # ===================================
  
  $ ->
    $('body').on 'click.sidebarToggle.data-api', '[data-sidebarToggle]', ( e ) ->
      $(e.target).sidebarToggle('toggle')
      e.preventDefault()

do ( plugin ) ->
  if typeof define is 'function' and define.amd
    # AMD. Register as an anonymous module.
    define(['jquery'], plugin)
  else
    # Browser globals
    plugin(jQuery)
