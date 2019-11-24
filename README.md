This docker container turns an existing VPN tunnel into a SOCKS proxy.

Notice: It needs to be run inside a network that provides tun0, else it'll be stuck waiting for the device to show up!

Example usage:

    #Start a tunnel proxy like https://hub.docker.com/r/atemu12/openvpn-docker-proxy
    #SOCKS ports need to be declared here! See https://github.com/Atemu/openvpn-docker-proxy-docker/blob/master/README.md
    docker run -v auth-volume:/config/:ro -v /path/to/config.ovpn:/config/ovpn:ro --device=/dev/net/tun --cap-add=NET_ADMIN --rm -p 1080:1080 --name openvpn-docker-proxy atemu12/openvpn-docker-proxy
    #Start the SOCKS proxy
    docker run --net=container:openvpn-docker-proxy atemu12/dante-tunnel
