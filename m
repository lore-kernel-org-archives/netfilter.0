From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Rules PREROUTING doesn't work
Date: Thu, 18 Mar 2010 02:14:46 +0100 (CET)
Message-ID: <alpine.LSU.2.01.1003180214250.12950@obet.zrqbmnf.qr>
References: <1c1b5a0f1003162027s73fe4756yefd48b436375b04b@mail.gmail.com>  <hnqkk4$62v$1@dough.gmane.org>  <alpine.LSU.2.01.1003171419450.6297@obet.zrqbmnf.qr>  <1c1b5a0f1003170820q4cadb03ah4e3f4580f509c5e0@mail.gmail.com> <56378e321003171325n18f4ca91x358acadc0568643c@mail.gmail.com>
 <hnrrke$d0$1@dough.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <hnrrke$d0$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Nichols <rnicholsNOSPAM@comcast.net>
Cc: netfilter@vger.kernel.org


On Thursday 2010-03-18 01:20, Robert Nichols wrote:
>
> And, I just noticed that the protocol is UDP.  The only way a UDP
> entry gets removed from conntrack is by timing out, and that can take
> up to 3 minutes (see the values in
> /proc/sys/net/netfilter/nf_conntrack_udp_timeout*).

No, that is not the only way. You can manually remove entries
with `conntrack -D ...`.
