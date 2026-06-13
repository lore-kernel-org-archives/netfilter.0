Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8101B983F
	for <netfilter@vger.kernel.org>; Sat, 13 Jun 2026 16:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781369561; cv=none; b=P8oOwcf7LQ9rxsAxgPrBCNYfucxjjMY4QLzUMtrsLzLAt4FRDwRnzYEc57rOSXbdqrsxPWSFJHPe5QRZISuhaXqUTH+kW5SxGDjvyWid7gjqoTtoLyQZxF1vBumpfHBJ880g1PhKLmJSg0g6taOBbhn1jpSWwVMZGtlsZZ0CenE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781369561; c=relaxed/simple;
	bh=sqAH5iZCrhjg6+tFmE2eqRjebpbwLa7EQ7gLiZteSpM=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=B7yjSokAKvdd/Ej9nh8kSkTP3qd37Z9+bMdkWkI60f8RmcwfF2o06+z4pY/oEyuvime0YXfA5Q0sRL+szuaWaPH5C8Cr3ZbY9Xc67AKUs3m/4SLLXKYehq2dRbKtIxv05vWLumyv4I15Irp1/84RlV3EMbjYHgliinUA2jr5I6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=m82t3jvM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NHCeVU3l; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="m82t3jvM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NHCeVU3l"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 456EF1D000F5;
	Sat, 13 Jun 2026 12:52:38 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Sat, 13 Jun 2026 12:52:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1781369558;
	 x=1781455958; bh=KIvWt31S1eZCbOwVCaV3XwU9Zo5OvCqdLrU4wyDMEdM=; b=
	m82t3jvMlbAKcILSnWy8PYUITOx/NZyB6fJv/wkS4d4xNAtPOq7EqmwC7nCFjEkd
	fy1Vsi2cHZCCCv0Wkbbudnj7ekC89F887PAuqYSkfH66IO2S2drV1BJehZHv/nUz
	j0QcBxgZUKhfKyRR3zdMWQ4akAYkuSq44iMBiijHnsowBWEWKFL7k7eI/x4eIwpW
	+LmrunKEraiLgp+I+xdDjdAefa1BowDlfNot0B6zXLy5gY3KqHt5JL0q+E/sahMe
	QxKDHcNi+SdqihLkQe3v0YhnC0NVCGKwJ9x6HsxD3Fia2XCsopRtwV3L2fb7EsGC
	0MRQfzMPWzI7CiI0UsYbtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1781369558; x=1781455958; bh=K
	IvWt31S1eZCbOwVCaV3XwU9Zo5OvCqdLrU4wyDMEdM=; b=NHCeVU3lgXBDYYz1n
	47GROyWyZx1tcUUetM/oqwqVfDmw2qApwCx0stjdEpGtNbkX51KhQpKUBmhr+hq3
	UMPebxEGgZL7Pmr1K4OWa5OB++FWBt3GDXucnrrPCYXB4E6BZkyiUxzxU8e95s0e
	EDerpj+F5hk9cn6geCs26X5SBvtgDcBRtT4+HeHFoIqM7cQvsCNQLtCeIa7otd14
	5+Svv6hGwyv//TOsFYH0kXSCrZPbLPjTCehtOi5d+f9Ihzmqh28ozVb40xe+1yo6
	xXGVx267ldifTrEsDIXeYs2GsjnMHbOKuQjZ5FZ4FFMENqHtbKRiZERbOnTTaOpg
	sMQtA==
X-ME-Sender: <xms:1YotasAKM-ZfNTNjzrln3FAcAF3Lm2oGLqsBHuKbNclED5nymuOUlQ>
    <xme:1YotapXn8iPVJc0ky9mwes_gYycy0q_SV2VrJJDLwyAhwPSeVPcp3ZJ_l3xhVA-pC
    hFoFhAwu5-gG-9TcwNd_I42A870akJHqwL4fKVh8X3VIWJN--ZY>
