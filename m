From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables rules for cups printer discovery
Date: Thu, 14 Aug 2008 21:00:32 -0500
Message-ID: <48A4E340.1090305@riverviewtech.net>
References: <19894-78618@sneakemail.com> <48A4DD48.3080004@riverviewtech.net> <alpine.LNX.1.10.0808142150080.25617@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0808142150080.25617@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 8/14/2008 8:53 PM, Jan Engelhardt wrote:
> Nope that would not work because the source and destination addresses 
> are flipped on return packets, and then you even have the .255 thing.

Ah.  I forgot about the fact that recent only dealt with the source IP 
and that you could not specify source or dest in the set / update / 
check parameters to recent.  :(

> That smells like a feature request - me to the rescue! (I think that 
> would be much preferable over having a ton of connection helpers)

*nod*  It would be very nice to be able to specify whether or not the 
given recent list is suppose to use the source or dest IP.  I wonder if 
it would be possible to add a new flag that indicates act on the 
destination IP.  That way it would be possible to default to just source 
like it currently is but still be able to specify dest when desired.  I 
suppose to make things clean it would be better to add a flag to 
indicate source and use that flag as the default when no flag is specified.



Grant. . . .
