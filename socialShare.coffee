#!
# socialShare v0.1.0 (http://okize.github.com/)
# Copyright (c) 2013 | Licensed under the MIT license
# http://www.opensource.org/licenses/mit-license.php
#

# universal module definition
((factory) ->

  if typeof exports is 'object'
    factory require('jquery')
  else if typeof define is 'function' and define.amd
    define ['jquery'], factory
  else
    factory jQuery

) ($) ->

  'use strict'

  pluginName = 'socialShare'

  # default plugin options
  defaults =
    property: true

  # plugin constructor
  class Plugin

    constructor: (@element, options) ->
      @options = $.extend({}, defaults, options)
      @_defaults = defaults
      @_name = pluginName
      @el = $(@element)
      @init()

    # initialize plugin
    init: ->
      console.log('socialShare initialized')

  # lightweight wrapper around the constructor that prevents multiple instantiations
  $.fn[pluginName] = (options) ->
    @each ->
      if !$.data(@, 'plugin_#{pluginName}')
        $.data(@, 'plugin_#{pluginName}', new Plugin(@, options))
      return
  return