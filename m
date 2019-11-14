From: Florian Westphal <fw@strlen.de>
Subject: Re: Upgrading libnetfilter_queue to use nftables
Date: Thu, 14 Nov 2019 04:12:46 +0100
Message-ID: <20191114031246.GI19558@breakpoint.cc>
References: <28ab2afb-a16a-14ae-e511-aa4e641c1f24@tana.it>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <28ab2afb-a16a-14ae-e511-aa4e641c1f24@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Vesely <vesely@tana.it>
Cc: netfilter <netfilter@vger.kernel.org>

Alessandro Vesely <vesely@tana.it> wrote:
> I'm using Debian 9 (stretch) and saw that the current version (Debian 10, buster) transparently installs nftables instead of iptables, offering to switch back by setting alternatives.
> I'm worried how smoothly an upgrade would go.  I have calls similar to these:
> 
> iptables -A INPUT -j NFQUEUE
>
> or
> 
> iptables -t raw -A OUTPUT -p tcp ! --syn -j NFQUEUE --queue-num 2
> iptables -A OUTPUT -p tcp ! --syn -m mark --mark 4 -j REJECT --reject-with tcp-reset
> 
> There is a user space filter reading queued packets and issuing verdicts.  It is linked to libnetfilter_queue, libnfnetlink and libmnl.
> Does automatic translation work fine in this case?

It has nothing to do with translation, userspace doesn't care, its the
same interface.

> Do I have (better) to relink, recompile, and/or rewrite the user space packet filter in order to use nftable?  How simple is that?

No relink/rewrite needed, userspace can't tell if queueing came via
-j NFQUEUE or nftables' queue, its the same kernel facility (nfnetlink_queue).
