From: Thomas Jacob <jacob@internet24.de>
Subject: Re: still can't route using fwmark
Date: Sat, 18 Apr 2009 10:23:15 +0200
Message-ID: <20090418082314.GA12566@internet24.de>
References: <op.uskfabufx1lyi3@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <op.uskfabufx1lyi3@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lloyd Standish <lloyd@crnatural.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Fri, Apr 17, 2009 at 10:40:49PM -0600, Lloyd Standish wrote:
> Hello,
> 
> I am still having trouble doing load balancing over ppp0 and ppp1 for a Debian Etch PC (kernel 2.6.20.3, iptables 1.3.8).  I used patch-o-matic to update my kernel sources and recompiled the kernel, and compiled and installed iptables 1.3.8.  Also all the netfilter-related kernel configuration options I need are set, I believe.

Why the strange versions? There are neither the ones that comes with Etch nor
are they anything current? Anyway, Etch's stock kernel and iptables (2.6.18/v1.3.6 based)
are fine for what you want to do. 

You need the iptables (conn)marking stuff, and advanced router + policy/fw routing,
and that's all part of stock packages.

/boot/config-2.6.18-6-686

CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_ASK_IP_FIB_HASH=y
# CONFIG_IP_FIB_TRIE is not set
CONFIG_IP_FIB_HASH=y
CONFIG_IP_MULTIPLE_TABLES=y
CONFIG_IP_ROUTE_FWMARK=y
CONFIG_IP_ROUTE_MULTIPATH=y
# CONFIG_IP_ROUTE_MULTIPATH_CACHED is not set
CONFIG_IP_ROUTE_VERBOSE=y

dpkg -L iptables | grep -i mark
 /lib/iptables/libipt_connmark.so
 /lib/iptables/libipt_mark.so
 /lib/iptables/libipt_CONNMARK.so
 /lib/iptables/libipt_MARK.so
 /lib/iptables/libipt_SECMARK.so
 /lib/iptables/libipt_CONNSECMARK.so
 /lib/iptables/libip6t_connmark.so
 /lib/iptables/libip6t_mark.so
 /lib/iptables/libip6t_CONNMARK.so
 /lib/iptables/libip6t_MARK.so
 /lib/iptables/libip6t_SECMARK.so
 /lib/iptables/libip6t_CONNSECMARK.so

Here's what I used some time ago to do something similar (either with Etch
or maybe even Sarge), sending outgoing packets back to the router the
corresponding incoming packets of a connection came from, for a single machine.


#!/bin/sh

iptables=iptables


$iptables -t mangle -A INPUT -m mac --mac <ROUTERMAC1> -j CONNMARK --set-mark 1
$iptables -t mangle -A INPUT -m mac --mac <ROUTERMAC2> -j CONNMARK --set-mark 2


$iptables -t mangle -N TONET 
$iptables -t mangle -F TONET 
$iptables -t mangle -A OUTPUT -o <DEVICE> -d ! <LOCAL_NET> -j TONET

$iptables -t mangle -A TONET -m connmark ! --mark 0 -j CONNMARK --restore-mark


The route/rule stuff was more or less what you've got. If you want to
forward packets for other hosts, this need to go into PREROUTING of
course.

    Thomas

