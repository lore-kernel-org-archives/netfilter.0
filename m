From: Roc Bai <buroc83@gmail.com>
Subject: Re: How to redirect the package from eth0 to eth2
Date: Tue, 11 Jan 2011 23:26:11 +0800
Message-ID: <AANLkTinvmfXMtPTP1KuZ6_t_KQCqSoQVEFEEBihhzcfa@mail.gmail.com>
References: <AANLkTik5YfQ4eNzbSVt5QfmaEQnBA=VJ1NbueKgq9nZj@mail.gmail.com>
	<20110110115615.GH25060@outback.rfc2324.org>
	<AANLkTiniEo+DvnWfZQDU3FBZ7iAoqTnqAYuE1QbR=Wt2@mail.gmail.com>
	<alpine.LNX.2.01.1101111202140.15356@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=W75I3tnP2njvusaurGYMbYJmj8RwR/1jzLv/7OKogsM=;
        b=f4VJu4WuBoHwbYoleLemPvbij79M6QK5AuA/k9BwR7AD0b39aS+X0L51QV38u82COH
         okzEPC5YzfA3ihSq2k7Ty5T9XMOUYkxSHNzL4LMtEMRMtX993GNYNQWnbBa1frrgpO5c
         fsMzO+Z5q1QUtg4Xw/2fQ77XkWQlctJQS52g8=
In-Reply-To: <alpine.LNX.2.01.1101111202140.15356@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

2011/1/11 Jan Engelhardt <jengelh@medozas.de>:
>
> On Tuesday 2011-01-11 04:22, Roc Bai wrote:
>>>> Dear all:
>>>> =A0 =A0 in my service, there are four net card. =A0eth0, eth1, eth=
2, eth3. I
>>>> want to forward the data in from eth0 to eth1, eth2, eth3 with
>>>> different application protocol. Does some body send me some ideas =
on
>>>> it?
>>>
>>> If you want to re-route packages, that has to happen in pre-routing=
=2E
>>> If you want to use DNAT for examples, just add a rule to the
>>> PREROUTING chain in the nat table.
>>
>>I think the DNAT should change the package data, including the IP or
>>higher level protocol header, isn't it?
>
> That is the point of NAT. NAT is _not_ routing/forwarding (dammit).
> And it's "packet", not "package".
>
>>I think the best idea which can redirect the package is to add/change
>>the route rule to do it. I have write some source codes which doesn't
>>work.
>
> That's redundant (and as you can see, error prone). Just use
> the iproute utilities to define extra rules and routes, which
> are known to work.
>
>>ncf_get_entry() can generate a dst_entry whose dev point to the eth2
>>net_device structure. But when i use tcpdum -i eth2. I cannot get the
>>package from eth0. So it doesn't work.
>
> I don't expect it to. You are using a global variable, which is not
> SMP-safe without a lock.
> You might find Paul McKenny's Parallel Programming Book helping.
Jan, thanks your comments.
I want to make the packet ( I think it's right now:) ) redirected to
an anticipant port, so I haven't consider the concurrent problem now.

In the requirement, redirect the packet with protocal is the first
step, and in the second step, the system should redirect the packet
with application packet content, such as GET in HTTP.

eth0 ---------- if (GET in  SKB), redirect to ----------> eth2

So i think i have to write my module to redirect the packet now, and
then i can change little in the future. That's the key why i thouldn't
to use the exist nat/diverter tool.

Maybe i want to know  how to set the SKB in the
ip_route_input_common() routine. Then the SKB can be send out from
eth2 port. So
whether my plan is right, to create a dst-entry and add it to
skb->_skb_refdst? and Whether the dst_entry optiosn values are
corrent?



>
>>static struct dst_entry gdst;
>>static int ncfflag =3D 0;
>



--=20
------------------------

Thinking before action, but you are wasting time if you don't do action=
=2E
