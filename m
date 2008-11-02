From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Weird NAT problem
Date: Sat, 01 Nov 2008 19:51:09 -0500
Message-ID: <490CF97D.4010602@riverviewtech.net>
References: <200811012307.18305.bero@linux.cd> <490CDCC2.3070202@riverviewtech.net> <490CDDA9.90200@riverviewtech.net> <200811020052.19932.bero@arklinux.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200811020052.19932.bero@arklinux.ch>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/1/2008 6:52 PM, Bernhard Rosenkraenzer wrote:
> Thanks!!!! That's exactly what it turned out to be.

*nod*

IMHO PPPoE is only nice from the providers point of view.  I really wish 
that we could go to MPLS rather than PPPoE, but I don't think that will 
happen any time soon.

PPPoE does not do any thing for MTU / MSS issues, where as MPLS will 
split large frames for transport and then splice them back together on 
the other end.

> It's working perfectly now.

Good!

Don't you love it when it's something that is simple to solve / work 
around, even if should *NOT* have to.  ;)

> Thanks again

You are welcome.  :)



Grant. . . .
