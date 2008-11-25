From: Nigel Heron <nigel-ml@xprima.com>
Subject: banning bot ips with ipset
Date: Tue, 25 Nov 2008 16:00:48 -0500
Message-ID: <492C6780.4020909@xprima.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi list,
We're using iptables (with shorewall for config) and lvs on our 
firewall/load balancer. We're being attacked by a botnet alternating 
between http request floods and syn floods. We have a way to identify 
the ips that are http'ing and started dropping them in iptables, once we 
got to ~1700 banned ips the server stopped nat'ing completely (not sure 
why..) and we were forced to remove the blacklist. We're now banning non 
north-american class-As to drop half the bots, but it's obviously not a 
good long term solution. We just came across ipset, but the lack of any 
feedback on the net (besides on *.netfilter.org) has us a bit worried 
about real world deployment. Is ipset stable enough to be deployed on 
live environments? iphash seems like the best set type for us, how many 
ips can the set handle before there's a noticeable slowdown? any 
feedback would be appreciated.

obviously, we don't expect ipset to help us with the syn flood, at 
~30Mb/s of syn traffic, syn cookies aren't helping either, is there a 
syn-proxy implementation for linux?

also, if it helps anyone else .. while trying ipset 2.4.5 i had to add:
#include <stdbool.h>
to "kernel/ip_set_setlist.c" to get it to compile.

thanks,

-nigel.
