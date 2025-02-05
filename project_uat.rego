package project_uat

#формируем список проектных ролей
developer := concat("-",  ["spb-paas", "developer", input.project])
manager := concat("-",  ["spb-paas", "project_manager", input.project])
devops := concat("-",  ["spb-paas", "devops", input.project])
participant := concat("-",  ["spb-paas", "participant", input.project])

default allow = false

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "test"]
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "tag"]
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
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "projects", _, "privateSshKey"]
   input.authorities[_] == devops
}

allow = true {
   input.method = "DELETE"
   input.path = ["api", "v1", "projects", _, "privateSshKey"]
   input.authorities[_] == devops
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "resources"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "developer",
        input.posts[_] == "devops",
        input.posts[_] == "participant"
    ])
   input.communal = true
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "connections"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "developer",
        input.posts[_] == "devops",
        input.posts[_] == "participant"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "connections"]
   any([
        input.authorities[_] == developer,
        input.authorities[_] == devops
    ])
}
allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "connections", _]
   any([
        input.authorities[_] == developer,
        input.authorities[_] == devops
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "connections", _]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "developer",
        input.posts[_] == "devops",
        input.posts[_] == "participant"
    ])
   input.communal = true
}

allow = true {
   input.method = "PATCH"
   input.path = ["api", "v1", "connections", _]
   any([
        input.authorities[_] == developer,
        input.authorities[_] == devops
    ])
}

