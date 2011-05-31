From: "cc" <cc@kdtc.net>
Subject: SIP 5060 traffic
Date: Tue, 31 May 2011 17:17:59 +0800
Message-ID: <20110531090945.M97668@kdtc.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have a LAN NET  and a DMZ NET.  I have a SIP phone within the LAN
trying to connect to a proxy at an external site, say A.

Can someone point out if I'm missing anything?  

Rules:

$IPT -A FORWARD -o $INET_ETH -p udp --dport 5060 -j ACCEPT
$IPT -t nat -A POSTROUTING -o $INET_ETH -p udp --dport 5060 \
             -j SNAT --to-source $INET_IP

When I do a tcpdump, I can see traffic from the LAN go through my
bastion Firewall that routes to my external-facing firewall.
But there is no traffic coming back from the outside.

17:05:19.831000 IP (tos 0x0, ttl 127, id 1595, offset 0, flags [none], proto:
UDP (17), length: 367) LAN_IP.5060 > A_SITE.5060: SIP, length: 339

There's no corresponding entry that has traffic going the other way: 
i.e.:

IP (tos 0x0, ttl 127, id 1595, offset 0, flags [none], proto: UDP (17),
length: 367) A_SITE.5060 > LAN_IP.5060: SIP, length: 339

I'm a bit confused.  Any clarifications appreciated.

Thanks

Ed
