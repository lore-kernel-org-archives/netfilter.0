From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Route packets by source IP
Date: Tue, 18 Mar 2008 09:18:30 -0500
Message-ID: <47DFCF36.3060500@riverviewtech.net>
References: <384787EBFB86488EAB82D80861A37F27@shs1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <384787EBFB86488EAB82D80861A37F27@shs1>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 03/18/08 07:01, Steffen Heil wrote:
> 2. At A: Route every packet "from A2:P" to B2.
>  - otherwise A would try to route to the client via its gateway, which
> would fail because of the private sender ip. -

> But I don't know how to do the second.
> 
> Any hints?

You need to use policy based routing.  In short, set up an additional 
routing table very similar to the main routing table save for using B as 
the default gateway rather than A.  Then you use Traffic Control (tc) 
rules to direct the kernel to use the new routing table for the traffic 
that you want to manually route.



Grant. . . .
