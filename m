From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: ROUTE
Date: Tue, 5 Feb 2008 12:41:26 +0100
Message-ID: <000301c867ec$0d10d990$0b0ffe0a@NS006819>
References: <47A836FD.7060607@gmail.com>
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47A836FD.7060607@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> Its been a while since i have been on this list, I trust everyone is
> good and well.
>
> I need to compile the 2.6.24 kernel, but with POMS ROUTE.
>
> Im seeing that Route is not the lastest POM.
>
> If i may ask is there a reason for this, or is there a better way to
> route traffic out a different interface.

The module is removed some time ago and although I don't know the exact
reason, I can imagine it has to do with maintaining it but of course
there could be another reason.
http://www.gossamer-threads.com/lists/iptables/devel/68781

You could mark the packets and route them using iproute2, but I don't
know if that would satisfy your needs. Or, if it's of use for you,
checkout the TEE target.
http://www.spinics.net/lists/netfilter/msg42319.html
http://dev.computergmbh.de/wsvn/misc_kernel/xt_TEE/


Grts,
Rob


