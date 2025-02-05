package general

default allow = false

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "test"]
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "me"]
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "about"]
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "resources"]
   input.communal = true
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "connections"]
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "connections", _]
   input.communal = true
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "apps"]
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "apps", _]
   input.communal = true
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios"]
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _]
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios", _, "like"]
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios", _, "dislike"]
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "schedules"]
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios", _, "schedules"]
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "schedules", _]
}

allow = true {
   input.method = "PATCH"
   input.path = ["api", "v1", "scenarios", _, "schedules", _]
}

allow = true {
   input.method = "DELETE"
   input.path = ["api", "v1", "scenarios", _, "schedules", _]
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios", _, "schedules", _, "pause"]
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios", _, "schedules", _, "resume"]
}


allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "tasks"]
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "tasks"]
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios", _, "tasks"]
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "tasks", _]
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "logs"]
}


allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "logFile"]
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "restart"]
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "cancel"]
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "resume"]
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "results"]
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "results", _]
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "metrics"]
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "metrics"]
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "triggers"]
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios", _, "triggers"]
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "triggers", _]
}

allow = true {
   input.method = "PATCH"
   input.path = ["api", "v1", "scenarios", _, "triggers", _]
}

allow = true {
   input.method = "DELETE"
   input.path = ["api", "v1", "scenarios", _, "triggers", _]
}