# trans

### Leveraging s6-overlay, openvpn, and transmission for 'content acquisition'

## quick start

```bash
    --cap-add=NET_ADMIN
    --device /dev/net/tun
    -p 53314:53314
    -p 9091:9091
    -v /path/to/config:/config #optional but highly reccomended
    -v /path/to/downloads:/downloads
    -v /path/to/ovpn:/ovpn
    -v /path/to/watch:/watch #optional
    iofq/trans:latest
```

## configuration

### settings
Transmission settings can be tweaked in the web client located at `localhost:9091`. Additionally, a `settings.json` will be created in `/path/to/config` that can be edited and applied by restarting the container.

### authentication
OpenVPN expects a configuration file at `/ovpn/client.conf`. Authentication can be handled within the `ovpn/client.conf`. Use `auth-user-pass auth.txt` and point it to a file mounted at `/ovpn/auth.txt`.

## status
This container has a cronjob running that updates a status file with torrent info, current IP address, and session/lifetime stats every 10 seconds. `watch cat config/status.txt` to check it out!
