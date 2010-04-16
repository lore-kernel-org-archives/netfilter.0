From: Subhadeep Ghosh <subhadeep.ghosh@uniken.com>
Subject: Re: Reg: Replacing sk_buff in a NetFilter hook
Date: Fri, 16 Apr 2010 18:25:11 +0530
Message-ID: <w2v3a8740fd1004160555v677af62fqd546524c92778dff@mail.gmail.com>
References: <j2j3a8740fd1004160337o83306b13g4d22c71d6b784ee0@mail.gmail.com>
	 <alpine.LSU.2.01.1004161245440.11880@obet.zrqbmnf.qr>
	 <t2w3a8740fd1004160401j3d39896bk70e20165fc721981@mail.gmail.com>
	 <alpine.LSU.2.01.1004161406030.16388@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1004161406030.16388@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Hello Jan,

Thank you once again for the reply. I asked the question because I was
of the notion that it was not a very good play around with the memory
which was allocated by some other NetFilter module. I had this doubt
because I got confused between NDIS network drivers, where modifying
the pointers in a packet which was allocated by some other module
resulted in a BSOD, and NetFilter modules.

Thank you once again for clarifying my doubts.

Thank you and regards,
Subhadeep Ghosh.

On Fri, Apr 16, 2010 at 5:42 PM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
>
> On Friday 2010-04-16 13:01, Subhadeep Ghosh wrote:
>
>>Hello Jan,
>>
>>Thank you for your reply. Yes, I am aware of what NF_DROP and
>>NF_STOLEN mean. My question was, is it possible for me to replace the
>>original sk_buff with the new sk_buff which I created, in the sk_buff
>>processing queue?
>>
>>For example in the earlier NetFilter hook implementations, the
>>signature of a hook function was,
>>
>>unsigned int nf_hookfn(unsigned int hooknum,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s=
truct sk_buff** skb,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0c=
onst struct net_device* in,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0c=
onst struct net_device* out,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i=
nt (*okfn)(struct sk_buff*));
>
> This was once used because an skb could be shared, and making changes
> to it in COW fashion requires the skb to be copied - something like
> that, it's in the git logs (v2.6.23-3980-g3db05fe and its immediate
> parent commits).
> The double indirection was, I think, not originally meant
> for replacing packets.
>
>>While in the current implementations, it has been changed to,
>>
>>unsigned int nf_hookfn(unsigned int hooknum,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s=
truct sk_buff* skb,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0c=
onst struct net_device* in,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0c=
onst struct net_device* out,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i=
nt (*okfn)(struct sk_buff*));
>>
>>The only difference between the two implementations is sk_buff** has
>>been changed to sk_buff*. So, in the earlier versions if *skb was
>>assigned with the address of the newly created sk_buff and marked the
>>original sk_buff as NF_STOLEN
>
> NF_xxx is not a property of a skb, though. The implicit stealing
> of the oldskb was just a side-effect.
>
>>and then did a kfree_skb on it, then it
>>would work. However, in the current implementations a hook developer
>>is not allowed to change the sk_buff pointer which NetFilter sends to
>>the hook functions. And that is what I wanted to do.
>
> If you can replace a skb, you can just as well change the existing
> one.
>
