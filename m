From: <ggeorgiev@eurista.com>
Subject: Need a way to match vlan / pcp fields in 802.1Q header
Date: Thu, 07 Mar 2013 21:34:49 -0700
Message-ID: <20130307213449.e96aff9bbdc3fe78db33ffdcbc125810.81f8fdcd60.wbe@email03.secureserver.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello, I need to match the cos field in the vlan tag on a linux box, and
can not find a way to match that tag via ebtables or iptables. I need an
iptables rule based on vlan cos tag. My fist idea was to mark the packet
via ebtables and catch it in iptables after, but ebtables will not work
on eth0, even if I see well the vlan tag there via tcpdump.

Example: 
tcpdump -i eth0 -xx -s 32
23:26:43.179854 IP [|ip]
        0x0000:  001a 801d b658 0002 e338 734f 8100 0016
        0x0010:  0800 4510 00e4 ea40 4000 4006 c11a 43d4

The '0016' shows a packet with cos 0 for vlan 0x16, and this is what I
need to match. Some ideas of how this can be done?

Thanks, George.
