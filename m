From: Ralf Schlatterbeck <ralf@zoo.priv.at>
Subject: tc filter basic match cmp layer matching
Date: Thu, 10 Jun 2010 16:30:17 +0200
Message-ID: <20100610143017.GA21228@priv.zoo>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm trying to set up a filter that matches fields in higher level
protocols (tcp and icmp) using the "basic" tc ematch filter. I need to 
match on firewall marks in addition to protocol header fields, that's
why I'm not using u32 alone.

I'm using Kernel 2.6.26 from debian lenny and a debian iproute package
20091226-1 (not the original debian lenny version which is broken for
ipt actions).

This should match on icmp ping:

tc filter add dev lo protocol ip parent ffff: prio 1 basic match ' u32 (u8 0x1 0xff at 0x9) and cmp(u8 at 0 layer transport mask 0xff eq 8 ) ' action ipt -j MARK --set-xmark 0x100/0x1f0 action mirred egress redirect dev ifb0 

but it seems the internal representation of the offset to the transport
header is 0, so when I replace this with

... cmp(u8 at 20 layer transport mask 0xff eq 8 ) ...
(using an offset of 20 which is the length of the IP header without
options) this (in)correctly matches ping packets which indicates that
"layer transport" is not doing what I suppose it should.

I've also tried to use the native u32 nexthdr parameter inside a basic
match u32:

tc filter add dev lo protocol ip parent ffff: prio 1 basic match ' u32 (u8 0x1 0xff at 0x9) and u32(u8 8 0xff at nexthdr+0) ' action ipt -j MARK --set-xmark 0x100/0x1f0 action mirred egress redirect dev ifb0

with the same effect: seems that nexthdr offset is 0.

Is there any magic I should use for telling tc how to find the IP header
length?

I'm aware of how to do this with u32 hashtables and the "offset"
parameter, e.g.  explained in this thread:
http://mailman.ds9a.nl/pipermail/lartc/2001q4/002032.html
but I need matching on fwmark which doesn't seem to be possible in
combination with u32.

This thread from an openwall list suggests that matching on other than
the ip layer should be possible:
http://lists.openwall.net/netdev/2007/08/10/6

Ralf
-- 
Ralf Schlatterbeck
email: ralf@zoo.priv.at FAX: +43/2243/26465/23

