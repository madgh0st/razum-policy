package policy_uat

#формируем список сервисных ролей
developer := concat("-",  ["SPB-PAAS", "DEVELOPER", input.service_project])
manager := concat("-",  ["SPB-PAAS", "PROJECT_MANAGER", input.service_project])
devops := concat("-",  ["SPB-PAAS", "DEVOPS", input.service_project])
participant := concat("-",  ["SPB-PAAS", "PARTICIPANT", input.service_project])
security := concat("-",  ["SPB-PAAS", "SECURITY", input.service_project])

default allow = false

allow = true {
   input.method = "GET"
   input.path = ["api", "uaa", "me"]
}

allow = true {
   input.method = "GET"
   input.path = ["mskp-user-profile", "my"]
}

allow = true {
   input.method = "POST"
   input.path = ["meta-table-object", "filter"]
   any([
        input.posts[_] == "PROJECT_MANAGER",
        input.posts[_] == "DEVELOPER",
        input.posts[_] == "DEVOPS",
        input.posts[_] == "SECURITY",
        input.posts[_] == "PARTICIPANT"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["mskp-request", "applicant", "filter"]
   any([
        input.posts[_] == "PROJECT_MANAGER",
        input.posts[_] == "DEVELOPER",
        input.posts[_] == "DEVOPS",
        input.posts[_] == "SECURITY",
        input.posts[_] == "PARTICIPANT"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["meta-system", "all"]
   any([
        input.posts[_] == "PROJECT_MANAGER",
        input.posts[_] == "DEVELOPER",
        input.posts[_] == "DEVOPS",
        input.posts[_] == "SECURITY",
        input.posts[_] == "PARTICIPANT"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["meta-db", "all"]
   any([
        input.posts[_] == "PROJECT_MANAGER",
        input.posts[_] == "DEVELOPER",
        input.posts[_] == "DEVOPS",
        input.posts[_] == "SECURITY",
        input.posts[_] == "PARTICIPANT"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["meta-layer", "filter", "by-system"]
   any([
        input.posts[_] == "PROJECT_MANAGER",
        input.posts[_] == "DEVELOPER",
        input.posts[_] == "DEVOPS",
        input.posts[_] == "SECURITY",
        input.posts[_] == "PARTICIPANT"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["meta-schema", "filter"]
   any([
        input.posts[_] == "PROJECT_MANAGER",
        input.posts[_] == "DEVELOPER",
        input.posts[_] == "DEVOPS",
        input.posts[_] == "SECURITY",
        input.posts[_] == "PARTICIPANT"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["meta-table-object"]
   any([
        input.posts[_] == "PROJECT_MANAGER",
        input.posts[_] == "DEVELOPER",
        input.posts[_] == "DEVOPS",
        input.posts[_] == "SECURITY",
        input.posts[_] == "PARTICIPANT"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["mskp-request"]
   any([
        input.posts[_] == "PROJECT_MANAGER",
        input.posts[_] == "DEVELOPER",
        input.posts[_] == "DEVOPS",
        input.posts[_] == "SECURITY",
        input.posts[_] == "PARTICIPANT"
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["mskp-request", _]
   any([
        input.posts[_] == "PROJECT_MANAGER",
        input.posts[_] == "DEVELOPER",
        input.posts[_] == "DEVOPS",
        input.posts[_] == "SECURITY",
        input.posts[_] == "PARTICIPANT"
    ])
}

allow = true {
   input.method = "PATCH"
   input.path = ["mskp-request", _]
   any([
        input.posts[_] == "PROJECT_MANAGER",
        input.posts[_] == "DEVELOPER",
        input.posts[_] == "DEVOPS",
        input.posts[_] == "SECURITY",
        input.posts[_] == "PARTICIPANT"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["meta-table-object-attribute", "filter"]
   any([
        input.posts[_] == "PROJECT_MANAGER",
        input.posts[_] == "DEVELOPER",
        input.posts[_] == "DEVOPS",
        input.posts[_] == "SECURITY",
        input.posts[_] == "PARTICIPANT"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["mskp-request", _, "status", "lableding_new"]
   any([
        input.posts[_] == "PROJECT_MANAGER",
        input.posts[_] == "DEVELOPER",
        input.posts[_] == "DEVOPS",
        input.posts[_] == "SECURITY",
        input.posts[_] == "PARTICIPANT"
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["mskp-request", "marker", "filter"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == security,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["mskp-request", _, "status", "labelling_in_progress"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == security,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["request-table-object"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == security,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "PUT"
   input.path = ["request-table-object", "markup"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == security,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["meta-table-object", "samples"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == security,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "PUT"
   input.path = ["meta-table-object", "samples", _]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == security,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["meta-masking-feature"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == security,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "GET"
   input.path = ["meta-algorithm-feature-datatype"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == security,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["mskp-request", "engineer", "filter"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == security,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["mskp-request", _, "status", "implement"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == security,
        input.authorities[_] == participant
    ])
}

allow = true {
   input.method = "POST"
   input.path = ["mskp-request", _, "status", "implementation_new"]
   any([
        input.authorities[_] == manager,
        input.authorities[_] == developer,
        input.authorities[_] == devops,
        input.authorities[_] == security,
        input.authorities[_] == participant
    ])
}
