From: tednolan@bellsouth.net
Subject: Re: Very basic question about nfqnl_test.c
Date: Thu, 18 Feb 2010 13:39:38 -0500
Message-ID: <08.15.04431.5E98D7B4@cdptpa-omtalb.mail.rr.com>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

>
>The program seems to set up OK, but it then hangs on the recv() loop.
>My understanding is that I should be seeing printf() output from the
>callback function every time an IPV4 packet is seen, but I can telnet
>out to different ports, ping different things etc, and nothing ever
>is printed by the test program.
>
>Am I missing some very basic setup step like manually loading some
>module?  Am I mistaken in thinking I should be seeing gobs of output
>here?
>
>			Thanks,
>
>			Ted

OK,

I *was* missing a very basic setup step, as I finally found out from:

 gicl.cs.drexel.edu/people/tjkopena/wiki/pmwiki.php?n=SWAT.NetfilterQueueNotes

To be brief, and I certainly didn't see this anywhere in the API reference,
the "queues" referred to in the libnetfilter_queue documentation are
tied into iptables queues, so you have to fiddle with iptables before
you can successfully run nfqnl_test -- it won't suck up all your packets
by default.

As described in the link above, first

	sudo iptables -A OUTPUT -p icmp -j NFQUEUE --queue-num 0

which sends all icmp (in this case) traffic into libnetfilter_queue
queue #0

And afterwards

	sudo iptables -D OUTPUT -p icmp -j NFQUEUE --queue-num 0

to undo this.

Substitute, "tcp", "udp", "icmp", or "all" as desired for the argument to "-p".

			Ted
