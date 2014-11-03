# Jarvis - A General Purpose Slackbox

Jarvis is an sinatra based app that responds to post requests to /jarvis with various services, located at /jarvis/services.

To add a service, simply make a new subclass of Jarvis::Services::BaseService that responds to (optionally) run and say, and add a line to Jarvis::Interpreter to direct messages to the new service.
