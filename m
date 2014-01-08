From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH] netfilter: nf_conntrack: fix RCU race in
 nf_conntrack_find_get
Date: Wed, 08 Jan 2014 09:31:27 -0800
Message-ID: <1389202287.26646.95.camel@edumazet-glaptop2.roam.corp.google.com>
References: <1389090711-15843-1-git-send-email-avagin@openvz.org>
	 <1389107305.26646.20.camel@edumazet-glaptop2.roam.corp.google.com>
	 <20140107152520.GF9894@breakpoint.cc>
	 <1389188536.26646.84.camel@edumazet-glaptop2.roam.corp.google.com>
	 <20140108140444.GH9894@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:content-transfer-encoding:mime-version;
        bh=cwCCKuiEb5l5n4Kzz8hy/6EQAijUY6wr+FKORB7ZghA=;
        b=mwE+R2Cm146VIRSA0YeY8ISrNEJg/ma+HbjzDkHERLrX40GJG4xUN8Os6lm4NVWAW7
         0+hslImeL0Rx2OZDaaXdA8QeuG01czOuM7uuYHMNPJhGyYHvcwfvN8cyNVuDdKKwtkEF
         yoiPfqD5hiv109h9AZxDC5DkAY0YMRQnqHHx72/DPAeG6i1ctxiV66cqqn0cMOxfc+6S
         dQYPXu4rrXEc1aZffgopS12Wa7xFyaQ/tsxrCpFqsN624J1IrOGwF1mm4PsQh7Iiw6JD
         PwhKLOieHPDzncgWysHSQ5CeYX/JiTINdCeWUdpbWXqdGvu0dnXG1i/1asLPu0KKgNgI
         VumQ==
In-Reply-To: <20140108140444.GH9894@breakpoint.cc>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Florian Westphal <fw@strlen.de>
Cc: Andrey Vagin <avagin@openvz.org>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, vvs@openvz.org, Pablo Neira Ayuso <pablo@netfilter.org>, Patrick McHardy <kaber@trash.net>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "David S. Miller" <davem@davemloft.net>, Cyrill Gorcunov <gorcunov@openvz.org>

On Wed, 2014-01-08 at 15:04 +0100, Florian Westphal wrote:
> Eric Dumazet <eric.dumazet@gmail.com> wrote:
> > > This will also set up a null-binding when no matching SNAT/DNAT/MASQERUADE
> > > rule existed.
> > > 
> > > The manipulations of the skb->nfct->ext nat area are performed without
> > > a lock.  Concurrent access is supposedly impossible as the conntrack
> > > should not (yet) be in the hash table.
> > > 
> > > The confirmed bit is set right before we insert the conntrack into
> > > the hash table (after we traversed rules, ct is ready to be
> > > 'published').
> > > 
> > > i.e. when the confirmed bit is NOT set we should not be 'seeing' the nf_conn
> > > struct when we perform the lookup, as it should still be sitting on the
> > > 'unconfirmed' list, being invisible to readers.
> > > 
> > > Does that explanation make sense to you?
> > > 
> > > Thanks for looking into this.
> > 
> > Still, this patch adds a loop. And maybe an infinite one if confirmed
> > bit is set from an context that was interrupted by this one.
> 
> Hmm.  There should be at most one retry.
> 
> The confirmed bit should always be set here.

So why are you testing it ?

> If it isn't then this conntrack shouldn't be in the hash table, i.e.
> when we re-try we should find the same conntrack again with the bit set.

Where is this guaranteed ? The invariant is the refcnt being taken.

> 
> Asuming the other cpu git interrupted after setting confirmed
> bit but before inserting it into the hash table, then our re-try
> should not be able find a matching entry.
> 
> Maybe I am missing something, but I don't see how we could (upon
> retry) find the very same entry again with the bit still not set.
> 
> > If you need to test the confirmed bit, then you also need to test it
> > before taking the refcount.
> 
> I don't think that would make sense, because it should always be
> set (inserting conntrack into hash table without confirmed set is
> illegal, and it is never unset again).
> 
> [ when allocating a new conntrack, ct->status is zeroed, which also
>   clears the flag.  This happens just before we set the new objects
>   refcount to 1 ]


I did this RCU conversion, so I think I know what I am talking about.

The entry should not be put into hash table (or refcnt set to 1),
if its not ready. It is that simple.

We need to address this problem without adding an extra test and
possible loop for the lookups.

Whole point of RCU is to make lookups fast, by possibly making the
writers doing all the needed logic.


