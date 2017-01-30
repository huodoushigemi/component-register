utils = require './utils'

module.exports = class ComponentRegistry
  @register: (component) ->
    return console.error 'Component missing static tag property' unless tag = component?.tag
    name = utils.toComponentName(tag.toLowerCase())
    return console.error "Component already registered: #{name}" if ComponentRegistry[name]
    ComponentRegistry[name] = component

  @registeredTags: ->
    keys = Object.keys(ComponentRegistry)
    utils.toTagName(key) for key in keys when not (key in ['register', 'registeredTags'])