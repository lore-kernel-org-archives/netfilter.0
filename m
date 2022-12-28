From: Andrej Stender <andrej.stender@thermalcircle.de>
Subject: Re: netfilter flowtable software offload
Date: Wed, 28 Dec 2022 23:09:13 +0100
Message-ID: <20221228230913.11372662@enterprise.apron>
References: <CAF1Qswj+MEKhb3i7xZuK+XvWw_7wTQdiTezPWuH8XQ-tjjUMsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAF1Qswj+MEKhb3i7xZuK+XvWw_7wTQdiTezPWuH8XQ-tjjUMsQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: yves baumes <ybaumes@gmail.com>
Cc: netfilter@vger.kernel.org

yves baumes <ybaumes@gmail.com> wrote:
> I have a few questions about the netfilter flowtables to offload
> traffic. https://wiki.nftables.org/wiki-nftables/index.php/Flowtables
> 
> 1- Does QOS (Cake) is being applied even in the case of fastpath? The
> documentation states that it passes anyway through the neigh_xmit()
> function. Does this function applies QOS? (I would prefer that it does
> apply QOS in every case).

Hi Ives,

a few months ago I wrote a series of blog articles about flowtables,
which I think should answer most of your questions:
https://thermalcircle.de/doku.php?id=blog:linux:flowtables_1_a_netfilter_nftables_fastpath

> 2- Is there a way to remove an entry from the flowtable? Or to
> flush/clear the flowtable? Or to put some timeout to entries in the
> flowtable (so the flowtable removes an entry after this timeout)? It's
> actually quite important for my use case, to be able to remove a user.

A timeout exists (default 30s, see mentioned article). As of kernel
5.10 there seems to be no way to explicitly trigger removal of a flow
(except when deleting the flowtable). Someone correct me here please,
in case that had been added to newer kernels in the meantime. In my
company we patched the kernel to remove flowtable flows together with
conntrack entries when the user runs command "conntrack -F". However
that patch is not in mainline. I am not sure whether that would be
wanted behavior in mainline and whether it would even work when e.g.
using flowtable hardware offloading (we only used software offloading).
