From: <ggeorgiev@eurista.com>
Subject: RE: Need a way to match vlan / pcp fields in 802.1Q header
Date: Sat, 09 Mar 2013 19:58:54 -0700
Message-ID: <20130309195854.e96aff9bbdc3fe78db33ffdcbc125810.594040746d.wbe@email03.secureserver.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello again, looks the only way for matching the vlan/CoS tag on a linux
box will be to write a small application that registers on the
prerouting hook on non-vlan interface (eth0), inspects the vlan tag and
marks the packet in, say, DSCP or ttl field, which can be after
inspected by iptables.

I will appreciate if someone can point to an example for similar task,
or to the right libraries to use - are libnetlink / libnetfilter_queue
the right choice? Can I get access to the raw coming packet on eth0 via
those libraries? Unfortunately libpcap is not a choice, it does not
alter packets.

Thanks, George.


