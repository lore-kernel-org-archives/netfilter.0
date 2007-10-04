From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: "DNAT" w/o changing source address?
Date: Thu, 04 Oct 2007 10:13:24 -0500
Message-ID: <47050314.6010904@riverviewtech.net>
References: <1191424890.25752.27.camel@localhost.localdomain>	 <47042728.1060508@riverviewtech.net>	 <1191503642.13379.12.camel@localhost.localdomain>	 <4704F430.4070907@riverviewtech.net> <1191507582.13379.45.camel@localhost.localdomain>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1191507582.13379.45.camel@localhost.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/04/07 09:19, John Madden wrote:
> I have a dozen or so other rules that do the same thing for different 
> IP's (this is a load balancer).

Ah, ok.

> Well I thought that's what I was doing with that SNAT rule. =)

No, with the SNAT rule you really are making the traffic appear as if it 
is from the NATing box its self.  Here in lies your rub that you are 
trying to avoid.

> Yeah, both machines have globally routable IP's.

Look for a more detailed discussion as a follow up to Pascal's post.



Grant. . . .
