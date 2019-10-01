From: Jags <TheJags@protonmail.com>
Subject: How can I block all traffic from an IP range, irrespective of origin, going to, or coming from, using nftables in Debian 10
Date: Tue, 01 Oct 2019 23:22:29 +0000
Message-ID: <NQw8Zn-Cr6DOqlayaUmuautcCgywjg96aFaMt1t0b-YRpyo0_DvByE3-RTNVC5S80qFIYbSNVGesY3XCvGxrLlYG__BFEBaDJ_XvIa0hREI=@protonmail.com>
Reply-To: Jags <TheJags@protonmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1569972153;
        bh=LpxMMPuwRYG/g2ioOEd8iqfFi3qkUwyv97nD0BuUkBI=;
        h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
        b=L6A4KQrNjQ4CZy2+5E/ZnI9fSa2t/b2+3SsyeG+YO+jIe/yaI7wmntAl3ThcEdE67
         ZWxGLasUW3h1gdyIjjaUySW7y/lo+ok+0Oo4AdeW080N0H5WpCalTZAc+/ih1sCXUw
         LQISuHzelWCCGXQYMJHp/k4zDSX0qqvyajGzscto=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

hello everyone,

I would like to block all traffic from an IP range (e.g.: 123.0.0.0/8), irr=
espective of its origin, going to, or coming from, using nftables firewall =
in Debian 10.

If I understand correctly, the following will block traffic originating fro=
m that IP range.

nft insert rule ip filter INPUT ip saddr 123.0.0.0/8 counter drop


But it will still allow traffic if it's in response to (or associated with)=
 an application on my Debian machine.

The problem: When I run a torrent client and add any torrent, be it Debian/=
Ubuntu ISO or any other torrent, I can see a bunch of IPs from my ISP conne=
cts to the torrent.

Even if I add a torrent that have only 1 seed and no peer at all, I can see=
 a lot of IPs from my ISP (with zero percent of torrent availability) in qB=
ittorrent client. In fact, I have blocked like 100+ in qBittorrent but the =
new IPs still keep popping up under "peers".

So I'd like to block an IP range, irrespective of traffic origin, going to,=
 or coming from, using nftables.


Thanks a lot in advance.



Here's my nftables.conf file:

:::::
#!/usr/sbin/nft -f

flush ruleset

table inet filter {

    chain input {
        type filter hook input priority 0; policy drop;

        iifname lo accept

        # ssh for internal network
        ip saddr 192.168.0.0/16 tcp dport 22 counter accept
        ct state established,related accept

        # Avoid brute force on ssh
        tcp dport 22 ct state new limit rate 10/minute accept

        # Early drop of invalid connections
        ct state invalid drop

        # VsFTPD
        ip saddr 192.168.0.0/16 tcp dport 20 counter accept
        ip saddr 192.168.0.0/16 tcp dport 21 counter accept
        ip saddr 192.168.0.0/16 tcp dport 990 counter accept
        ip saddr 192.168.0.0/16 tcp dport 40000-50000 counter accept


        # ICMP & IGMP
        ip saddr 192.168.0.0/16 icmp type echo-request counter accept
        icmp type echo-request counter drop
        ip protocol igmp drop

        # Everything else
        reject with icmpx type port-unreachable

        log flags all counter drop
        log prefix "[nftables] Input Denied: " flags all counter drop
    }
}
:::::
