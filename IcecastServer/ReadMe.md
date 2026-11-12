# IcecastServer

## General

[IcecastServer](https://github.com/anionDev/IcecastServer) is a docker-image for simply running an [Icecast](https://icecast.org)-server in a docker-container.
It was originally written by [infiniteproject](https://github.com/infiniteproject/icecast).
The details can be found [here](https://github.com/anionDev/IcecastServer/tree/main/IcecastServer).

## Usage

### Get the image

After running `scbuildcodeunits` the image is available as tar-file in `IcecastServer/Other/Artifacts/BuildResult_OCIImage`. Load it into docker (example for version 1.0.3 on x64):

```cmd
docker load -i IcecastServer\Other\Artifacts\BuildResult_OCIImage\IcecastServer_v1.0.3_Linux-x64.tar
```

This provides the image `icecastserver:1.0.3` (and `icecastserver:latest`).

### Start the server

```cmd
docker run -d --name icecastserver -p 8000:8000 -e icecast_source_password=MySourcePassword -e icecast_admin_password=MyAdminPassword -e icecast_hostname=localhost icecastserver:1.0.3
```

Always set the passwords, otherwise the Icecast-default-password `hackme` remains active.
Supported environment-variables:

| Environment-variable | Icecast-setting |
| --- | --- |
| `icecast_source_password` | Password for source-clients (username: `source`) |
| `icecast_relay_password` | Password for relays |
| `icecast_admin_username` | Username for the admin-interface |
| `icecast_admin_password` | Password for the admin-interface |
| `icecast_admin_email` | Contact-email-address |
| `icecast_hostname` | Hostname of the server |
| `icecast_location` | Location of the server |
| `icecast_max_clients` | Maximal amount of clients |
| `icecast_max_sources` | Maximal amount of sources |

Do not use the characters `/`, `&` and `\` in values because the values are inserted into the configuration using `sed`.

The status-page is available at `http://localhost:8000`, the admin-interface at `http://localhost:8000/admin/`. Logs are stored in the volume `/var/log/icecast`.

### Stream

Connect a source-client (for example [BUTT](https://danielnoethen.de/butt/) or ffmpeg) using:

- Host: `localhost`
- Port: `8000`
- Username: `source`
- Password: value of `icecast_source_password`
- Mountpoint: for example `/stream.mp3`

Example using ffmpeg for streaming an audio-file:

```cmd
ffmpeg -nostdin -re -i MyAudioFile.mp3 -c:a libmp3lame -b:a 128k -content_type audio/mpeg -f mp3 icecast://source:MySourcePassword@localhost:8000/stream.mp3
```

Listeners can listen to the stream using `http://localhost:8000/stream.mp3` (for example in a browser or VLC).

## Reference

The reference can be found [here](https://github.com/anionDev/IcecastServer/blob/main/IcecastServer/Other/Reference/ReferenceContent/index.md).

## Development

### Development-state

![Development-state](https://img.shields.io/badge/development--state-maintenance%20updates%20only-green)

### Branching-system

This repository applies the [GitFlowSimplified](https://projects.aniondev.de/PublicProjects/Common/ProjectTemplates/-/blob/main/Conventions/BranchingSystem/GitFlowSimplified/GitFlowSimplified.md)-branching-system.

### Repository-structure

This repository applies the [CommonProjectStructure](https://projects.aniondev.de/PublicProjects/Common/ProjectTemplates/-/blob/main/Conventions/RepositoryStructure/CommonProjectStructure/CommonProjectStructure.md)-repository-structure.

## License

See [License.txt](https://github.com/anionDev/IcecastServer/blob/main/License.txt) for license-information.
