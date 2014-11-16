@MsValidator =          
  validateModel: (data, validations) ->
    errors = []
    for field, value of data
      try
        # throws exception if it does not exist
        validation = validations[field]
        if _.isFunction(validation)
          validation(value)
        else if _.isString(validation) and @[validation]
          @[validation](value)
      catch e
        err = {}
        err[field] = e.message
        errors.push(err)
    return errors

  lenNotNull: (value) ->
    throw new Error(__("Dieses Feld darf nicht leer sein.")) unless validator.isLength(value, 1)
