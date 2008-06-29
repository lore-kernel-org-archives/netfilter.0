From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: load balance [OT?] [Solution]
Date: Sat, 28 Jun 2008 21:00:17 -0500
Message-ID: <4866ECB1.2040903@riverviewtech.net>
References: <1214492735.4427.6885.camel@kr0sty>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1214492735.4427.6885.camel@kr0sty>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 6/26/2008 10:05 AM, Martin wrote:
> That was it, pinging gateways before load balance script and pinging 
> them every 10 minutes do the trick.

How well will pinging work if the kernel's DGD detects the gateway to be 
dead?  I'd be tempted to use an ARP ping to be sure that the kernel's 
routing table is not re-routing the packets out a different way.



Grant. . . .

