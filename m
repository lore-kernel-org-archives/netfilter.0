From: Bart De Schuymer <bdschuym@pandora.be>
Subject: Re: Fw: Problems with nf_nat_ftp.ko and nf_conntrack_ftp.ko in  
	2.6.22.6
Date: Thu, 08 Nov 2007 00:29:51 +0100
Message-ID: <1194478191.2983.7.camel@localhost.localdomain>
References: <W352381485970601194435879@nocme1bl6.telenet-ops.be>
	 <4731A7A9.1050606@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <4731A7A9.1050606@trash.net>
Sender: netfilter-devel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick McHardy <kaber@trash.net>
Cc: "bdschuym@pandora.be" <bdschuym@telenet.be>, ron lai <ronlai@cs.stanford.edu>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Op wo, 07-11-2007 te 12:55 +0100, schreef Patrick McHardy:
> Could you check the attached patch?

Looks ok to me.

>  > Another solution I think is this:
> > in br_nf_post_routing():
> > change
> > if (!nf_bridge)
> > to
> > if (!nf_bridge || !(nf_bridge->mask & BRNF_BRIDGED_DNAT))
> 
> Wouldn't that break the regular case of packets forwarded
> through a single bridge?

Hmm, yes, we'd need to or it with BRNF_BRIDGED. I personally prefer
something like that, leaving the call to nf_bridge_put when the skbuff
is removed. But it's your call :)

cheers,
Bart


