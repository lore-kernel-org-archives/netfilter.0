From: Vincent Bernat <bernat@luffy.cx>
Subject: Re: netfilter queue
Date: Sun, 31 May 2009 11:38:40 +0200
Message-ID: <m3y6sdd333.fsf@neo.luffy.cx>
References: <4A221BFA.20507@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A221BFA.20507@gmail.com> (Michael Mefford's message of "Sat, 30
	May 2009 23:56:10 -0600")
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael Mefford <meffordm@gmail.com>
Cc: netfilter@vger.kernel.org

OoO En cette aube naissante du dimanche 31 mai 2009, vers 07:56, Michae=
l
Mefford <meffordm@gmail.com> disait=C2=A0:

> I need to know how to interact with the netfilter queue.  My project
> needs to capture TCP packets from the queue, process them in
> userspace, and then re-insert them back into the firewall to forwarde=
d
> on.  However, I can't find any recent documentation that explains how
> to do this.  The most I can find is about 3 years old (and seemingly
> out of date).  Does anyone have good working knowledge that might hel=
p
> me understand this?

You have a basic example in the sources:
 https://git.netfilter.org/cgi-bin/gitweb.cgi?p=3Dlibnetfilter_queue.gi=
t;a=3Dblob;f=3Dutils/nfqnl_test.c;hb=3DHEAD

I have a pet project using Netfilter queue if you want another example:
 http://cgit.luffy.cx/udpproxy/tree/src/proxy.c

There is also nufw and mxallowd that uses netfilter queue.

To modify a packet, just modify your received copy (or another copy) an=
d
use the two last arguments of  nf_queue_set_verdict to be the size and =
a
pointer to your copy. Otherwise, set them to 0 and NULL.
--=20
#ifdef STUPIDLY_TRUST_BROKEN_PCMD_ENA_BIT
        2.4.0-test2 /usr/src/linux/drivers/ide/cmd640.c
