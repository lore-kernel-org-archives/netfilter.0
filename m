From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ipt postrouting nat / ebt postrouting nat - question about order
 when bridge-nf is enabled
Date: Wed, 18 Jun 2008 17:13:59 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806181708220.32473@fbirervta.pbzchgretzou.qr>
References: <48592081.5000008@ziu.info>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48592081.5000008@ziu.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Soltys <soltys@ziu.info>
Cc: netfilter@vger.kernel.org


On Wednesday 2008-06-18 16:49, Michal Soltys wrote:

> Hello
>
> After finding this pretty recent and nice summary of packet flow:
>
> http://jengelh.medozas.de/images/nf-packet-flow.png (1)
>
> I noticed that in case of locally generated packets (routed through
> bridge's port), ebtables nat postrouting is evaluated _after_
> iptables nat postrouting,
>
> My question - does current behaviour (as in (1)) is inteneded, or
> is it perhaps a bug, and diagram (2) should be right ?

(1), because it is recent :-)

commit 2bf540b73ed5b304e84bb4d4c390d49d1cfa0ef8
describe-tag v2.6.19-3516-g2bf540b
Author: Patrick McHardy <kaber@trash.net>
Date:   Wed Dec 13 16:54:25 2006 -0800

    [NETFILTER]: bridge-netfilter: remove deferred hooks
