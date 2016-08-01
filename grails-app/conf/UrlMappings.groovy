class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/login")
        "/images"(view: '/imageDisplay')
        "/upload"(view: '/imagesUpload')
        "500"(view:'/error')
	}
}
