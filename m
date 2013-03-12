From: <ggeorgiev@eurista.com>
Subject: RE: Need a way to match vlan / pcp fields in 802.1Q header
Date: Tue, 12 Mar 2013 06:38:30 -0700
Message-ID: <20130312063830.e96aff9bbdc3fe78db33ffdcbc125810.385c1da50f.wbe@email03.secureserver.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello again,

Looks this is a tough topic, no one knows something about. No wonder,
barely someone has similar need - but given that in Linux all is
possible, even such a weird task shall be doable. 

I am still digging into this, and I can imagine two ways up to now:

  - First, find some way (sysctl setting?) that will permit
ebtables/iptables to work on the raw vlan trunk, eth0. Then tell
ebtables 'do what I tell you, don't think', u32 match CoS in offset 14,
and accordingly modify DSCP in offset 20. After it is easy with
iptables. This is the best solution I can imagine. 

  - Second, do a small application using libnetfilter_queue which hooks
on PREROUTING at eth0 and does the same. Writing C code needs thinking,
so this is second-best.

If someone has some thought about this, let discuss. I am heading to
libnetfilter_queue for now, reluctantly.

All the best, George.
