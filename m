From: Jack Lauman <jlauman@nwcascades.com>
Subject: Re: Multihomed Problem
Date: Wed, 12 Dec 2007 11:09:56 -0800
Message-ID: <47603204.8060200@nwcascades.com>
References: <475EFFF8.1010606@nwcascades.com>	 <475F095A.7040003@riverviewtech.net> <1197412206.19486.115.camel@grateful.d.umn.edu> <475F1562.7060207@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <475F1562.7060207@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi,

IP forwarding is turned on.  I've tried several different routing 
statements but none seemed to work.

What's the correct procedure to do this?

Thanks,

Jack

Grant Taylor wrote:
> On 12/11/07 16:30, Matt Zagrabelny wrote:
>> You wouldn't need to set up NAT if both IPs on the gnu/linux box are 
>> the gateways for the respective networks. Just enable forwarding:
> 
> Agreed.  I answered the question as if the multihomed system was not the 
> router.
> 
> If the multihomed system is the router or if the router knows about all 
> subnets, direct routing (not NATing) would probably be the better approach.
> 
>> No NAT required, the linux box is aware of the subnets and will pass 
>> traffic happily between them.
> 
> So long as firewalling is not in the say, yes.
> 
> 
> 
> 
> Grant. . . .
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
