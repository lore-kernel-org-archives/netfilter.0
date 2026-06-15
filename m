Received: from achilles.binarus.de (achilles.binarus.de [168.119.77.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4003C0A15
	for <netfilter@vger.kernel.org>; Mon, 15 Jun 2026 13:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.77.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781531091; cv=none; b=tGQ84yQx0x3jDaJYo6LIZuL71/Jp5ijTo1CqQHURfJjbyausO09qGmT5W3sshyh5x37Nse1cjDbPKQQdeO4VkxKY33J/7mA2zEPDwHt5j5bFQj3Uxq1mSN+nWfP7noOOsPWHQbsAdYEwBwM6LRiPZwMsKX19ieCI7a6LAYq1hEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781531091; c=relaxed/simple;
	bh=zfgnpkkc3lVzbhlBpto27Rz5UN+/g2r5/eFTMcxBZuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qs9Flx5+dhUQjFK/fhnFsSG14+NK9qVevoYqeFBHhD+pFb4n83xxrNTZDug0Obbr/igIAhO3k+jA7AKWcbaUcek+4j/w76m1j33T0V0hD1Ic7xJKgcTH4AYiDP9a9w+4wOQOq/FuR8LgBbC8IKvYxEAkTxbPeiDFO84Ka0+Cp4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de; spf=pass smtp.mailfrom=binarus.de; dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b=ur5XY33w; arc=none smtp.client-ip=168.119.77.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=binarus.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b="ur5XY33w"
X-Envelope-To: <netfilter@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=binarus.de;
	s=b201601; t=1781531079;
	bh=zfgnpkkc3lVzbhlBpto27Rz5UN+/g2r5/eFTMcxBZuU=;
	h=Date:Subject:To:References:From:In-Reply-To:From:Reply-To:Subject:
	 Date:To:Cc:Resent-Date:Resent-From:Resent-To:Resent-Cc:In-Reply-To:
	 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	 List-Post:List-Owner:List-Archive;
	b=ur5XY33wKUhOCmkM5dz3N5Y54sRNiR0WmiH+ovb3zRx8j5IRWEpdlQSoG06lP0PLL
	 pcbLTcSHl7+swg9pFzEWrS6fjKEDxvtCpn3KoAnRRuPDvN3s/JWv5MS6ZiXU3PjClm
	 VmERXuy38kjNv0IAtiTIP7ZsdohbPGPQPlZrYC84626B0fADHxHSzES+F8LpIsdJGP
	 IkV7bQ0GBZhs5/AfSnoXRZ0isEYqK7CS8sS6HLiKJWy/+fa0K4QtzvHiTbp3TweCz2
	 99YSddjc9mYj3QiII/K1U0TmzVSM8kF9xce9CyguFf5ZPg/uE3LY0PQ+Ot93KMwQWR
	 iiswx+YdeniHltcUgSHOtzPd9gG2CkT81Xnp88r8664EQLTUnnNVQxer/I1c4Sla+M
	 fKE0CohaxwCxVy1f32DTAxK43qmcf/ZiRshnz9bN/cqFIyGCRaA5w2AxVIqPYwMF+u
	 5rCLCTX829eRWF20qlmittQIYYekeOnCkTXAdhxhWYoqSv9Xie5sI62lpNIBpv9sCI
	 K7hjzZobr5IVPFryJhVeNH/rc3JVKgbIV4Ylw0dXfQSbF06dZlICN29KkVEFe2oomh
	 pslpkW11hPwh7MPBTV9L1DyaPpWGJqoHhy1ChjZVzRjQkpcW8fjzMvGldyG8D4FUjQ
	 oy0BawTpi+DXiCW+QD+5W0ak=
Received: from [192.168.20.100] (pd95313d1.dip0.t-ipconnect.de [217.83.19.209])
	(authenticated bits=0)
	by achilles.binarus.de (8.18.1/8.18.1/Debian-6) with ESMTPSA id 65FDicqE1516543
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netfilter@vger.kernel.org>; Mon, 15 Jun 2026 15:44:39 +0200
Message-ID: <41f34484-1a51-4b94-81b5-99a22292b674@binarus.de>
Date: Mon, 15 Jun 2026 15:44:55 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: "nft list hooks" not showing the custom nat chains, and
 unexpected priority for nf_nat_ipv4_local_fn
To: netfilter@vger.kernel.org
References: <2b4db6cd-bc9b-47ff-99ee-7c15da7a343f@binarus.de>
 <f81bb631-3b65-4332-a076-4feae632ab13@app.fastmail.com>
Content-Language: en-US, de-DE
From: Binarus <lists@binarus.de>
In-Reply-To: <f81bb631-3b65-4332-a076-4feae632ab13@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Bin-MAIL-FROM: <lists@binarus.de>
X-Bin-RCPT-TO: <netfilter@vger.kernel.org>

At first, thank you very much for taking the time.

On 13.06.2026 18:52, Kerin Millar wrote:
> Hi,
> 
> On Sat, 13 Jun 2026, at 5:16 PM, Binarus wrote:
>> Dear all,
>>
>> I am still struggling with understanding the packet flow through the
>> netfilter hooks and chains. Therefore, I have set up a very simple test
>> scenario. Before listing the ruleset, a few remarks:
>>
>> The following relates to netfilter 1.1.3 with kernel 6.12.90 on Debian
>> trixie. I had to modify the kernel to enable the hook listing, but
>> that's the only change compared to a Debian trixie vanilla system.
>>
>> The test system has a ppp0 interface (default route / internet access)
>> and a physical NIC interface (network 192.168.20.0/24, IP
>> 192.168.20.249). The following ruleset is totally useless for any
>> practical application, but I hope it's appropriate for investigations:
>>
>> root@charon /etc/network # nft list ruleset
>> table ip t_IP {
>>           chain output-route {
>>                   type route hook output priority mangle; policy drop;
>>                   ip saddr 192.168.20.249 ip protocol icmp meta nftrace set 1
>>                   accept
>>           }
>>
>>           chain output-filter {
>>                   type filter hook output priority filter; policy drop;
>>                   ip saddr 192.168.20.249 ip protocol icmp meta nftrace set 1
>>                   accept
>>           }
>>
>>           chain output-nat {
>>                   type nat hook output priority 100; policy drop;
>>                   ip saddr 192.168.20.249 ip protocol icmp meta nftrace set 1
>>                   accept
>>           }
>>
>>           chain postrouting-filter {
>>                   type filter hook postrouting priority filter; policy drop;
>>                   ip saddr 192.168.20.249 ip protocol icmp meta nftrace set 1
>>                   accept
>>           }
>>
>>           chain postrouting-nat {
>>                   type nat hook postrouting priority srcnat; policy drop;
>>                   ip saddr 192.168.20.249 ip protocol icmp meta nftrace
>> set 1
>>                   oifname "ppp0" ip protocol { tcp, udp } masquerade to
>> :61000-64999
>>                   oifname "ppp0" ip protocol icmp masquerade
>>                   accept
>>           }
>> }
>>
>> The goal is to investigate the flow of an outbound icmp packet that is
>> locally generated. I believe that the above ruleset includes all pairs
>> of hooks and chain types that exist for outbound local packets. I have
>> included the "nftrace" line in every chain because I wanted to see all
>> chains the packet goes through even in case I had totally misunderstood
>> the order.
>>
>> But before the actual test, I looked at the output of "nft list hooks".
>> This is the result:
>>
>> root@charon /etc/network # nft list hooks
>> family ip {
>>           hook prerouting {
>>                   -0000000400 ipv4_conntrack_defrag [nf_defrag_ipv4]
>>                   -0000000200 ipv4_conntrack_in [nf_conntrack]
>>                   -0000000100 nf_nat_ipv4_pre_routing [nf_nat]
>>           }
>>           hook input {
>>                   +0000000100 nf_nat_ipv4_local_in [nf_nat]
>>                   +2147483647 nf_confirm [nf_conntrack]
>>           }
>>           hook output {
>>                   -0000000400 ipv4_conntrack_defrag [nf_defrag_ipv4]
>>                   -0000000200 ipv4_conntrack_local [nf_conntrack]
>>                   -0000000150 chain ip t_IP output-route [nf_tables]
>>                   -0000000100 nf_nat_ipv4_local_fn [nf_nat]
>>                    0000000000 chain ip t_IP output-filter [nf_tables]
>>           }
>>           hook postrouting {
>>                    0000000000 chain ip t_IP postrouting-filter [nf_tables]
>>                   +0000000100 nf_nat_ipv4_out [nf_nat]
>>                   +2147483647 nf_confirm [nf_conntrack]
>>           }
>> }
>>
>> Now this leaves me totally clueless. Focusing on the output and the
>> postrouting hook only (because I'd like to learn about these two first):
>>
>> 1.
>> My own custom output-route, output-filter and postrouting-filter are
>> listed. But neither the output-nat nor the postrouting-nat chain are
>> listed; at their place, the respective internal netfilter functions are
>> listed.
>>
>> I then have changed the priorities for these two chains (setting them
>> to the shown value from the ruleset ±1 each) in case the default
>> priorities must not be used. But that did not change anything: The
>> custom nat chains still were not listed in the output of "nft list
>> hooks".
>>
>> Could somebody please explain where my misunderstanding is? In further
>> tests, I have verified that these custom chains were indeed active, so
>> why aren't they listed?
> 
> It is enumerating the hook functions registered by the Netfilter core. The names of your nat chains are not shown because they are subordinate to the nf_nat hook functions. In your case, the relevant ones are "nf_nat_ipv4_local_fn" for output, and "nf_nat_ipv4_out" for postrouting.

Thank you very much for the explanation. Then that's obviously also the reason why changing the priority didn't change anything.

I suppose that netfilter still takes the chain priority into account when calling the subordinate chains. That is, the nat hook functions are always at the same priority, but in turn call the registered subordinate chains in the order of their priorities. Is this correct?

> 
>>
>> 2.
>> According to my research, the nat chain in the output hook is for
>> source nat, not for destination nat, and therefore its priority should
>> be 100, as given in the ruleset. The famous "netfilter hooks" graphics
>> in the nftables wiki says the same, at least in my understanding.
>>
>> But "nft list hooks" says that the priority of nf_nat_ipv4_local_fn is
>> -100, as if the nat chain at this hook would be for destination nat
>> instead of source nat.
>>
>> Could somebody please explain which type of nat the nat chain at the
>> output hook is meant for (snat or dnat), and if it is snat, why the
>> priority is -100 instead of 100 as expected?
> 
> It is destination NAT (dstnat). To rewrite the source addresses of locally generated packets, you would do it in your "postrouting-nat" chain instead.

Again, thank you very much. This explains a lot of other results that were unexpected to me. There is not much material out there that relates to output-nat, and some of that material is obviously wrong. (Most of) the sources I have come across stated that output-nat is for srcnat. Your correction of that mistake is highly appreciated.

I already had a slight suspicion of that kind, because I had noticed that nft complained about an error when I replaced the literal priority value 100 by the symbolic constant srcnat. However, when I used the symbolic constant dstnat instead, there was no error message.

Best regards, and thanks for your answers to many other posts on this list as well,

Binarus


> 
> --
> Kerin Millar
> 

