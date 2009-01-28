From: nemesis <nemesis.edsa@gmx.de>
Subject: Redirecting Pakets
Date: Wed, 28 Jan 2009 19:27:21 +0100
Message-ID: <4980A389.2090000@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I want to redirect pakets for several ip-adresses to other ip-adresses 
on a bridge.
I know that a bridge is working one layer below iptables, but I think it 
should be possible to hand those pakets to iptables.

I tried it like this:

ebtables -t broute -A BROUTING -p IPv4 -j redirect --redirect-target ACCEPT

and then the iptables rule:

iptables -t nat -A PREROUTING -p tcp -d [DESTINATION-IP-OLD] -j DNAT 
--to-destination [DESTINATTION-IP-NEW]

but it won't work.

Can somebody help me with this problem ?


THX !
