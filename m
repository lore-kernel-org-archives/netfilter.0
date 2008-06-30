From: Martin <mylists@itcom.com.ar>
Subject: Re: load balance [OT?] [Solution]
Date: Mon, 30 Jun 2008 10:32:37 -0300
Message-ID: <1214832757.19463.40.camel@kr0sty>
References: <1214492735.4427.6885.camel@kr0sty>
	 <4866ECB1.2040903@riverviewtech.net>
Reply-To: mylists@itcom.com.ar
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4866ECB1.2040903@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Sat, 2008-06-28 at 21:00 -0500, Grant Taylor wrote:
> On 6/26/2008 10:05 AM, Martin wrote:
> > That was it, pinging gateways before load balance script and pinging 
> > them every 10 minutes do the trick.
> 
> How well will pinging work if the kernel's DGD detects the gateway to be 
> dead?  I'd be tempted to use an ARP ping to be sure that the kernel's 
> routing table is not re-routing the packets out a different way.
> 
> 
> 
> Grant. . . .

That's right, the ping part is to keep gateways in the arp table, so
arpinging them'd be the same as normal ping for the case. Probably (I
didn't tested it) adding MAC and IP with arp should work too.

May be I'm missing something, but what do you mean with "kernel's DGD"?

Cheers.


Martin

