# ============================================================
# TBG Responsive Resize v0.0.1
# http://URL
# ============================================================
# Copyright 2012 The Beans Group
#
# This plugin gives an event that is only fired once abrowser resize 
# finished. This stops your 'resize' event handler being called 
# continuously during a resize.
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

  # RESIZEHANDLER CLASS DEFINITION
  #
  # @example How to use the class
  #     resizeHandlerInstance = new ResizeHandler()
  #
  class ResizeHandler

    # Construct a new ResizeHandler instance
    #
    # Create resizeEvent method to trigger 'responsiveResize' event with current size
    #
    constructor: ->
      $window = $(window)
      @resizeEvent = => 
        $window.trigger 'responsiveResize', @size()
      @resizeTimer = null

    # Set a timeout to call resizeEvent after 100ms, clearing existing timeout if one set
    #
    resize: ->
      if @resizeTimer then clearTimeout @resizeTimer
      @resizeTimer = setTimeout @resizeEvent, 100

    # Get a string representation of grid name
    #
    # Grid name set in CSS content on body::after pseudo-element
    #
    # @return [String] Grid name if available or empty string
    #
    size: ->
      if not window.getComputedStyle? then return ''
      window.getComputedStyle(document.body,':after').getPropertyValue('content').replace('-','') || ''
  
  # Create instance of ResizeHandler on document ready, call resize() on window 'resize' event
  #
  $ ->
    resizeHandler = new ResizeHandler()
    $(window).on 'resize', ()=> resizeHandler.resize()

do ( plugin ) ->
  if typeof define is 'function' and define.amd
    # AMD. Register as an anonymous module.
    define(['jquery'], plugin);
  else
    # Browser globals
    plugin(jQuery)
