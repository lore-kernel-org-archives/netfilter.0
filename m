From: Philip Craig <philipc@snapgear.com>
Subject: Re: NAT packets leaking out with source address
Date: Thu, 06 Mar 2008 12:01:34 +1000
Message-ID: <47CF507E.2070203@snapgear.com>
References: <20080305165231.505bdd44@speedy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080305165231.505bdd44@speedy>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stephen Hemminger <stephen.hemminger@vyatta.com>
Cc: Patrick McHardy <kaber@trash.net>, netfilter@vger.kernel.org

Stephen Hemminger wrote:
> QA is seeing some (not all packets) going through a NAT router with the
> original source address.  Is this a known problem? or a configuration issue?
> 
> The packets are ICMP echo requests coming in at almost line rate, so some
> table could be getting overloaded?

First step is to check the conntrack table for an unnatted and unreplied
entry.

If the first ICMP was sent before the NAT rule was installed, and you never
get a reply (presumably because it is was not NATted), then subsequent ICMP
packets will use the same conntrack entry and not be NATted either.  These
will also refresh the timeout on the conntrack, so it never expires until
you stop pinging.

If this is the problem, the solution is to make sure you have the NAT rules
installed before the filter rules allow the packets.