X-ME-Proxy-Cause: dmFkZTGmKGdjDJhNNr5dMcfiQaQNVZINmhgjZOQO2zN8A9j0UhQB3cuSrcuBfqJ/IteJc5
    ntjNmdMZg/Da6G4a6qIG6be/GpnPQR6sAyXSlwaagja79g63KqEou0av6tsMnF9PVLzZw3
    sOU2Gvxd9doDgfWk5QRFxs4Blq0roBHFgPGUUQb4lykZfFgoJ5aIAFsMRWZO79jCBQ6Fza
    eFMq2XBAfCRvApFyQm1JUja3UjqEIo4/UYai+tNCMU+escwxRqqmLc7JB0U3+BtBobuVnT
    SsUYgzAI3ZAckquyvYDJLWlMZUAM960lQZPGqrzakIntiAh/uB8heEyqPBo/BB+hNbGXlG
    I9qNHKEo9jUj9KI159jUhT07clWkHn1fMYrlbt0YZxDezjEip0/YQ22hLjFXU5lrV/Hjq/
    BfdV4HmJt7Ibe3xiOeSr/oFnJtbJ8t1MKDyTXFZ6VTuPmSM7eW5eUGARCH1yOySKF/H39C
    4//i/2BBJJT8AK/bSgCtjYNAQ2pL1fAnkLwAWO3d9HCdJIgyGqdU3jk9xsFUHr9KEUwaPq
    Tab7SauA52qrVxGj/x4PT5AWxcTKwMlYR0/ryUoLfEWkCpfi/LoECzYgApEgOQyNzdeXut
    IVSfqfnfyog89Lp4d45iLX+iQuSfsMKYNv8umTPrsFU1Rx+kCHngap8Cnh0Q
X-ME-Proxy: <xmx:1YotauuhVbNpfHzYFBHWlfDGAxTJasuo1Losst8fvJYvTRvxJ21MNQ>
    <xmx:1YotahZcbYG6KAnU81U5XqKnCT8Ek5hKN1vLMLIvTj7uxfura9WSOw>
    <xmx:1YotahV3Wj7MhQald6zyrvEALmlgdorwmbY1tAG34s-40jcol29-ZQ>
    <xmx:1Yotal59dW5X1Pv-75BL02QqNnmXg1jr_VAVN7W0NeuuZvulFFYB4w>
    <xmx:1ootanxwf19cx0_QE5vbAm8gBIothbQVtgCP24WD1cUMMpUMFfqeaxK2>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C771A216008A; Sat, 13 Jun 2026 12:52:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AIJcFPqjnf5V
