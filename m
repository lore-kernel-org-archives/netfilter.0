From: Nirgal =?ISO-8859-1?Q?Vourg=E8re?= <contact_vgernf@nirgal.com>
Subject: Issue migrating "iptables -m socket --transparent" into nftables
Date: Mon, 17 Aug 2020 16:54:47 +0200
Message-ID: <30147982.tmreYhUOsE@deimos>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi

I have a working haproxy in transparent mode, that analyze the TLS SNI header to choose a route, without decrypting the packets. I use it as a frontal, for several https servers using the same IP address, and I'm very happy to have the pristine client IP address in my httpd.

My kernel have net.ipv4.ip_nonlocal_bind=1.

/etc/iproute2/rt_tables contains:

    100 haproxy

I am using

    ip rule add fwmark 1 lookup haproxy
    ip route add local default dev lo table haproxy

My firewall rules have

    iptables -t mangle -A PREROUTING -m socket --transparent -j MARK --set-mark 1

This works fine. But iptables is deprecated and will vanish at some point. So I’m trying to replace this by the new nftables system. And miserably fails.

I tried this nft rule:

    table inet haproxy {
        chain prerouting {
            type filter hook prerouting priority -150; policy accept;
            socket transparent 1 mark set 0x00000001
        }
    }

It does work, but all traffic is routed to the haproxy socket, including outbound masqueraded connection… I mean when a box on the lan side connects to a foreign https server, the connection is grabbed by haproxy, which is not what I want.

Does any one know the proper equivalent to

    iptables -t mangle -A PREROUTING -m socket --transparent -j MARK --set-mark 1

using nft?



Here's a useful failure. My haproxy configuration contains:

    frontend https4-in
        bind :443 strict-sni transparent
        mode tcp
        ...

I tried replacing in haproxy.cfg "bind :443" by "bind 1.2.3.4:443" - where 1.2.3.4 is my IP address obviously - and it works ok. But I have some servers with dynamic ip adresses, so this is not a solution for me.

My guess is that the iptables version is adding some logic.



I also tried "nft add rule inet haproxy prerouting ct state new fib daddr . iif type local socket transparent 1 meta mark set 1", but it doesn't work either.

Any help would be appreciated.

I am using Debian stable (kernel 4.19.132 with nftables 0.9). The haproxy is in LXC container.


