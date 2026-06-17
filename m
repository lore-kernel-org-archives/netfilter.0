Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732C7337BB5
	for <netfilter@vger.kernel.org>; Wed, 17 Jun 2026 20:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781727360; cv=none; b=piKC0zPyphlaEYYS/1Sd52HSiM83j1n21RhUcgatUzfrNeeuTD/3rgg4x2aBvYDLrM/S0nz6xF7IREo7sEFWwxeyWfh4NsV8ESyHlaBFgcRc1X5QrR6iofZlXVy4LHD8QyvbC68EOG8OWoRke4oK/ncGJPCWB7GN27M6hH0exHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781727360; c=relaxed/simple;
	bh=AYZqb16//QpZU4/8I7CbJo9qluPpCwC8vx5DuDa0y5o=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DedO42OV0WmgcgjZS9okUaYMeRLX6kBa3/Lqu/s7clHVpcp7bXw6flAlzy7/9Fu2del48jxf5C22g6DIr9exyIU2+2CqoHy401vCtsWgo+RKn4+syOFBCzzlKZTh6pVmjt+uhPCIj5O+hYHd/ZhAERHXlfJ2q+s+AJDTS0kIto0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=AqYEcCVb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TprQmJNe; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="AqYEcCVb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TprQmJNe"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B3A177A009C;
	Wed, 17 Jun 2026 16:15:57 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Wed, 17 Jun 2026 16:15:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1781727357;
	 x=1781813757; bh=iTVYGEtoupl42hxVRlOaM2/25G25/BIBv4bmG+OHxMs=; b=
	AqYEcCVbtc/yiHS2+433G6XgEaEDW3B18KIWBr46OVOfa285lmULLrlLkFcOfjRg
	tKqlee6A10q4IGmJY18VosgL0OPv7wn/I/oZcAjtJGXNyLmIjtmKKukzaxglK7EL
	OFUzMoNSQy38TEL9urp8SEDgYdjlgfk28DKJio9SOnW0tNLfVxg8MvpVeAK5FQ4P
	TmHhPy6SYMwbAdC59reCdRND9/2hpWEFwAc8cwfQTxT2TG5fWmwHc7QXgtUV/ObW
	7QLR12ym9yxXnXmh3JzHhszsWzC2X2SyOMyYDX6JLGy0SF4UIvhxaAH1zYN81TkI
	lGy++pt0Uoo0nt0Cyd/hAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1781727357; x=1781813757; bh=i
	TVYGEtoupl42hxVRlOaM2/25G25/BIBv4bmG+OHxMs=; b=TprQmJNet9VUTHhjM
	jSrk1HHQuzp7eXh6DuA50MIaDPSJqGoqBApCgwyUF5DFLoPZOpKXH0M9Ahu1KyCH
	hRiWDo8UWg4g3O+BBouZ3fg6nfmZCA7KrPASlSJriHMrIBtQlpmcjfPRcKwyyqsA
	H3+CnV2P3UyJpdsHklBsK5Ek92QKBpC9DlIj6lcfHRyEPCPwfnoT7lby7iuef+qu
	ujwGtRpyUmLSSHcPdzxdTkwtiCl3rTjoYcOU8yqNnprSqz652tECLXO882QPLIuP
	LkHU+bOAESEyjSI6O77YRzpEjOMe3MIfD6hT437oz67Pu7HP+XygG9kQtmuEvY+5
	1vdcQ==
X-ME-Sender: <xms:fAAzaneCCwGudzWNMouxWiy6Gt5n8D-dE6gcO8Q27uMep9S1_NKS5Q>
    <xme:fAAzaoBKYByKelXgKyp0oSyjE8Z4YrbL2TIaHbNQFLOTsPyTXoiBiqKtR9FkZDOtr
    KvhDHfFxIcgxcnxKbvYZxdtP2_odX2LnWxDDS-pqlp3kGqjcsNIcQ>
