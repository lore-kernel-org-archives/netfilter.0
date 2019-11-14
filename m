From: Alessandro Vesely <vesely@tana.it>
Subject: Re: Upgrading libnetfilter_queue to use nftables
Date: Thu, 14 Nov 2019 10:03:35 +0100
Message-ID: <a10d6417-ddcd-328e-1834-c234d92c28d8@tana.it>
References: <28ab2afb-a16a-14ae-e511-aa4e641c1f24@tana.it>
 <20191114031246.GI19558@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
        t=1573722215; bh=p1LX9FJLXsC/rOH8lq4H5hj2X3zRqiGHHVGg8qlXrNE=;
        l=967; h=To:Cc:References:From:Date:In-Reply-To;
        b=Dghqk2NG9IuFcxPjgqW+Klo43/wERTHR7rzOvpvM8RIBKWvePCjDcPx1y0C2AR1Ug
         Wygmoy340UxHzO6TtxG2uNVkNkJJGFkO2u1E9M//OF+bYDsojVqeWIBlGTN7Qm/XtF
         9zoFGVY2p0K8/woKtJ6r+pKLW85JtTOkg4M8ElUF8WNdluRGKJ7n804U+OmTh
In-Reply-To: <20191114031246.GI19558@breakpoint.cc>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter <netfilter@vger.kernel.org>

On Thu 14/Nov/2019 04:12:46 +0100 Florian Westphal wrote:
> Alessandro Vesely <vesely@tana.it> wrote:
>> [...]
>> There is a user space filter reading queued packets and issuing verdicts.  It is linked to libnetfilter_queue, libnfnetlink and libmnl.
>> Does automatic translation work fine in this case?
> 
> It has nothing to do with translation, userspace doesn't care, its the
> same interface.


So it shouldn't even be needed to maintain alternatives like Debian does, e.g.:

# update-alternatives --set iptables /usr/sbin/iptables-nft
vs
# update-alternatives --set iptables /usr/sbin/iptables-legacy


>> Do I have (better) to relink, recompile, and/or rewrite the user space packet filter in order to use nftable?  How simple is that?
> 
> No relink/rewrite needed, userspace can't tell if queueing came via
> -j NFQUEUE or nftables' queue, its the same kernel facility (nfnetlink_queue).
> 


Thank you for the reassurance


Best
Ale
