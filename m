From: Benedikt Gollatz <ben@differentialschokolade.org>
Subject: Re: NAT TABLE Size
Date: Thu, 21 Feb 2008 17:58:37 +0100
Message-ID: <200802211758.38710.ben@differentialschokolade.org>
References: <14426.217.78.42.11.1203601437.squirrel@webmail.sys.kth.se> <54368.85.119.130.97.1203612068.squirrel@mh.linnea.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54368.85.119.130.97.1203612068.squirrel@mh.linnea.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thursday 21 February 2008 17:41:08 Oscar N wrote:
> Maybe this is what you're looking for?
> /proc/sys/net/ipv4/ip_conntrack_max

For the sake of completeness, for my kernel compiled with "Layer 3 independent 
connection tracking" (as it is the default since Linux 2.6.20 IIRC) the 
equivalent is
    /proc/sys/net/netfilter/nf_conntrack_max
for the maximum number of entries and
    /proc/sys/net/netfilter/nf_conntrack_{tcp,udp,icmp,icmpv6,frag6}_timeout*
for the various timeouts.

I doubt that an embedded device runs such a new kernel, but maybe the kernel 
still is compiled with the new connection tracking framework to support 
stateful IPv6 filtering.

Benedikt
