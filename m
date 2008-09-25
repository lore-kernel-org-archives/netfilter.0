From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ULOG/NFLOG on a non-forwarding machine
Date: Thu, 25 Sep 2008 09:05:48 -0500
Message-ID: <48DB9ABC.9060902@riverviewtech.net>
References: <m38wtjur74.fsf@ursa.amorsen.dk>	<48D9ACB2.80502@riverviewtech.net> <m3hc84mw4m.fsf@ursa.amorsen.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <m3hc84mw4m.fsf@ursa.amorsen.dk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/25/08 04:07, Benny Amorsen wrote:
> That is exactly the problem. The network stack doesn't think it needs 
> to do anything with the packets.

*nod*

> If the kernel has to forward the packet, the performance advantages 
> of using NFLOG probably disappear.

Eh...

> I guess I'm sticking to libpcap then.

Consider looking at bridging and allowing IPTables to see bridged 
traffic.  The traffic will end up being dropped or not forwarded because 
there is no destination on the other side.  However in the process I 
think the traffic will pass through IPTables thus allowing you to do 
what you are wanting to do.



Grant. . . .
