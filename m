From: Pierre Couderc <pierre@couderc.eu>
Subject: Problem when routing UDP port 53
Date: Thu, 24 Jun 2021 18:18:03 +0200
Message-ID: <64e8a6c5-e7ea-d140-489b-d4955d0fd02c@couderc.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=couderc.eu; s=2017;
        t=1624551484; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:in-reply-to:
         references; bh=9H64TNpbLTVsUcxwp0z435TAwXV6fp9TEosRXhqM+dg=;
        b=af48oQN7zBHsMfzG5U16UdFg0Ztzyfz8E5zJwftK2zOyomny4DP6QYAQagcH9rZh9H3dT2
        VDVqeS9EfIRtB0DDnSCHlnRTXy2F37JHjP2svcIgd9WiWxxMn2n25KjmsqVo+wH0YTe3wR
        KVRMV05butkQh5oLpth25hD8k+zUfh79FbotvbIPhF0zYZEvzfMBNPYZeZZGSq3onA3hp2
        FtfB4P/lu7EDoLDyMEoM9VraFp9j8xVbP9V+CbqEDQYQe6g7aW9fYqqVpHfzmaajs3HgqL
        SR4FLq7n89Z/U5582IRFxfmjbbn3AoApFGjSEBr9s2ElmUEqaeG8WNy9yGiq6A==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

1- I use a linux system as router and I have problem with UDP port 53=20
which dns checkers find not available.

Is there a mistake in my configuration below ?

2- I use bind9 in a lxd container, with nothing else in this container.=20
When I use :

nc -v -u=C2=A0 -z 192.168.163.30 40-60

I get all ports from 49 to 55 open but an error on port 53 (and 52..?):

...

(UNKNOWN) [192.168.163.30] 53 (domain) open
udptest first write failed?! errno 1 : Operation not permitted
(UNKNOWN) [192.168.163.30] 52 (?) : Operation not permitted
(UNKNOWN) [192.168.163.30] 51 (?) open
...

How to explain these results ? I should expect only UDP53 open...


Thanks for any help

PC


root@rIVrouter:~# cat /etc/iptables/rules.v4
*nat
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
# eth1 is WAN interface, #eth0 is LAN interface
-A POSTROUTING -o eth1 -j MASQUERADE
#******************* PREROUTING from WAN to LAN : see too below
# bin
-A PREROUTING -p udp -i eth1 --dport 53 -j DNAT --to-destination=20
192.168.163.30:53

...

COMMIT

*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
# basic global accept rules - ICMP, loopback, traceroute, established=20
all accepted

...

# forward packets along established/related connections
-A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
# forward from LAN (eth0) to WAN (eth1)
-A FORWARD -i eth0 -o eth1 -j ACCEPT
-A FORWARD -p udp -d 192.168.163.30 --dport 53 -j ACCEPT

...

# drop all other forwarded traffic
-A FORWARD -j DROP

COMMIT



