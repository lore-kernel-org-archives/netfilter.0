From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: fwmark in the OUTPUT chain
Date: Sat, 2 Oct 2010 00:26:58 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010020024280.26371@obet.zrqbmnf.qr>
References: <AANLkTinezQJPvc-WaBt9L64Z-cEGqm9ugSeaL6xTnA3W@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinezQJPvc-WaBt9L64Z-cEGqm9ugSeaL6xTnA3W@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christopher Piggott <cpiggott@gmail.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2010-09-29 19:51, Christopher Piggott wrote:
>
>This question will probably make a lot more sense if you look at
>http://wiki.ubuntu.org.cn/images/f/f0/Iptables.gif while you are
>reading it.

It probably makes most sense if existing graphs be used, such as
http://en.wikipedia.org/wiki/Iptables (this is nf-packet-flow
from me, yes)

>the local system.  I have been marking them in the mangle table of the
>OUTPUT chain.
>
>This does, in fact, seem to set the correct mark on the packet, but,
>unfortunately, the packet's source address seems to have already been
>picked by this point.

The source address is chosen when you call bind(2) with
INADDR_ANY/IN6ADDR_ANY. Note that bind is implicit on connect if you
have not explicitly called bind. You can use `ip route get 1.2.3.4`
to see the details of which src it picks.

