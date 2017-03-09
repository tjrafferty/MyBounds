package com.mybounds

import grails.converters.JSON

class ErrorController {

    // Forbidden
    def error403() {

        withFormat {
            html { render(view: 'authorize') }
            json {
                render(status: 403, text:'', contentType: 'application/json')
            }
        }
    }

    // Not Found
    def error404() {

        withFormat {
            html {
                //String missingPage = request.getAttribute('javax.servlet.error.message')
                //log.info("404 when trying to access page ${missingPage}")
                render(view: 'missing')
            }
            json {
                render(status: 404, text:'', contentType: 'application/json')
            }
        }
    }

    // Conflict
    def error409() {

        withFormat {
            html { render(view: 'conflict') }
            json {
                render(status: 409, text:'', contentType: 'application/json')
            }
        }
    }

    def error500() {
        def exception = request.exception
        log.error(exception)
        withFormat {
            html { render(view: 'server') }
            json { render exception as JSON}
        }
    }
}
