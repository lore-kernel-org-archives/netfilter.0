From: Benny Amorsen <benny+usenet@amorsen.dk>
Subject: Re: ULOG/NFLOG on a non-forwarding machine
Date: Thu, 25 Sep 2008 11:07:37 +0200
Message-ID: <m3hc84mw4m.fsf@ursa.amorsen.dk>
References: <m38wtjur74.fsf@ursa.amorsen.dk>
	<48D9ACB2.80502@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48D9ACB2.80502@riverviewtech.net> (Grant Taylor's message of "Tue\, 23 Sep 2008 21\:57\:54 -0500")
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Grant Taylor <gtaylor@riverviewtech.net> writes:

> You /might/ be able to catch some traffic *if* the Linux TCP/IP stack
> thought that it was appropriately addressed to the system.

That is exactly the problem. The network stack doesn't think it needs
to do anything with the packets.

> I think you will have better luck doing this with bridging as bridging
> is (more) accustom to dealing with traffic that may or may not be
> addressed to the local system.

If the kernel has to forward the packet, the performance advantages of
using NFLOG probably disappear.

I guess I'm sticking to libpcap then.


/Benny

