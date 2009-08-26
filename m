From: tom murphy <tommurphy105@gmail.com>
Subject: Re: What category of Firewall does Netfilter fall under?
Date: Wed, 26 Aug 2009 10:52:43 +0100
Message-ID: <f66b95be0908260252o42ce9b4dx28a4b4ef36eeeb62@mail.gmail.com>
References: <f66b95be0908260147k3676be79h10842cc9a49754ef@mail.gmail.com>
	 <56378e320908260153s34603098s34debbf22f0c9b43@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=u+pv28KxWDA1OehvjEzysiFufmbudM63jBmHpZ2M61c=;
        b=jiwTFWZTQY6vhNKz2QFWGARgZJJdzZyiQx7PE7Ec5K+h2q6a4mzPFabVFtBN249LJd
         P/jYUY1KhAL9cZke2XJLNujFUMWJ9xbAaGB7ovAR04I1gxOzVkAxV6unwN/ltnTyu/g4
         R9LvXJuxPbXnrwfiUUv34QOBN8zxncupVFTN8=
In-Reply-To: <56378e320908260153s34603098s34debbf22f0c9b43@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

>> Its seems there are at least 3 categories of firewall:
>> 1) packet filter (stateless filtering)
>> 2) stateful filter
>> 3) appliaction-level filter (aka. proxy filter)
>
> And as outlined by yourself and below by me... ipt is atleast 2 of the 3.
>
> [snip]
>> Any opinions or comments on helping me pigion hole Netfilter/iptables.
>> Perhaps stateful filter implies packet filter also.
>
> Just my personal opinion but for a firewall to be a stateful firewall
> it must by definition carry out packet filtering.
>
> iptables in its base form is a packet filtering firewall. Add the
> conntrack support and it becomes a stateful firewall. Add the advanced
> matching abilitiy and the L7 capability and it becomes an application
> firewall.
>
> I'd be inclined though to classify ipt as a stateful firewall though
> for most uses as the application firewall ability is provided by
> additional components and may, depending on definition, not fully
> qualify as an application firewall.
>
I agree. It was all the additional nuts and bolts that integrates with
Netfilter that was throwing me off.

I guess, Netfilter while it can perform as a proxy (NAT translation)
and provide deep packet inspection on other application-level
services, it is not suited as a proxy in the general sense. For
example, SQUID would be more suited as a web proxy (Cache and Access
Control) rather than trying to bend Netfilter to fall into this role
(performance reasons, granularity etc).

So I guess, I am inclined to say Netfilter is by default a Stateful
Packet Filter (I think conntracking is activated by default in the
kernal) and as a result it also subsumes the traditional stateless
packet filtering capabilities also.
