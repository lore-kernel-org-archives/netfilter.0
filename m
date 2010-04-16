From: Subhadeep Ghosh <subhadeep.ghosh@uniken.com>
Subject: Re: Reg: Replacing sk_buff in a NetFilter hook
Date: Fri, 16 Apr 2010 16:31:10 +0530
Message-ID: <t2w3a8740fd1004160401j3d39896bk70e20165fc721981@mail.gmail.com>
References: <j2j3a8740fd1004160337o83306b13g4d22c71d6b784ee0@mail.gmail.com>
	 <alpine.LSU.2.01.1004161245440.11880@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1004161245440.11880@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Hello Jan,

Thank you for your reply. Yes, I am aware of what NF_DROP and
NF_STOLEN mean. My question was, is it possible for me to replace the
original sk_buff with the new sk_buff which I created, in the sk_buff
processing queue?

For example in the earlier NetFilter hook implementations, the
signature of a hook function was,

unsigned int nf_hookfn(unsigned int hooknum,
                                  struct sk_buff** skb,
                                  const struct net_device* in,
                                  const struct net_device* out,
                                  int (*okfn)(struct sk_buff*));

While in the current implementations, it has been changed to,

unsigned int nf_hookfn(unsigned int hooknum,
                                  struct sk_buff* skb,
                                  const struct net_device* in,
                                  const struct net_device* out,
                                  int (*okfn)(struct sk_buff*));

The only difference between the two implementations is sk_buff** has
been changed to sk_buff*. So, in the earlier versions if *skb was
assigned with the address of the newly created sk_buff and marked the
original sk_buff as NF_STOLEN and then did a kfree_skb on it, then it
would work. However, in the current implementations a hook developer
is not allowed to change the sk_buff pointer which NetFilter sends to
the hook functions. And that is what I wanted to do.

Thank you and regards,
Subhadeep Ghosh.

On Fri, Apr 16, 2010 at 4:18 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
>
> On Friday 2010-04-16 12:37, Subhadeep Ghosh wrote:
>>
>>The first and the second steps are no-brainers. However, I don't know
>>if I need to drop the original packet or mark it as stolen. And I
>>definitely don't know how to resolve the fourth point. It would be
>>great if anyone could point me in the right direction.
>
> NF_DROP will cause netfilter to free it when the hooks are
> done; with NF_STOLEN, you have ownership of the skb and
> need to free it yourself.
>