X-ME-Proxy-Cause: dmFkZTFjsJ5/UgRdM1P6KybfJDc8qlXbKwzuVhjOBWW2iZQtz2+6KFMZDy+bxWa5Vvu+EZ
    A8BQWUmOuRtpQAOohZ01sd8l3YRQ5/XqNwuYs2MXPWDK9H8TeohARJQyQbXS6xfMc2rEx4
    56JYkQ0XXypk1B9mDyoUGEl6WTOUtw4aBkBCvgWxH/FaIrHinUCCfw4J7svNJyUFEPCt4p
    ImvtVALdGGC1q6rN5dsca+pqepyzlmkX5w29DFu8+D4sC66McHUdKdB/J/2h7+z03+iSAQ
    XZnAbBQ1uGLWyxSSu54L3YV8VbDIcafmhnku6nK2DgrCcXHvwmtlc4WSZjODwp3s2WP4ff
    80T0rqrkiffMP64k0fxdKfBAEl1nNty1LMmEUvDg10r24A0Qq/G5uaP5lsm2M/IV+OQHnH
    wWQlC8khj8Mmf/nPJWUoYMz+AXOcVD/gRnCitv6fE9VBBixAQbeN8fUook79Bq/S9Kd1zm
    ma5k4D2bu9DtsZSw7X9jffksM2fFYnaui0NESRPci9b03EhF3g+gzJv7gR1vIcnwIRuQUt
    z3QKBM0Px1XhrOp8Bcgl0itJwcX41a30Axf26DwSNyA8hmT52Ws5gBy9FR37DPSVpdUglu
    IYpJ8TXa+umz7bieFUo3rbwgBrFQ5TXRsYH1UyGogzRUAuU2M9ZWxL12OlWw
X-ME-Proxy: <xmx:fQAzamJ1JxQwS8pd3TCXwe5QGocOvcL0lrZlvkWADS3bN7LtdyKcdw>
    <xmx:fQAzasFPdWI1gyUW4vCnVNLd8x2z-khGpAbVPt5lbwbhCXyD6SojKQ>
    <xmx:fQAzauTYTB8TLjeQ_t24_mtD51R2OI0ywxFXu0z1L6QhgRZGUubKJg>
    <xmx:fQAzaoEcXaZc1ETYQZiRMRicF_LW8HeEfR4BimbKEmauFutM1ottjA>
    <xmx:fQAzapJWSQcQT974X_ab6XzDmldzWPFblu2SVZEE7I2Kznh3gRwjK0VK>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E6336216008A; Wed, 17 Jun 2026 16:15:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AIJcFPqjnf5V
Date: Wed, 17 Jun 2026 21:15:36 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: Binarus <lists@binarus.de>, netfilter@vger.kernel.org
Message-Id: <8b8c1afa-4398-48d5-9d32-da687c896e14@app.fastmail.com>
In-Reply-To: <41f34484-1a51-4b94-81b5-99a22292b674@binarus.de>
References: <2b4db6cd-bc9b-47ff-99ee-7c15da7a343f@binarus.de>
 <f81bb631-3b65-4332-a076-4feae632ab13@app.fastmail.com>
 <41f34484-1a51-4b94-81b5-99a22292b674@binarus.de>
