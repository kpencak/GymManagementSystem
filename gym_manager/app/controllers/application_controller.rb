class ApplicationController < ActionController::Base
    #delete in production
    #added to test requests on postman
    skip_forgery_protection 
end

