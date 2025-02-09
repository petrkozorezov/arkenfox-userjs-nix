#!/usr/bin/env bash
{
  echo 'let prefs = {}; function user_pref(k, v) { if(k != "_user.js.parrot") prefs[k] = v; };'
  curl "https://raw.githubusercontent.com/arkenfox/user.js/master/user.js"
  echo 'console.log(JSON.stringify(prefs, null, 2));'
} | node