Subject: Re: "nft list hooks" not showing the custom nat chains, and unexpected
 priority for nf_nat_ipv4_local_fn
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Jun 2026, at 2:44 PM, Binarus wrote:
> At first, thank you very much for taking the time.
>
> On 13.06.2026 18:52, Kerin Millar wrote:
>> Hi,
>>=20
>> On Sat, 13 Jun 2026, at 5:16 PM, Binarus wrote:
>>> Dear all,
>>>
>>> I am still struggling with understanding the packet flow through the
>>> netfilter hooks and chains. Therefore, I have set up a very simple t=
est
>>> scenario. Before listing the ruleset, a few remarks:
>>>
>>> The following relates to netfilter 1.1.3 with kernel 6.12.90 on Debi=
an
>>> trixie. I had to modify the kernel to enable the hook listing, but
>>> that's the only change compared to a Debian trixie vanilla system.
>>>
>>> The test system has a ppp0 interface (default route / internet acces=
s)
>>> and a physical NIC interface (network 192.168.20.0/24, IP
>>> 192.168.20.249). The following ruleset is totally useless for any
>>> practical application, but I hope it's appropriate for investigation=
s:
>>>
>>> root@charon /etc/network # nft list ruleset
>>> table ip t_IP {
>>>           chain output-route {
>>>                   type route hook output priority mangle; policy dro=
p;
>>>                   ip saddr 192.168.20.249 ip protocol icmp meta nftr=
ace set 1
>>>                   accept
>>>           }
>>>
>>>           chain output-filter {
>>>                   type filter hook output priority filter; policy dr=
op;
>>>                   ip saddr 192.168.20.249 ip protocol icmp meta nftr=
ace set 1
>>>                   accept
>>>           }
>>>
>>>           chain output-nat {
>>>                   type nat hook output priority 100; policy drop;
>>>                   ip saddr 192.168.20.249 ip protocol icmp meta nftr=
ace set 1
>>>                   accept
>>>           }
>>>
>>>           chain postrouting-filter {
>>>                   type filter hook postrouting priority filter; poli=
cy drop;
>>>                   ip saddr 192.168.20.249 ip protocol icmp meta nftr=
ace set 1
>>>                   accept
>>>           }
>>>
>>>           chain postrouting-nat {
>>>                   type nat hook postrouting priority srcnat; policy =
drop;
>>>                   ip saddr 192.168.20.249 ip protocol icmp meta nftr=
ace
>>> set 1
>>>                   oifname "ppp0" ip protocol { tcp, udp } masquerade=
 to
>>> :61000-64999
>>>                   oifname "ppp0" ip protocol icmp masquerade
>>>                   accept
>>>           }
>>> }
>>>
>>> The goal is to investigate the flow of an outbound icmp packet that =
is
>>> locally generated. I believe that the above ruleset includes all pai=
rs
>>> of hooks and chain types that exist for outbound local packets. I ha=
ve
>>> included the "nftrace" line in every chain because I wanted to see a=
ll
>>> chains the packet goes through even in case I had totally misunderst=
ood
>>> the order.
>>>
>>> But before the actual test, I looked at the output of "nft list hook=
s".
>>> This is the result:
>>>
>>> root@charon /etc/network # nft list hooks
>>> family ip {
>>>           hook prerouting {
>>>                   -0000000400 ipv4_conntrack_defrag [nf_defrag_ipv4]
>>>                   -0000000200 ipv4_conntrack_in [nf_conntrack]
>>>                   -0000000100 nf_nat_ipv4_pre_routing [nf_nat]
>>>           }
>>>           hook input {
>>>                   +0000000100 nf_nat_ipv4_local_in [nf_nat]
>>>                   +2147483647 nf_confirm [nf_conntrack]
>>>           }
>>>           hook output {
>>>                   -0000000400 ipv4_conntrack_defrag [nf_defrag_ipv4]
>>>                   -0000000200 ipv4_conntrack_local [nf_conntrack]
>>>                   -0000000150 chain ip t_IP output-route [nf_tables]
>>>                   -0000000100 nf_nat_ipv4_local_fn [nf_nat]
>>>                    0000000000 chain ip t_IP output-filter [nf_tables]
>>>           }
>>>           hook postrouting {
>>>                    0000000000 chain ip t_IP postrouting-filter [nf_t=
ables]
>>>                   +0000000100 nf_nat_ipv4_out [nf_nat]
>>>                   +2147483647 nf_confirm [nf_conntrack]
>>>           }
>>> }
>>>
>>> Now this leaves me totally clueless. Focusing on the output and the
>>> postrouting hook only (because I'd like to learn about these two fir=
st):
>>>
>>> 1.
>>> My own custom output-route, output-filter and postrouting-filter are
>>> listed. But neither the output-nat nor the postrouting-nat chain are
>>> listed; at their place, the respective internal netfilter functions =
are
>>> listed.
>>>
>>> I then have changed the priorities for these two chains (setting them
>>> to the shown value from the ruleset =C2=B11 each) in case the default
>>> priorities must not be used. But that did not change anything: The
>>> custom nat chains still were not listed in the output of "nft list
>>> hooks".
>>>
>>> Could somebody please explain where my misunderstanding is? In furth=
er
>>> tests, I have verified that these custom chains were indeed active, =
so
>>> why aren't they listed?
>>=20
>> It is enumerating the hook functions registered by the Netfilter core=
. The names of your nat chains are not shown because they are subordinat=
e to the nf_nat hook functions. In your case, the relevant ones are "nf_=
nat_ipv4_local_fn" for output, and "nf_nat_ipv4_out" for postrouting.
>
> Thank you very much for the explanation. Then that's obviously also th=
e=20
> reason why changing the priority didn't change anything.
>
> I suppose that netfilter still takes the chain priority into account=20
> when calling the subordinate chains. That is, the nat hook functions=20
> are always at the same priority, but in turn call the registered=20
> subordinate chains in the order of their priorities. Is this correct?

Provided the word, same, as taken as meaning "at a fixed, per-hook prior=
ity" then yes, this is entirely correct.

--=20
Kerin Millar
