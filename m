From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: NAT, DROP and walled-gardens (~= captive portal)
Date: Tue, 15 Jan 2013 01:31:52 -0500
Message-ID: <201301150131.52465.neal.p.murphy@alum.wpi.edu>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Monday, January 14, 2013 11:13:39 PM tom@then.fr wrote:
> Hey guys,
> 
> *Problem*
> I've just hit the deprecation of DROP in the NAT tables.
> iptables v1.4.7:
> The "nat" table is not intended for filtering, the use of DROP is
> therefore inhibited.
> ...
> *Question*
> Now, as you know we cannot DROP anymore in a NAT table. Therefore my
> gardens are useless because I cannot drop at the end anymore. For the
> moment I really don't see how I can easily have the same behaviour than
> before. I can see a possible solution with more chains that would
> involve the software to iptables -A to different chains which I'd like
> to avoid :)

One solution:

If you cannot rely on default policy, then rely on active policy. Pick an 
unused bit in packet MARKs; say it's bit 32 (mask 80000000). Have INPUT, 
OUTPUT and FORWARD chains in nat end with a rule to set the high-order bit in 
the packet's MARK; the assumption is that allowed packets will have caused a 
return before reaching the end of these chains. Then in INPUT, OUTPUT and 
FORWARD in filter, you first check that bit; if set, drop the packet.

N
