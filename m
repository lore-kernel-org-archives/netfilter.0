From: Yevgeny Kosarzhevsky <deza50293@tut.by>
Subject: SNAT problem
Date: Sun, 22 Aug 2010 21:35:34 +0300
Message-ID: <4C716DF6.3040602@pisem.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I have the issue with incorrect SNAT.

I have two interfaces, let's say ppp0 - x.x.x.x, ppp1 - y.y.y.y ppp0 is 
a default gateway.
I use some command to change routing to IP z.z.z.z via ppp1:
ip ro ad to z.z.z.z dev ppp1

I have SNAT rules for both interfaces, however, I notice with tcpdump 
that outgoing packets are still using x.x.x.x instead of y.y.y.y IP, 
though packets are being sent with the correct interface (ppp1)

I have shut down ppp0 and removed SNAT rule for it, but outgoing packets 
are still showing x.x.x.x IP. Even, ip ro fl cache didn't help.

Is there anything I am doing wrongly? I suppose this is some unwanted 
behaviour.

warp:~# uname -a
Linux warp 2.6.32-5-686 #1 SMP Thu Aug 12 13:38:27 UTC 2010 i686 GNU/Linux

