From: Timothy Ham <timothyham@protonmail.com>
Subject: Improvements to the Home Router Wiki page
Date: Sat, 30 Oct 2021 21:39:07 +0000
Message-ID: <9EwLs4Z4lDrYS0hyZoApmQ2StFQlMHrKwhKRXtSsUCDf0G6p5_e5JCcrjz9T4vCV7TXVYZHX_egqjtKbSsPBoBMl2SAEODG-kOU1u8j-LgY=@protonmail.com>
Reply-To: Timothy Ham <timothyham@protonmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1635629951;
        bh=1lYeWLl0B5toeJ8YdKgxOI5+rVPrUbocMJcQS/UGmnY=;
        h=Date:To:From:Reply-To:Subject:From;
        b=j5PvHNXwfuILhrXZYr8sAQ5ouOvC7BHwq+GiugDVAuGMmKrF9FYImgW3WjH3OhaI6
         uu3Bxs9tnQEhu/N7rPe++LMTR/wUMs8H7nd2h+V94HcM7DsXWJr1wPcMO/fzm7szgf
         JexLlpVb2P1uJF0/Ki/EqZivhjAKca7wdMYRteqk=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

I have benefited from the wiki page "Simple ruleset for a home router" foun=
d here:

https://wiki.nftables.org/wiki-nftables/index.php/Simple_ruleset_for_a_home=
_router

Still, it doesn't cover port forwarding and hairpin NAT. So after several h=
ours of trying different things, I've finally figured out how to do them, a=
nd improved the example config. Could someone in charge please update the e=
xample on the wiki? Specifically the example config given in the section "S=
imple router using ppp interface". I've kept everything the same except the=
 few lines I've added.

If my config can be improved further, please suggest more changes as well.

Thank you.

=3D=3D=3D=3D begin =3D=3D=3D=3D
flush ruleset

define DEV_PRIVATE =3D eth1
define DEV_WORLD =3D ppp0
define NET_PRIVATE =3D 192.168.0.0/16
define IP_WAN =3D x.x.x.x
define IP_ROUTER =3D 192.168.0.1
define IP_SERVER =3D 192.168.0.10

table ip global {
    chain prerouting {
          type nat hook prerouting priority dstnat;

          # Hairpin NAT part 1/2. WAN IP address must be known
          ip daddr $IP_WAN tcp dport 443 dnat to $IP_SERVER:8443
          ip daddr $IP_WAN tcp dport 80 dnat to $IP_SERVER:8080

          # Port forwarding part 1/2
          iifname $DEV_WORLD tcp dport 443 dnat to $IP_SERVER:8443
          iifname $DEV_WORLD tcp dport 80 dnat to $IP_SERVER:8080

    }

    chain inbound_world {
        # accepting ping (icmp-echo-request) for diagnostic purposes.
        # However, it also lets probes discover this host is alive.
        # This sample accepts them within a certain rate limit:
        #
        # icmp type echo-request limit rate 5/second accept

        # allow SSH connections from some well-known internet host
        ip saddr 81.209.165.42 tcp dport ssh accept
    }

    chain inbound_private {
        # accepting ping (icmp-echo-request) for diagnostic purposes.
        icmp type echo-request limit rate 5/second accept

        # allow DHCP, DNS and SSH from the private network
        ip protocol . th dport vmap { tcp . 22 : accept, udp . 53 : accept,=
 tcp . 53 : accept, udp . 67 : accept}
    }

    chain inbound {
        type filter hook input priority 0; policy drop;

        # Allow traffic from established and related packets, drop invalid
        ct state vmap { established : accept, related : accept, invalid : d=
rop }

        # allow loopback traffic, anything else jump to chain for further e=
valuation
        iifname vmap { lo : accept, $DEV_WORLD : jump inbound_world, $DEV_P=
RIVATE : jump inbound_private }

        # the rest is dropped by the above policy
    }

    chain forward {
        type filter hook forward priority 0; policy drop;

        # port forwarding part 2/2
        meta iifname $DEV_WORLD ip daddr $IP_SERVER tcp dport 8443 ct state=
 new accept
        meta iifname $DEV_WORLD ip daddr $IP_SERVER tcp dport 8080 ct state=
 new accept

        # Allow traffic from established and related packets, drop invalid
        ct state vmap { established : accept, related : accept, invalid : d=
rop }

        # connections from the internal net to the internet or to other
        # internal nets are allowed
        iifname $DEV_PRIVATE accept

        # the rest is dropped by the above policy
    }

    chain postrouting {
        type nat hook postrouting priority 100; policy accept;

        # hairpin part 2/2
        ip saddr $NET_PRIVATE ip daddr $IP_SERVER tcp dport 8443 snat $ROUT=
ER
        ip saddr $NET_PRIVATE ip daddr $IP_SERVER tcp dport 8080 snat $ROUT=
ER

        # masquerade private IP addresses
        ip saddr $NET_PRIVATE oifname $DEV_WORLD masquerade
    }
}
=3D=3D=3D=3D end =3D=3D=3D=3D


