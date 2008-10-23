From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: IP redirect?
Date: Thu, 23 Oct 2008 08:56:59 -0500
Message-ID: <490082AB.9060606@riverviewtech.net>
References: <48FC5095.5040202@read.org.nz> <48FCB064.1020907@riverviewtech.net> <4900492A.1050101@read.org.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4900492A.1050101@read.org.nz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/23/08 04:51, Morgan Read wrote:
> OK, thank you

You are welcome.

> Thank you, it works - any ideas why why the DNAT worked on it's own 
> with out the SNAT 18 months ago?  Or is that a silly question...

No.  I see no reason that it would have worked before at all.  The only 
thing that I can think of is that you were not DNATing with in the same 
subnet such that your traffic was routed back through the router where 
it would unDNAT it any way, much like MASQUERADing / SNAT does out to 
the internet (remember that MASQUERADing / SNATing is only so that 
systems on the net have a route back to your client).

> Many thanks,

*nod*



Grant. . . .
