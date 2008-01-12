From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Packet loss?
Date: Sat, 12 Jan 2008 18:33:10 +0000 (GMT)
Message-ID: <Pine.LNX.4.58.0801121827530.24458@mail3.jubileegroup.co.uk>
References: <eafa772f0801120559p1cd3e2a4q41440060996efe11@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <eafa772f0801120559p1cd3e2a4q41440060996efe11@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

On Sat, 12 Jan 2008, Steven Ayre wrote:

> From Linux machine:
> OUT: [SYN] Seq=0 Len=0 MSS=1418 TSV=429048334 TSER=0 WS=1
> IN:  [SYN,ACK] Seq=0 Ack=1 Win=8190 Len=0 MSS=1418
> ...
> IN:  [ACK] Seq=1 Ack=59 Win=64735 Len=0
> IN:  ...HTML response received...
>
> From LAN machine:
> OUT: [SYN] Seq=0 Len=0 MSS=1460
> IN:  [SYN,ACK] Seq=0 Ack=1 Win=8190 Len=0 MSS=1460
> ...
> IN:  [ACK] Seq=1 Ack=59 Win=63009 Len=0
> ...then nothing...

Sounds like MTU.  Does this shed any light?

http://blue-labs.org/howto/mtu-mss.php

Maybe bad packet checksums?  They could be being dropped before they
even get to your router.  What happens if you put the browsing PC on
the router directly (if you dare:) ?

--

73,
Ged.

