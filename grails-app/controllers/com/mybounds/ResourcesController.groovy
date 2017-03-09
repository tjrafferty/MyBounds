package com.mybounds

import com.bertramlabs.plugins.SSLRequired
import grails.converters.JSON

class ResourcesController {

    @SSLRequired
    def privacy() {
        cache shared: true, validUntil: new Date() + 90
    }

    @SSLRequired
    def terms() {
        cache shared: true, validUntil: new Date() + 90
    }

    @SSLRequired
    def home() {
        println "HERE"
    }
    @SSLRequired
    def contact() {
        cache shared: true, validUntil: new Date() + 365
    }
}