Date: Sat, 13 Jun 2026 17:52:17 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: Binarus <lists@binarus.de>, netfilter@vger.kernel.org
Message-Id: <f81bb631-3b65-4332-a076-4feae632ab13@app.fastmail.com>
In-Reply-To: <2b4db6cd-bc9b-47ff-99ee-7c15da7a343f@binarus.de>
References: <2b4db6cd-bc9b-47ff-99ee-7c15da7a343f@binarus.de>
Subject: Re: "nft list hooks" not showing the custom nat chains, and unexpected
 priority for nf_nat_ipv4_local_fn
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, 13 Jun 2026, at 5:16 PM, Binarus wrote:
> Dear all,
>
> I am still struggling with understanding the packet flow through the=20
> netfilter hooks and chains. Therefore, I have set up a very simple tes=
t=20
> scenario. Before listing the ruleset, a few remarks:
>
> The following relates to netfilter 1.1.3 with kernel 6.12.90 on Debian=20
> trixie. I had to modify the kernel to enable the hook listing, but=20
> that's the only change compared to a Debian trixie vanilla system.
>
> The test system has a ppp0 interface (default route / internet access)=20
> and a physical NIC interface (network 192.168.20.0/24, IP=20
> 192.168.20.249). The following ruleset is totally useless for any=20
> practical application, but I hope it's appropriate for investigations:
>
> root@charon /etc/network # nft list ruleset
> table ip t_IP {
>          chain output-route {
>                  type route hook output priority mangle; policy drop;
>                  ip saddr 192.168.20.249 ip protocol icmp meta nftrace=
 set 1
>                  accept
>          }
>
>          chain output-filter {
>                  type filter hook output priority filter; policy drop;
>                  ip saddr 192.168.20.249 ip protocol icmp meta nftrace=
 set 1
>                  accept
>          }
>
>          chain output-nat {
>                  type nat hook output priority 100; policy drop;
>                  ip saddr 192.168.20.249 ip protocol icmp meta nftrace=
 set 1
>                  accept
>          }
>
>          chain postrouting-filter {
>                  type filter hook postrouting priority filter; policy =
drop;
>                  ip saddr 192.168.20.249 ip protocol icmp meta nftrace=
 set 1
>                  accept
>          }
>
>          chain postrouting-nat {
>                  type nat hook postrouting priority srcnat; policy dro=
p;
>                  ip saddr 192.168.20.249 ip protocol icmp meta nftrace=20
> set 1
>                  oifname "ppp0" ip protocol { tcp, udp } masquerade to=20
> :61000-64999
>                  oifname "ppp0" ip protocol icmp masquerade
>                  accept
>          }
> }
>
> The goal is to investigate the flow of an outbound icmp packet that is=20
> locally generated. I believe that the above ruleset includes all pairs=20
> of hooks and chain types that exist for outbound local packets. I have=20
> included the "nftrace" line in every chain because I wanted to see all=20
> chains the packet goes through even in case I had totally misunderstoo=
d=20
> the order.
>
> But before the actual test, I looked at the output of "nft list hooks"=
.=20
> This is the result:
>
> root@charon /etc/network # nft list hooks
> family ip {
>          hook prerouting {
>                  -0000000400 ipv4_conntrack_defrag [nf_defrag_ipv4]
>                  -0000000200 ipv4_conntrack_in [nf_conntrack]
>                  -0000000100 nf_nat_ipv4_pre_routing [nf_nat]
>          }
>          hook input {
>                  +0000000100 nf_nat_ipv4_local_in [nf_nat]
>                  +2147483647 nf_confirm [nf_conntrack]
>          }
>          hook output {
>                  -0000000400 ipv4_conntrack_defrag [nf_defrag_ipv4]
>                  -0000000200 ipv4_conntrack_local [nf_conntrack]
>                  -0000000150 chain ip t_IP output-route [nf_tables]
>                  -0000000100 nf_nat_ipv4_local_fn [nf_nat]
>                   0000000000 chain ip t_IP output-filter [nf_tables]
>          }
>          hook postrouting {
>                   0000000000 chain ip t_IP postrouting-filter [nf_tabl=
es]
>                  +0000000100 nf_nat_ipv4_out [nf_nat]
>                  +2147483647 nf_confirm [nf_conntrack]
>          }
> }
>
> Now this leaves me totally clueless. Focusing on the output and the=20
> postrouting hook only (because I'd like to learn about these two first=
):
>
> 1.
> My own custom output-route, output-filter and postrouting-filter are=20
> listed. But neither the output-nat nor the postrouting-nat chain are=20
> listed; at their place, the respective internal netfilter functions ar=
e=20
> listed.
>
> I then have changed the priorities for these two chains (setting them=20
> to the shown value from the ruleset =C2=B11 each) in case the default=20
> priorities must not be used. But that did not change anything: The=20
> custom nat chains still were not listed in the output of "nft list=20
> hooks".
>
> Could somebody please explain where my misunderstanding is? In further=20
> tests, I have verified that these custom chains were indeed active, so=20
> why aren't they listed?

It is enumerating the hook functions registered by the Netfilter core. T=
he names of your nat chains are not shown because they are subordinate t=
o the nf_nat hook functions. In your case, the relevant ones are "nf_nat=
_ipv4_local_fn" for output, and "nf_nat_ipv4_out" for postrouting.

>
> 2.
> According to my research, the nat chain in the output hook is for=20
> source nat, not for destination nat, and therefore its priority should=20
> be 100, as given in the ruleset. The famous "netfilter hooks" graphics=20
> in the nftables wiki says the same, at least in my understanding.
>
> But "nft list hooks" says that the priority of nf_nat_ipv4_local_fn is=20
> -100, as if the nat chain at this hook would be for destination nat=20
> instead of source nat.
>
> Could somebody please explain which type of nat the nat chain at the=20
> output hook is meant for (snat or dnat), and if it is snat, why the=20
> priority is -100 instead of 100 as expected?

It is destination NAT (dstnat). To rewrite the source addresses of local=
ly generated packets, you would do it in your "postrouting-nat" chain in=
stead.

--
Kerin Millar
