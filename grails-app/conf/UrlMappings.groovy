import java.nio.file.AccessDeniedException

class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/$namespace/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/login/$action?"(controller: "login")
        "/logout/$action?"(controller: "logout")

        //ERROR Handling
        "500"(controller: "error", action: "error403", exception: AccessDeniedException)
        "404"(controller: "error", action: "error404")
        "409"(controller: "error", action: "error409")
        "500"(controller: "error", action: "error500")

        "/"(controller: "resources", action: "home")
        "/contact-us"(controller: 'resources', action: 'contact')
        "/privacy-policy"(controller: "resources", action: "privacy")
        "/robots.txt"(controller: 'robots', action: 'robots')
        "/status"(controller: 'resources', action: 'status')
        "/terms-of-use"(controller: "resources", action: "terms")
	}
}