allow = true {
   input.method = "DELETE"
   input.path = ["api", "v1", "connections", _]
   any([
        input.authorities[_] == developer,
        input.authorities[_] == devops
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "sharedPolicies"]
   any([
        input.posts[_] == "developer",
        input.posts[_] == "devops",
    ])
   input.communal = true
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "sharedPolicies"]
   any([
        input.posts[_] == "developer",
        input.posts[_] == "devops",
    ])
   input.communal = true
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "sharedPolicies", _]
   any([
        input.posts[_] == "developer",
        input.posts[_] == "devops",
    ])
   input.communal = true
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "kibana", "scenarios", _]
   any([
        input.authorities[_] == developer,
        input.authorities[_] == devops
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "kibana", "scenarios", _]
   any([
        input.posts[_] == "developer",
        input.posts[_] == "devops",
    ])
   input.communal = true
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "kibana", "projects", _]
   any([
        input.authorities[_] == developer,
        input.authorities[_] == devops
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "kibana", "projects", _]
   any([
        input.posts[_] == "developer",
        input.posts[_] == "devops",
    ])
   input.communal = true
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "kibana", "scenarios", _, "tasks", _]
   any([
        input.authorities[_] == developer,
        input.authorities[_] == devops
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "kibana", "scenarios", _, "tasks", _]
   any([
        input.posts[_] == "developer",
        input.posts[_] == "devops",
    ])
   input.communal = true
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "projects"]
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "projects", _]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "projects", _]
   input.communal = true
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "developer",
        input.posts[_] == "devops",
        input.posts[_] == "participant"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "userResources"]
   any([
        input.posts[_] == "project_manager"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "userResources"]
   any([
        input.posts[_] == "project_manager"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "userResources", _]
   any([
        input.authorities[_] == manager,
    ])
}

allow = true {
   input.method = "GET"
   input.communal = true
   input.path = ["api", "v1", "userResources", _]
   any([
        input.posts[_] == "project_manager"
    ])
}

allow = true {
   input.method = "PATCH"
   input.path = ["api", "v1", "userResources", _]
   any([
        input.authorities[_] == manager,
    ])
}

allow = true {
   input.method = "PATCH"
   input.communal = true
   input.path = ["api", "v1", "userResources", _]
   any([
        input.posts[_] == "project_manager"
    ])
}

allow = true {
   input.method = "DELETE"
   input.path = ["api", "v1", "userResources", _]
   any([
        input.authorities[_] == manager,
    ])
}

allow = true {
   input.method = "DELETE"
   input.communal = true
   input.path = ["api", "v1", "userResources", _]
   any([
        input.posts[_] == "project_manager"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "executors"]
   any([
        input.posts[_] == "devops",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "executors", _]
   any([
        input.posts[_] == "devops",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "apps"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "apps"]
   any([
        input.posts[_] == "devops",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "apps"]
   any([
        input.authorities[_] == developer,
        input.authorities[_] == devops
    ])
}

allow = true {
   input.method = "GET"
   input.communal = true
   input.path = ["api", "v1", "apps", _]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "apps", _]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "PATCH"
   input.communal = true
   input.path = ["api", "v1", "apps", _]
   any([
        input.posts[_] == "devops",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "PATCH"
   input.path = ["api", "v1", "apps", _]
   any([
        input.authorities[_] == developer,
        input.authorities[_] == devops
    ])
}

allow = true {
   input.method = "DELETE"
   input.communal = true
   input.path = ["api", "v1", "apps", _]
   any([
        input.posts[_] == "devops",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "DELETE"
   input.path = ["api", "v1", "apps", _]
   any([
        input.authorities[_] == developer,
        input.authorities[_] == devops
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios"]
   any([
        input.posts[_] == "devops",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios"]
   any([
        input.authorities[_] == developer,
        input.authorities[_] == devops
    ])
}

allow = true {
   input.method = "GET"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "PATCH"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _]
   any([
        input.posts[_] == "devops",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "PATCH"
   input.path = ["api", "v1", "scenarios", _]
   any([
        input.authorities[_] == developer,
        input.authorities[_] == devops
    ])
}

allow = true {
   input.method = "DELETE"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _]
   any([
        input.posts[_] == "devops",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "DELETE"
   input.path = ["api", "v1", "scenarios", _]
   any([
        input.authorities[_] == developer,
        input.authorities[_] == devops
    ])
}

allow = true {
   input.method = "POST"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "restore"]
   any([
        input.posts[_] == "devops",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios", _, "restore"]
   any([
        input.authorities[_] == developer,
        input.authorities[_] == devops
    ])
}

allow = true {
   input.method = "POST"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "like"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios", _, "like"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}
allow = true {
   input.method = "POST"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "dislike"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios", _, "dislike"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "GET"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "policy"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "policy"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "GET"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "schedules"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "schedules"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "POST"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "schedules"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios", _, "schedules"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "GET"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "schedules", _]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "schedules", _]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "PATCH"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "schedules", _]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "PATCH"
   input.path = ["api", "v1", "scenarios", _, "schedules", _]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "DELETE"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "schedules", _]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "DELETE"
   input.path = ["api", "v1", "scenarios", _, "schedules", _]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "POST"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "schedules", _, "pause"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios", _, "schedules", _, "pause"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "POST"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "schedules", _, "resume"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios", _, "schedules", _, "resume"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "GET"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "tasks"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "tasks"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "POST"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "tasks"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios", _, "tasks"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "GET"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "tasks", _]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "tasks", _]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "POST"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "restart"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "restart"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "POST"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "cancel"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "cancel"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "POST"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "resume"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "resume"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "GET"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "results"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "results"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "GET"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "results", _]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "results", _]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "GET"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "metrics"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "metrics"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "GET"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "metrics"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "metrics"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "GET"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "triggers"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "triggers"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "POST"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "triggers"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "scenarios", _, "triggers"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "GET"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "triggers", _]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "triggers", _]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "PATCH"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "triggers", _]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "PATCH"
   input.path = ["api", "v1", "scenarios", _, "triggers", _]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "DELETE"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "triggers", _]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "DELETE"
   input.path = ["api", "v1", "scenarios", _, "triggers", _]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "variables"]
   any([
        input.posts[_] == "devops",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "variables"]
   any([
        input.posts[_] == "devops",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "variables", _]
   any([
        input.posts[_] == "devops",
        input.posts[_] == "developer"
    ])
}


allow = true {
   input.method = "PATCH"
   input.path = ["api", "v1", "variables", _]
   any([
        input.posts[_] == "devops",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "DELETE"
   input.path = ["api", "v1", "variables", _]
   any([
        input.posts[_] == "devops",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "processGroups"]
   any([
        input.posts[_] == "devops",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "pools"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "developer",
        input.posts[_] == "devops",
        input.posts[_] == "participant"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["api", "v1", "pools"]
   any([
        input.authorities[_] == developer,
        input.authorities[_] == devops
    ])
}
allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "pools", _]
   any([
        input.authorities[_] == developer,
        input.authorities[_] == devops
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "pools", _]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "developer",
        input.posts[_] == "devops",
        input.posts[_] == "participant"
    ])
   input.communal = true
}

allow = true {
   input.method = "PATCH"
   input.path = ["api", "v1", "pools", _]
   any([
        input.authorities[_] == developer,
        input.authorities[_] == devops
    ])
}

allow = true {
   input.method = "DELETE"
   input.path = ["api", "v1", "pools", _]
   any([
        input.authorities[_] == developer,
        input.authorities[_] == devops
    ])
}

allow = true {
   input.method = "GET"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "logs"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "logs"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "GET"
   input.communal = true
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "logFile"]
   any([
        input.posts[_] == "project_manager",
        input.posts[_] == "devops",
        input.posts[_] == "participant",
        input.posts[_] == "developer"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["api", "v1", "scenarios", _, "tasks", _, "logFile"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == participant
    ])
}

