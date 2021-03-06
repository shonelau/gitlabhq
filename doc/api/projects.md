# Projects API

### Project visibility level

Project in GitLab can be either private, internal or public.
This is determined by the `visibility` field in the project.

Values for the project visibility level are:

* `private`:
  Project access must be granted explicitly for each user.

* `internal`:
  The project can be cloned by any logged in user.

* `public`:
  The project can be cloned without any authentication.

## List projects

Get a list of visible projects for authenticated user. When accessed without authentication, only public projects are returned.

```
GET /projects
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `archived` | boolean | no | Limit by archived status |
| `visibility` | string | no | Limit by visibility `public`, `internal`, or `private` |
| `order_by` | string | no | Return projects ordered by `id`, `name`, `path`, `created_at`, `updated_at`, or `last_activity_at` fields. Default is `created_at` |
| `sort` | string | no | Return projects sorted in `asc` or `desc` order. Default is `desc` |
| `search` | string | no | Return list of projects matching the search criteria |
| `simple` | boolean | no | Return only the ID, URL, name, and path of each project |
| `owned` | boolean | no | Limit by projects owned by the current user |
| `membership` | boolean | no | Limit by projects that the current user is a member of |
| `starred` | boolean | no | Limit by projects starred by the current user |
| `statistics` | boolean | no | Include project statistics |
| `with_issues_enabled` | boolean | no | Limit by enabled issues feature |
| `with_merge_requests_enabled` | boolean | no | Limit by enabled merge requests feature |

```json
[
  {
    "id": 4,
    "description": null,
    "default_branch": "master",
    "visibility": "private",
    "ssh_url_to_repo": "git@example.com:diaspora/diaspora-client.git",
    "http_url_to_repo": "http://example.com/diaspora/diaspora-client.git",
    "web_url": "http://example.com/diaspora/diaspora-client",
    "tag_list": [
      "example",
      "disapora client"
    ],
    "owner": {
      "id": 3,
      "name": "Diaspora",
      "created_at": "2013-09-30T13:46:02Z"
    },
    "name": "Diaspora Client",
    "name_with_namespace": "Diaspora / Diaspora Client",
    "path": "diaspora-client",
    "path_with_namespace": "diaspora/diaspora-client",
    "issues_enabled": true,
    "open_issues_count": 1,
    "merge_requests_enabled": true,
    "jobs_enabled": true,
    "wiki_enabled": true,
    "snippets_enabled": false,
    "container_registry_enabled": false,
    "created_at": "2013-09-30T13:46:02Z",
    "last_activity_at": "2013-09-30T13:46:02Z",
    "creator_id": 3,
    "namespace": {
      "id": 3,
      "name": "Diaspora",
      "path": "diaspora",
      "kind": "group",
      "full_path": "diaspora"
    },
    "import_status": "none",
    "archived": false,
    "avatar_url": "http://example.com/uploads/project/avatar/4/uploads/avatar.png",
    "shared_runners_enabled": true,
    "forks_count": 0,
    "star_count": 0,
    "runners_token": "b8547b1dc37721d05889db52fa2f02",
    "public_jobs": true,
    "shared_with_groups": [],
    "only_allow_merge_if_pipeline_succeeds": false,
    "only_allow_merge_if_all_discussions_are_resolved": false,
    "request_access_enabled": false,
    "statistics": {
      "commit_count": 37,
      "storage_size": 1038090,
      "repository_size": 1038090,
      "lfs_objects_size": 0,
      "job_artifacts_size": 0
    }
  },
  {
    "id": 6,
    "description": null,
    "default_branch": "master",
    "visibility": "private",
    "ssh_url_to_repo": "git@example.com:brightbox/puppet.git",
    "http_url_to_repo": "http://example.com/brightbox/puppet.git",
    "web_url": "http://example.com/brightbox/puppet",
    "tag_list": [
      "example",
      "puppet"
    ],
    "owner": {
      "id": 4,
      "name": "Brightbox",
      "created_at": "2013-09-30T13:46:02Z"
    },
    "name": "Puppet",
    "name_with_namespace": "Brightbox / Puppet",
    "path": "puppet",
    "path_with_namespace": "brightbox/puppet",
    "issues_enabled": true,
    "open_issues_count": 1,
    "merge_requests_enabled": true,
    "jobs_enabled": true,
    "wiki_enabled": true,
    "snippets_enabled": false,
    "container_registry_enabled": false,
    "created_at": "2013-09-30T13:46:02Z",
    "last_activity_at": "2013-09-30T13:46:02Z",
    "creator_id": 3,
    "namespace": {
      "id": 4,
      "name": "Brightbox",
      "path": "brightbox",
      "kind": "group",
      "full_path": "brightbox"
    },
    "import_status": "none",
    "import_error": null,
    "permissions": {
      "project_access": {
        "access_level": 10,
        "notification_level": 3
      },
      "group_access": {
        "access_level": 50,
        "notification_level": 3
      }
    },
    "archived": false,
    "avatar_url": null,
    "shared_runners_enabled": true,
    "forks_count": 0,
    "star_count": 0,
    "runners_token": "b8547b1dc37721d05889db52fa2f02",
    "public_jobs": true,
    "shared_with_groups": [],
    "only_allow_merge_if_pipeline_succeeds": false,
    "only_allow_merge_if_all_discussions_are_resolved": false,
    "request_access_enabled": false,
    "statistics": {
      "commit_count": 12,
      "storage_size": 2066080,
      "repository_size": 2066080,
      "lfs_objects_size": 0,
      "job_artifacts_size": 0
    }
  }
]
```

### Get single project

Get a specific project. This endpoint can be accessed without authentication if
the project is publicly accessible.

```
GET /projects/:id
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID or [URL-encoded path of the project](README.md#namespaced-path-encoding) |
| `statistics` | boolean | no | Include project statistics |

```json
{
  "id": 3,
  "description": null,
  "default_branch": "master",
  "visibility": "private",
  "ssh_url_to_repo": "git@example.com:diaspora/diaspora-project-site.git",
  "http_url_to_repo": "http://example.com/diaspora/diaspora-project-site.git",
  "web_url": "http://example.com/diaspora/diaspora-project-site",
  "tag_list": [
    "example",
    "disapora project"
  ],
  "owner": {
    "id": 3,
    "name": "Diaspora",
    "created_at": "2013-09-30T13:46:02Z"
  },
  "name": "Diaspora Project Site",
  "name_with_namespace": "Diaspora / Diaspora Project Site",
  "path": "diaspora-project-site",
  "path_with_namespace": "diaspora/diaspora-project-site",
  "issues_enabled": true,
  "open_issues_count": 1,
  "merge_requests_enabled": true,
  "jobs_enabled": true,
  "wiki_enabled": true,
  "snippets_enabled": false,
  "container_registry_enabled": false,
  "created_at": "2013-09-30T13:46:02Z",
  "last_activity_at": "2013-09-30T13:46:02Z",
  "creator_id": 3,
  "namespace": {
    "id": 3,
    "name": "Diaspora",
    "path": "diaspora",
    "kind": "group",
    "full_path": "diaspora"
  },
  "import_status": "none",
  "import_error": null,
  "permissions": {
    "project_access": {
      "access_level": 10,
      "notification_level": 3
    },
    "group_access": {
      "access_level": 50,
      "notification_level": 3
    }
  },
  "archived": false,
  "avatar_url": "http://example.com/uploads/project/avatar/3/uploads/avatar.png",
  "shared_runners_enabled": true,
  "forks_count": 0,
  "star_count": 0,
  "runners_token": "b8bc4a7a29eb76ea83cf79e4908c2b",
  "public_jobs": true,
  "shared_with_groups": [
    {
      "group_id": 4,
      "group_name": "Twitter",
      "group_access_level": 30
    },
    {
      "group_id": 3,
      "group_name": "Gitlab Org",
      "group_access_level": 10
    }
  ],
  "only_allow_merge_if_pipeline_succeeds": false,
  "only_allow_merge_if_all_discussions_are_resolved": false,
  "request_access_enabled": false,
  "statistics": {
    "commit_count": 37,
    "storage_size": 1038090,
    "repository_size": 1038090,
    "lfs_objects_size": 0,
    "job_artifacts_size": 0
  }
}
```

## Get project users

Get the users list of a project.


Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `search` | string | no | Search for specific users |

```
GET /projects/:id/users
```

```json
[
  {
    "id": 1,
    "username": "john_smith",
    "name": "John Smith",
    "state": "active",
    "avatar_url": "http://localhost:3000/uploads/user/avatar/1/cd8.jpeg",
    "web_url": "http://localhost:3000/john_smith"
  },
  {
    "id": 2,
    "username": "jack_smith",
    "name": "Jack Smith",
    "state": "blocked",
    "avatar_url": "http://gravatar.com/../e32131cd8.jpeg",
    "web_url": "http://localhost:3000/jack_smith"
  }
]
```

### Get project events

Please refer to the [Events API documentation](events.md#list-a-projects-visible-events)

### Create project

Creates a new project owned by the authenticated user.

```
POST /projects
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `name` | string | yes if path is not provided | The name of the new project. Equals path if not provided. |
| `path` | string | yes if name is not provided | Repository name for new project. Generated based on name if not provided (generated lowercased with dashes). |
| `namespace_id` | integer | no | Namespace for the new project (defaults to the current user's namespace) |
| `description` | string | no | Short project description |
| `issues_enabled` | boolean | no | Enable issues for this project |
| `merge_requests_enabled` | boolean | no | Enable merge requests for this project |
| `jobs_enabled` | boolean | no | Enable jobs for this project |
| `wiki_enabled` | boolean | no | Enable wiki for this project |
| `snippets_enabled` | boolean | no | Enable snippets for this project |
| `container_registry_enabled` | boolean | no | Enable container registry for this project |
| `shared_runners_enabled` | boolean | no | Enable shared runners for this project |
| `visibility` | String | no | See [project visibility level](#project-visibility-level) |
| `import_url` | string | no | URL to import repository from |
| `public_jobs` | boolean | no | If `true`, jobs can be viewed by non-project-members |
| `only_allow_merge_if_pipeline_succeeds` | boolean | no | Set whether merge requests can only be merged with successful jobs |
| `only_allow_merge_if_all_discussions_are_resolved` | boolean | no | Set whether merge requests can only be merged when all the discussions are resolved |
| `lfs_enabled` | boolean | no | Enable LFS |
| `request_access_enabled` | boolean | no | Allow users to request member access |
| `tag_list`    | array   | no       | The list of tags for a project; put array of tags, that should be finally assigned to a project |
| `avatar`    | mixed   | no      | Image file for avatar of the project                |

### Create project for user

Creates a new project owned by the specified user. Available only for admins.

```
POST /projects/user/:user_id
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `user_id` | integer | yes | The user ID of the project owner |
| `name` | string | yes | The name of the new project |
| `path` | string | no | Custom repository name for new project. By default generated based on name |
| `default_branch` | string | no | `master` by default |
| `namespace_id` | integer | no | Namespace for the new project (defaults to the current user's namespace) |
| `description` | string | no | Short project description |
| `issues_enabled` | boolean | no | Enable issues for this project |
| `merge_requests_enabled` | boolean | no | Enable merge requests for this project |
| `jobs_enabled` | boolean | no | Enable jobs for this project |
| `wiki_enabled` | boolean | no | Enable wiki for this project |
| `snippets_enabled` | boolean | no | Enable snippets for this project |
| `container_registry_enabled` | boolean | no | Enable container registry for this project |
| `shared_runners_enabled` | boolean | no | Enable shared runners for this project |
| `visibility` | string | no | See [project visibility level](#project-visibility-level) |
| `import_url` | string | no | URL to import repository from |
| `public_jobs` | boolean | no | If `true`, jobs can be viewed by non-project-members |
| `only_allow_merge_if_pipeline_succeeds` | boolean | no | Set whether merge requests can only be merged with successful jobs |
| `only_allow_merge_if_all_discussions_are_resolved` | boolean | no | Set whether merge requests can only be merged when all the discussions are resolved |
| `lfs_enabled` | boolean | no | Enable LFS |
| `request_access_enabled` | boolean | no | Allow users to request member access |
| `tag_list`    | array   | no       | The list of tags for a project; put array of tags, that should be finally assigned to a project |
| `avatar`    | mixed   | no      | Image file for avatar of the project                |

### Edit project

Updates an existing project.

```
PUT /projects/:id
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID or [URL-encoded path of the project](README.md#namespaced-path-encoding) |
| `name` | string | yes | The name of the project |
| `path` | string | no | Custom repository name for the project. By default generated based on name |
| `default_branch` | string | no | `master` by default |
| `description` | string | no | Short project description |
| `issues_enabled` | boolean | no | Enable issues for this project |
| `merge_requests_enabled` | boolean | no | Enable merge requests for this project |
| `jobs_enabled` | boolean | no | Enable jobs for this project |
| `wiki_enabled` | boolean | no | Enable wiki for this project |
| `snippets_enabled` | boolean | no | Enable snippets for this project |
| `container_registry_enabled` | boolean | no | Enable container registry for this project |
| `shared_runners_enabled` | boolean | no | Enable shared runners for this project |
| `visibility` | string | no | See [project visibility level](#project-visibility-level) |
| `import_url` | string | no | URL to import repository from |
| `public_jobs` | boolean | no | If `true`, jobs can be viewed by non-project-members |
| `only_allow_merge_if_pipeline_succeeds` | boolean | no | Set whether merge requests can only be merged with successful jobs |
| `only_allow_merge_if_all_discussions_are_resolved` | boolean | no | Set whether merge requests can only be merged when all the discussions are resolved |
| `lfs_enabled` | boolean | no | Enable LFS |
| `request_access_enabled` | boolean | no | Allow users to request member access |
| `tag_list`    | array   | no       | The list of tags for a project; put array of tags, that should be finally assigned to a project |
| `avatar`    | mixed   | no      | Image file for avatar of the project                |

### Fork project

Forks a project into the user namespace of the authenticated user or the one provided.

The forking operation for a project is asynchronous and is completed in a background job. The request will return immediately. To determine whether the fork of the project has completed, query the `import_status` for the new project.

```
POST /projects/:id/fork
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID or [URL-encoded path of the project](README.md#namespaced-path-encoding) |
| `namespace` | integer/string | yes | The ID or path of the namespace that the project will be forked to |

### Star a project

Stars a given project. Returns status code `304` if the project is already starred.

```
POST /projects/:id/star
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID or [URL-encoded path of the project](README.md#namespaced-path-encoding) |

```bash
curl --request POST --header "PRIVATE-TOKEN: 9koXpg98eAheJpvBs5tK" "https://gitlab.example.com/api/v4/projects/5/star"
```

Example response:

```json
{
  "id": 3,
  "description": null,
  "default_branch": "master",
  "visibility": "internal",
  "ssh_url_to_repo": "git@example.com:diaspora/diaspora-project-site.git",
  "http_url_to_repo": "http://example.com/diaspora/diaspora-project-site.git",
  "web_url": "http://example.com/diaspora/diaspora-project-site",
  "tag_list": [
    "example",
    "disapora project"
  ],
  "name": "Diaspora Project Site",
  "name_with_namespace": "Diaspora / Diaspora Project Site",
  "path": "diaspora-project-site",
  "path_with_namespace": "diaspora/diaspora-project-site",
  "issues_enabled": true,
  "open_issues_count": 1,
  "merge_requests_enabled": true,
  "jobs_enabled": true,
  "wiki_enabled": true,
  "snippets_enabled": false,
  "container_registry_enabled": false,
  "created_at": "2013-09-30T13:46:02Z",
  "last_activity_at": "2013-09-30T13:46:02Z",
  "creator_id": 3,
  "namespace": {
    "id": 3,
    "name": "Diaspora",
    "path": "diaspora",
    "kind": "group",
    "full_path": "diaspora"
  },
  "import_status": "none",
  "archived": true,
  "avatar_url": "http://example.com/uploads/project/avatar/3/uploads/avatar.png",
  "shared_runners_enabled": true,
  "forks_count": 0,
  "star_count": 1,
  "public_jobs": true,
  "shared_with_groups": [],
  "only_allow_merge_if_pipeline_succeeds": false,
  "only_allow_merge_if_all_discussions_are_resolved": false,
  "request_access_enabled": false
}
```

### Unstar a project

Unstars a given project. Returns status code `304` if the project is not starred.

```
POST /projects/:id/unstar
```

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID or [URL-encoded path of the project](README.md#namespaced-path-encoding) |

```bash
curl --request POST --header "PRIVATE-TOKEN: 9koXpg98eAheJpvBs5tK" "https://gitlab.example.com/api/v4/projects/5/unstar"
```

Example response:

```json
{
  "id": 3,
  "description": null,
  "default_branch": "master",
  "visibility": "internal",
  "ssh_url_to_repo": "git@example.com:diaspora/diaspora-project-site.git",
  "http_url_to_repo": "http://example.com/diaspora/diaspora-project-site.git",
  "web_url": "http://example.com/diaspora/diaspora-project-site",
  "tag_list": [
    "example",
    "disapora project"
  ],
  "name": "Diaspora Project Site",
  "name_with_namespace": "Diaspora / Diaspora Project Site",
  "path": "diaspora-project-site",
  "path_with_namespace": "diaspora/diaspora-project-site",
  "issues_enabled": true,
  "open_issues_count": 1,
  "merge_requests_enabled": true,
  "jobs_enabled": true,
  "wiki_enabled": true,
  "snippets_enabled": false,
  "container_registry_enabled": false,
  "created_at": "2013-09-30T13:46:02Z",
  "last_activity_at": "2013-09-30T13:46:02Z",
  "creator_id": 3,
  "namespace": {
    "id": 3,
    "name": "Diaspora",
    "path": "diaspora",
    "kind": "group",
    "full_path": "diaspora"
  },
  "import_status": "none",
  "archived": true,
  "avatar_url": "http://example.com/uploads/project/avatar/3/uploads/avatar.png",
  "shared_runners_enabled": true,
  "forks_count": 0,
  "star_count": 0,
  "public_jobs": true,
  "shared_with_groups": [],
  "only_allow_merge_if_pipeline_succeeds": false,
  "only_allow_merge_if_all_discussions_are_resolved": false,
  "request_access_enabled": false
}
```

### Archive a project

Archives the project if the user is either admin or the project owner of this project. This action is
idempotent, thus archiving an already archived project will not change the project.

```
POST /projects/:id/archive
```

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID or [URL-encoded path of the project](README.md#namespaced-path-encoding) |

```bash
curl --request POST --header "PRIVATE-TOKEN: 9koXpg98eAheJpvBs5tK" "https://gitlab.example.com/api/v4/projects/5/archive"
```

Example response:

```json
{
  "id": 3,
  "description": null,
  "default_branch": "master",
  "visibility": "private",
  "ssh_url_to_repo": "git@example.com:diaspora/diaspora-project-site.git",
  "http_url_to_repo": "http://example.com/diaspora/diaspora-project-site.git",
  "web_url": "http://example.com/diaspora/diaspora-project-site",
  "tag_list": [
    "example",
    "disapora project"
  ],
  "owner": {
    "id": 3,
    "name": "Diaspora",
    "created_at": "2013-09-30T13:46:02Z"
  },
  "name": "Diaspora Project Site",
  "name_with_namespace": "Diaspora / Diaspora Project Site",
  "path": "diaspora-project-site",
  "path_with_namespace": "diaspora/diaspora-project-site",
  "issues_enabled": true,
  "open_issues_count": 1,
  "merge_requests_enabled": true,
  "jobs_enabled": true,
  "wiki_enabled": true,
  "snippets_enabled": false,
  "container_registry_enabled": false,
  "created_at": "2013-09-30T13:46:02Z",
  "last_activity_at": "2013-09-30T13:46:02Z",
  "creator_id": 3,
  "namespace": {
    "id": 3,
    "name": "Diaspora",
    "path": "diaspora",
    "kind": "group",
    "full_path": "diaspora"
  },
  "import_status": "none",
  "import_error": null,
  "permissions": {
    "project_access": {
      "access_level": 10,
      "notification_level": 3
    },
    "group_access": {
      "access_level": 50,
      "notification_level": 3
    }
  },
  "archived": true,
  "avatar_url": "http://example.com/uploads/project/avatar/3/uploads/avatar.png",
  "shared_runners_enabled": true,
  "forks_count": 0,
  "star_count": 0,
  "runners_token": "b8bc4a7a29eb76ea83cf79e4908c2b",
  "public_jobs": true,
  "shared_with_groups": [],
  "only_allow_merge_if_pipeline_succeeds": false,
  "only_allow_merge_if_all_discussions_are_resolved": false,
  "request_access_enabled": false
}
```

### Unarchive a project

Unarchives the project if the user is either admin or the project owner of this project. This action is
idempotent, thus unarchiving an non-archived project will not change the project.

```
POST /projects/:id/unarchive
```

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID or [URL-encoded path of the project](README.md#namespaced-path-encoding) |

```bash
curl --request POST --header "PRIVATE-TOKEN: 9koXpg98eAheJpvBs5tK" "https://gitlab.example.com/api/v4/projects/5/unarchive"
```

Example response:

```json
{
  "id": 3,
  "description": null,
  "default_branch": "master",
  "visibility": "private",
  "ssh_url_to_repo": "git@example.com:diaspora/diaspora-project-site.git",
  "http_url_to_repo": "http://example.com/diaspora/diaspora-project-site.git",
  "web_url": "http://example.com/diaspora/diaspora-project-site",
  "tag_list": [
    "example",
    "disapora project"
  ],
  "owner": {
    "id": 3,
    "name": "Diaspora",
    "created_at": "2013-09-30T13:46:02Z"
  },
  "name": "Diaspora Project Site",
  "name_with_namespace": "Diaspora / Diaspora Project Site",
  "path": "diaspora-project-site",
  "path_with_namespace": "diaspora/diaspora-project-site",
  "issues_enabled": true,
  "open_issues_count": 1,
  "merge_requests_enabled": true,
  "jobs_enabled": true,
  "wiki_enabled": true,
  "snippets_enabled": false,
  "container_registry_enabled": false,
  "created_at": "2013-09-30T13:46:02Z",
  "last_activity_at": "2013-09-30T13:46:02Z",
  "creator_id": 3,
  "namespace": {
    "id": 3,
    "name": "Diaspora",
    "path": "diaspora",
    "kind": "group",
    "full_path": "diaspora"
  },
  "import_status": "none",
  "import_error": null,
  "permissions": {
    "project_access": {
      "access_level": 10,
      "notification_level": 3
    },
    "group_access": {
      "access_level": 50,
      "notification_level": 3
    }
  },
  "archived": false,
  "avatar_url": "http://example.com/uploads/project/avatar/3/uploads/avatar.png",
  "shared_runners_enabled": true,
  "forks_count": 0,
  "star_count": 0,
  "runners_token": "b8bc4a7a29eb76ea83cf79e4908c2b",
  "public_jobs": true,
  "shared_with_groups": [],
  "only_allow_merge_if_pipeline_succeeds": false,
  "only_allow_merge_if_all_discussions_are_resolved": false,
  "request_access_enabled": false
}
```

### Remove project

Removes a project including all associated resources (issues, merge requests etc.)

```
DELETE /projects/:id
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID or [URL-encoded path of the project](README.md#namespaced-path-encoding) |

## Uploads

### Upload a file

Uploads a file to the specified project to be used in an issue or merge request description, or a comment.

```
POST /projects/:id/uploads
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID or [URL-encoded path of the project](README.md#namespaced-path-encoding) |
| `file` | string | yes | The file to be uploaded |

To upload a file from your filesystem, use the `--form` argument. This causes
cURL to post data using the header `Content-Type: multipart/form-data`.
The `file=` parameter must point to a file on your filesystem and be preceded
by `@`. For example:

```bash
curl --request POST --header "PRIVATE-TOKEN: 9koXpg98eAheJpvBs5tK" --form "file=@dk.png" https://gitlab.example.com/api/v3/projects/5/uploads
```

Returned object:

```json
{
  "alt": "dk",
  "url": "/uploads/66dbcd21ec5d24ed6ea225176098d52b/dk.png",
  "markdown": "![dk](/uploads/66dbcd21ec5d24ed6ea225176098d52b/dk.png)"
}
```

**Note**: The returned `url` is relative to the project path.
In Markdown contexts, the link is automatically expanded when the format in
`markdown` is used.

## Project members

Please consult the [Project Members](members.md) documentation.

### Share project with group

Allow to share project with group.

```
POST /projects/:id/share
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID or [URL-encoded path of the project](README.md#namespaced-path-encoding) |
| `group_id` | integer | yes | The ID of the group to share with |
| `group_access` | integer | yes | The permissions level to grant the group |
| `expires_at` | string | no | Share expiration date in ISO 8601 format: 2016-09-26 |

### Delete a shared project link within a group

Unshare the project from the group. Returns `204` and no content on success.

```
DELETE /projects/:id/share/:group_id
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID or [URL-encoded path of the project](README.md#namespaced-path-encoding) |
| `group_id` | integer | yes | The ID of the group |

```bash
curl --request DELETE --header "PRIVATE-TOKEN: 9koXpg98eAheJpvBs5tK" https://gitlab.example.com/api/v4/projects/5/share/17
```

## Hooks

Also called Project Hooks and Webhooks.
These are different for [System Hooks](system_hooks.md) that are system wide.

### List project hooks

Get a list of project hooks.

```
GET /projects/:id/hooks
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID or [URL-encoded path of the project](README.md#namespaced-path-encoding) |

### Get project hook

Get a specific hook for a project.

```
GET /projects/:id/hooks/:hook_id
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID or [URL-encoded path of the project](README.md#namespaced-path-encoding) |
| `hook_id` | integer | yes | The ID of a project hook |

```json
{
  "id": 1,
  "url": "http://example.com/hook",
  "project_id": 3,
  "push_events": true,
  "issues_events": true,
  "merge_requests_events": true,
  "tag_push_events": true,
  "note_events": true,
  "job_events": true,
  "pipeline_events": true,
  "wiki_page_events": true,
  "enable_ssl_verification": true,
  "created_at": "2012-10-12T17:04:47Z"
}
```

### Add project hook

Adds a hook to a specified project.

```
POST /projects/:id/hooks
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID or [URL-encoded path of the project](README.md#namespaced-path-encoding) |
| `url` | string | yes | The hook URL |
| `push_events` | boolean | no | Trigger hook on push events |
| `issues_events` | boolean | no | Trigger hook on issues events |
| `merge_requests_events` | boolean | no | Trigger hook on merge requests events |
| `tag_push_events` | boolean | no | Trigger hook on tag push events |
| `note_events` | boolean | no | Trigger hook on note events |
| `job_events` | boolean | no | Trigger hook on job events |
| `pipeline_events` | boolean | no | Trigger hook on pipeline events |
| `wiki_events` | boolean | no | Trigger hook on wiki events |
| `enable_ssl_verification` | boolean | no | Do SSL verification when triggering the hook |
| `token` | string | no | Secret token to validate received payloads; this will not be returned in the response |

### Edit project hook

Edits a hook for a specified project.

```
PUT /projects/:id/hooks/:hook_id
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID or [URL-encoded path of the project](README.md#namespaced-path-encoding) |
| `hook_id` | integer | yes | The ID of the project hook |
| `url` | string | yes | The hook URL |
| `push_events` | boolean | no | Trigger hook on push events |
| `issues_events` | boolean | no | Trigger hook on issues events |
| `merge_requests_events` | boolean | no | Trigger hook on merge requests events |
| `tag_push_events` | boolean | no | Trigger hook on tag push events |
| `note_events` | boolean | no | Trigger hook on note events |
| `job_events` | boolean | no | Trigger hook on job events |
| `pipeline_events` | boolean | no | Trigger hook on pipeline events |
| `wiki_events` | boolean | no | Trigger hook on wiki events |
| `enable_ssl_verification` | boolean | no | Do SSL verification when triggering the hook |
| `token` | string | no | Secret token to validate received payloads; this will not be returned in the response |

### Delete project hook

Removes a hook from a project. This is an idempotent method and can be called multiple times.
Either the hook is available or not.

```
DELETE /projects/:id/hooks/:hook_id
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID or [URL-encoded path of the project](README.md#namespaced-path-encoding) |
| `hook_id` | integer | yes | The ID of the project hook |

Note the JSON response differs if the hook is available or not. If the project hook
is available before it is returned in the JSON response or an empty response is returned.

## Branches

For more information please consult the [Branches](branches.md) documentation.

### List branches

Lists all branches of a project.

```
GET /projects/:id/repository/branches
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID or [URL-encoded path of the project](README.md#namespaced-path-encoding) |

```json
[
  {
    "name": "async",
    "commit": {
      "id": "a2b702edecdf41f07b42653eb1abe30ce98b9fca",
      "parent_ids": [
        "3f94fc7c85061973edc9906ae170cc269b07ca55"
      ],
      "message": "give Caolan credit where it's due (up top)",
      "author_name": "Jeremy Ashkenas",
      "author_email": "jashkenas@example.com",
      "authored_date": "2010-12-08T21:28:50+00:00",
      "committer_name": "Jeremy Ashkenas",
      "committer_email": "jashkenas@example.com",
      "committed_date": "2010-12-08T21:28:50+00:00"
    },
    "protected": false,
    "developers_can_push": false,
    "developers_can_merge": false
  },
  {
    "name": "gh-pages",
    "commit": {
      "id": "101c10a60019fe870d21868835f65c25d64968fc",
      "parent_ids": [
          "9c15d2e26945a665131af5d7b6d30a06ba338aaa"
      ],
      "message": "Underscore.js 1.5.2",
      "author_name": "Jeremy Ashkenas",
      "author_email": "jashkenas@example.com",
      "authored_date": "2013-09-07T12:58:21+00:00",
      "committer_name": "Jeremy Ashkenas",
      "committer_email": "jashkenas@example.com",
      "committed_date": "2013-09-07T12:58:21+00:00"
    },
    "protected": false,
    "developers_can_push": false,
    "developers_can_merge": false
  }
]
```

### Single branch

A specific branch of a project.

```
GET /projects/:id/repository/branches/:branch
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID or [URL-encoded path of the project](README.md#namespaced-path-encoding) |
| `branch` | string | yes | The name of the branch |
| `developers_can_push` | boolean | no | Flag if developers can push to the branch |
| `developers_can_merge` | boolean | no | Flag if developers can merge to the branch |

### Protect single branch

Protects a single branch of a project.

```
PUT /projects/:id/repository/branches/:branch/protect
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID or [URL-encoded path of the project](README.md#namespaced-path-encoding) |
| `branch` | string | yes | The name of the branch |

### Unprotect single branch

Unprotects a single branch of a project.

```
PUT /projects/:id/repository/branches/:branch/unprotect
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID or [URL-encoded path of the project](README.md#namespaced-path-encoding) |
| `branch` | string | yes | The name of the branch |

## Admin fork relation

Allows modification of the forked relationship between existing projects. Available only for admins.

### Create a forked from/to relation between existing projects.

```
POST /projects/:id/fork/:forked_from_id
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID or [URL-encoded path of the project](README.md#namespaced-path-encoding) |
| `forked_from_id` | ID | yes | The ID of the project that was forked from |

### Delete an existing forked from relationship

```
DELETE /projects/:id/fork
```

Parameter:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID or [URL-encoded path of the project](README.md#namespaced-path-encoding) |

## Search for projects by name

Search for projects by name which are accessible to the authenticated user. This
endpoint can be accessed without authentication if the project is publicly
accessible.

```
GET /projects/search/:query
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `query` | string | yes | A string contained in the project name |
| `order_by` | string | no | Return requests ordered by `id`, `name`, `created_at` or `last_activity_at` fields |
| `sort` | string | no | Return requests sorted in `asc` or `desc` order |

## Start the Housekeeping task for a Project

>**Note:** This feature was introduced in GitLab 9.0

```
POST /projects/:id/housekeeping
```

Parameters:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer/string | yes | The ID of the project or NAMESPACE/PROJECT_NAME |
