From: =?utf-8?Q?H=C3=A5vard_Rabbe?= <hrabbe@me.com>
Subject: How can I drop IPv6 auto configuration traffic when bridging two
 interfaces?
Date: Mon, 27 Feb 2017 17:51:22 +0100
Message-ID: <ED31549B-0E75-4B7E-8E98-94326F66EE13@me.com>
Mime-Version: 1.0 (Mac OS X Mail 10.0 \(3226\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=4d515a;
        t=1488214253; bh=Wmv1lDUFRDaifmG5Nk+w8SRLBrQkLJMBCtGBOGFK2Cg=;
        h=From:Content-type:MIME-version:Subject:Message-id:Date:To;
        b=EbrOeHaZzcQaIjEbvf2oOqmNGbuLwPdPowWKLMrjKY8E/5PZ3BodMYvYuLxMUgqx3
 iy2Wvpt7dT55s5ggvYHq+TO4fam3VE/9UxexpQZ45WoKNoQFAGRllE+hBqDZLHiXiP
 5/++N+KPdWcz+ZovWaWU66pxeoaNbaqTNcCRg3XPEBvZ2F2P7HbQA0OpyoC/EKgCrd
 7Tros+sXo3bzzBioFdyLCPiLmdm3nGGLXNlslpKCxqZdf67qu/1ejPVvRS6a011O21
 RqYLGzOjhwJB3jB4GbOn+kOqHh2pdt0Hqy7xBjJNvU2+TP8MQ6jTMoIRDICKT4//Hk
 HJgUAQb+HBksg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi
Im using tinc vpn to bridge networks together. And im using ebtables to =
block dhcp traffic for ipv4 on each node in tinc. One of my nodes have =
recently began using ipv6. The isp is using auto configuration to give =
out ipv6 addresses. The problem is that every computer in my bridged =
network is getting ipv6 addresses from that node.
The other computers behind the other nodes have no use for ipv6 =
addresses it gets through the tinc tunnel.

Is there a way to block ipv6 auto configuration traffic entering the =
tinc tunnel on each node?

This is the bridging:
root@JOTVPN:~# brctl show

bridge name bridge id STP enabled   interfaces

bridge 8000.000c29638a7e no           eth0

                                                            vpn



This is what I have tried so far:

ip6tables -A FORWARD -o bridge -p ipv6-icmp -m icmp6 --icmpv6-type 133 =
-j DROP
ip6tables -A FORWARD -i bridge -p ipv6-icmp -m icmp6 --icmpv6-type 134 =
-j DROP


root@JOTVPN:~# ip6tables --list-rules

-P INPUT ACCEPT

-P FORWARD ACCEPT

-P OUTPUT ACCEPT

-A FORWARD -o bridge -p ipv6-icmp -m icmp6 --icmpv6-type 133 -j DROP

-A FORWARD -i bridge -p ipv6-icmp -m icmp6 --icmpv6-type 134 -j DROP


But its not working

Do someone know how to fix this?

Best Regards,

H=C3=A5vard Rabbe=
