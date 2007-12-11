From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Multihomed Problem
Date: Tue, 11 Dec 2007 16:55:30 -0600
Message-ID: <475F1562.7060207@riverviewtech.net>
References: <475EFFF8.1010606@nwcascades.com>	 <475F095A.7040003@riverviewtech.net> <1197412206.19486.115.camel@grateful.d.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1197412206.19486.115.camel@grateful.d.umn.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 12/11/07 16:30, Matt Zagrabelny wrote:
> You wouldn't need to set up NAT if both IPs on the gnu/linux box are 
> the gateways for the respective networks. Just enable forwarding:

Agreed.  I answered the question as if the multihomed system was not the 
router.

If the multihomed system is the router or if the router knows about all 
subnets, direct routing (not NATing) would probably be the better approach.

> No NAT required, the linux box is aware of the subnets and will pass 
> traffic happily between them.

So long as firewalling is not in the say, yes.




Grant. . . .
