From: Kevin P <petrilli.kevin@gmail.com>
Subject: Getting systemd-nspawn to work with my ruleset
Date: Thu, 28 Oct 2021 16:38:41 +0200
Message-ID: <CABuDAEaZ0VG28jvCd0gYs01U-ELakneny=Que6NNenOOORB+iQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=Mx6aPeJmwC+maGSROhp3XWqNsdQ4MnGuZiV3eg3a4iE=;
        b=kDhysKPIKZ21GgxVCYAr0bZvFGKhFfjiEB2/n1bAusVR8RJHqdPmW4CP1RlrSK2Qhs
         8KCWKLAlKxevHuX3AxVDBZiVSYymsH5R0pDsJbNpS0TQiKMGKKx8Th5HSNdYnz1OGJXg
         nudhp7AtjRTkTKrKWkh6iC6dPO2kSNGJgn/CjsCzgJ9c3oSNpRm13X5LSkDm6YGGjmsI
         vLY4t9h+oyJ9JolW51jsZvTijTQkn3HGDd9w0N4/ChvX21/q71QRTsO+uVEsZrTQOsUP
         1xDyp+SqFhN3JOBE3Tks7EQIc28UWPAo6JejfCK9ava7BPWIpODM1GmeZ0AT7TWv7Sbn
         KNZQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Good afternoon everyone
I've been trying to work this out for over a week but I really don't
have a clue past this point.
My notebook runs Arch Linux, running systemd-networkd as network
manager and (trying to) have systemd-nspawn
to work for containers.
I have a few rules in  /etc/nftables.conf :

table inet filter {
    chain input {
        type filter hook input priority filter; policy drop;
        ct state { established, related } accept
        ct state invalid drop
        ip protocol icmp accept
        meta l4proto ipv6-icmp accept
        udp dport 5353 accept
        reject
    }

    chain forward {
        type filter hook forward priority filter; policy accept;
    }

    chain output {
    }
}

That somehow conflict with those added by systemd-nspawn, after I
start a container with -n option:

table ip io.systemd.nat {
    set masq_saddr {
        type ipv4_addr
        flags interval
        elements = { 192.168.240.176/28 }
    }

    map map_port_ipport {
        type inet_proto . inet_service : ipv4_addr . inet_service
    }

    chain prerouting {
        type nat hook prerouting priority dstnat + 1; policy accept;
        fib daddr type local dnat ip to meta l4proto . th dport map
@map_port_ipport
    }

    chain output {
        type nat hook output priority -99; policy accept;
        ip daddr != 127.0.0.0/8 oif "lo" dnat ip to meta l4proto . th
dport map @map_port_ipport
    }

    chain postrouting {
        type nat hook postrouting priority srcnat + 1; policy accept;
        ip saddr @masq_saddr masquerade
    }
}

Even though I fail to understand how. If, before starting a container,
I flush my ruleset, the networking works as expected within
the container, but if I don't, and my rules are active, I get no
internet connection for the containers.
Any help explaining why and how to fix this problem would be MUCH appreciated.
Thanks

Kevin P.
