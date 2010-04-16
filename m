From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Reg: Replacing sk_buff in a NetFilter hook
Date: Fri, 16 Apr 2010 14:12:27 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004161406030.16388@obet.zrqbmnf.qr>
References: <j2j3a8740fd1004160337o83306b13g4d22c71d6b784ee0@mail.gmail.com>  <alpine.LSU.2.01.1004161245440.11880@obet.zrqbmnf.qr> <t2w3a8740fd1004160401j3d39896bk70e20165fc721981@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <t2w3a8740fd1004160401j3d39896bk70e20165fc721981@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Subhadeep Ghosh <subhadeep.ghosh@uniken.com>
Cc: netfilter@vger.kernel.org


On Friday 2010-04-16 13:01, Subhadeep Ghosh wrote:

>Hello Jan,
>
>Thank you for your reply. Yes, I am aware of what NF_DROP and
>NF_STOLEN mean. My question was, is it possible for me to replace the
>original sk_buff with the new sk_buff which I created, in the sk_buff
>processing queue?
>
>For example in the earlier NetFilter hook implementations, the
>signature of a hook function was,
>
>unsigned int nf_hookfn(unsigned int hooknum,
>                                  struct sk_buff** skb,
>                                  const struct net_device* in,
>                                  const struct net_device* out,
>                                  int (*okfn)(struct sk_buff*));

This was once used because an skb could be shared, and making changes
to it in COW fashion requires the skb to be copied - something like
that, it's in the git logs (v2.6.23-3980-g3db05fe and its immediate
parent commits).
The double indirection was, I think, not originally meant
for replacing packets.

>While in the current implementations, it has been changed to,
>
>unsigned int nf_hookfn(unsigned int hooknum,
>                                  struct sk_buff* skb,
>                                  const struct net_device* in,
>                                  const struct net_device* out,
>                                  int (*okfn)(struct sk_buff*));
>
>The only difference between the two implementations is sk_buff** has
>been changed to sk_buff*. So, in the earlier versions if *skb was
>assigned with the address of the newly created sk_buff and marked the
>original sk_buff as NF_STOLEN

NF_xxx is not a property of a skb, though. The implicit stealing
of the oldskb was just a side-effect.

>and then did a kfree_skb on it, then it
>would work. However, in the current implementations a hook developer
>is not allowed to change the sk_buff pointer which NetFilter sends to
>the hook functions. And that is what I wanted to do.

If you can replace a skb, you can just as well change the existing
one.
