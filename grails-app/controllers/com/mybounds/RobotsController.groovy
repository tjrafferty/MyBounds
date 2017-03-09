package com.mybounds

class RobotsController {

    def robots() {
        render(view: 'robots')
        /*
        if (System.getenv('NOFOLLOW') == 'true') {
            log.info("Environment Variable 'NOFOLLOW' = "+System.getenv('NOFOLLOW'))
            render(view: 'robots')
        } else {
            render(status: 404, text: 'Failed to load robots.txt')
        }
        */
    }
}
