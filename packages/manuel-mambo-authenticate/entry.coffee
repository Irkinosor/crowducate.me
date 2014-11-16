Meteor.startup ->
  AccountsEntry =
    settings: {
      showSignupCode: false
      dashboardRoute: '/'
    }

  @AccountsEntry = AccountsEntry

  Meteor.methods
    entryValidateSignupCode: (signupCode) ->
      check signupCode, Match.Any
      not AccountsEntry.settings.showSignupCode or signupCode is AccountsEntry.settings.signupCode

    accountsCreateUser: (username, email, password) ->
      check username, Match.Any
      check email, Match.Any
      check password, Match.Any
      if username
        Accounts.createUser
          username: username,
          email: email,
          password: password,
          profile: AccountsEntry.settings.defaultProfile || {}
      else
        Accounts.createUser
          email: email
          password: password
          profile: AccountsEntry.settings.defaultProfile || {}
