From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: libnetfilter_queue in VM
Date: Sun, 22 Jan 2012 21:11:23 +0100
Message-ID: <jfhqhb$n2n$2@dough.gmane.org>
References: <20120102195845.GA26867__10136.4863025539$1325543752$gmane$org@1984>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120102195845.GA26867__10136.4863025539$1325543752$gmane$org@1984>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

has any of the developers, testers or users tested the libnetfilter_queue
library under openvz VM's?

When I boot my debian system with an openvz kernel then this library
works only on the host node (HN), but not in the virtual machines (VM),
even after granting all possible capabilities like NET_ADMIN etc. to the VM.

In the VM the call to nfq_open() succeeds, but nfq_unbind_pf() and
nfq_bind_pf() fail by each returning -1. What do you think could be
the reason it's failing? Could it maybe a Selinux-issue?

I would like to ask if any of you has successfully tested/used this library in VM's?

Regards,
U.Mutlu


In netfilter.announce Pablo Neira Ayuso wrote, On 2012-01-02 20:58:
> Hi!
>
> The Netfilter project proudly presents:
>
>          libnetfilter_queue 1.0.1
>
> libnetfilter_queue is a userspace library providing an API to packets
> that have been queued by the kernel packet filter.
>
> See ChangeLog that comes attached to this email for more details.
>
> You can download it from:
>
> http://www.netfilter.org/projects/libnetfilter_queue/downloads.html
> ftp://ftp.netfilter.org/pub/libnetfilter_queue/
>
> Have fun!

