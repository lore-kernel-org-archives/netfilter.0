Received: from achilles.binarus.de (achilles.binarus.de [168.119.77.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730D01EDA0F
	for <netfilter@vger.kernel.org>; Sat, 13 Jun 2026 16:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.77.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781367390; cv=none; b=O9UqZa/+z8aQdI1YLe90dfLp4xqUlEy2ddXUBLMSJiyNde7QUIpoROs65FIFR8CefK+mm8lSXb5JuFxreKvMIip7Xi/JdRW91eeFCJ85pwoVGWM6RSix88+WoyUjDq6FRf+f8VMsety9bUqFaFP0VybqzTXQtoBccWy5cfL+N7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781367390; c=relaxed/simple;
	bh=Li+jTC2Znnqo99fSnhY+oIVJFqzkuwwSX/vc8ezWCsU=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=pBfYI/0Ovg5oGynIGZBPGX7m7MKpW1VKvsbw5Kwr8eczOqIisFytejvntxdrgPJo9+CB02L2V45xeBvadtMo62AOZIsqaXtmMwt3YsMf/HgtE4wl97EhhquOH6ZhoIUF8GiFiLR/zD3VfpGP58bwCYakfZAxdQInix8UScwxWeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de; spf=pass smtp.mailfrom=binarus.de; dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b=AEUuxI8f; arc=none smtp.client-ip=168.119.77.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=binarus.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b="AEUuxI8f"
X-Envelope-To: <netfilter@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=binarus.de;
	s=b201601; t=1781367379;
	bh=Li+jTC2Znnqo99fSnhY+oIVJFqzkuwwSX/vc8ezWCsU=;
	h=Date:To:From:Subject:From:Reply-To:Subject:Date:To:Cc:Resent-Date:
	 Resent-From:Resent-To:Resent-Cc:In-Reply-To:References:List-Id:
	 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	 List-Archive;
	b=AEUuxI8fKU3rtCQ+aP/ig2cAaX2ehzVWgU/Vvu0LT1Kz8CFaQvSutsZIsWG3wO9s0
	 5r1MwHfKtkQJpcW+TajYfTm2I2SmZx3TlufnEbRDFBuMW46ICsdPz/EKbjkcrsFf5i
	 JH9EcUWlBUxgggzJUCQRuOyhDohTR44tdk32W1l3WhBYWe4ytYIHzLoBZQFhLYae3D
	 LX8IMwZGu0XZvX0+i7oYBuzKBWPZqAFoNh3v8RA0UjzerUC82rG0n/F4IeTiCaVsr+
	 DuofQKMhxxdFT2R1ep70hDTTSl9pd9nyZp26SPKgm7XYZ8BFXr9mQfqnPJLkkfE+qc
	 JmD1M7CPSa+KLDitZJY1TiY4BItIUzP2AnWCRU1QV1/2BiGTmW7wPuRdby5hRXVcuW
	 JADjpKcCSfVNaxxdcQHJdti/af6kyMx8txc6iCnWuqN41yK0dg62zDk9VlLTmVGxpL
	 OV/cVhQLI7vlGqX12EKjXvs2hSFb55M/1HqYmS4yLpgQ56/F9mDTu7NFuvTd/dW3Qs
	 zfHoDwFDuYsT330jLGslrFagcgHLK8eezNOHqCcKOCn8y4XvevxuubR2nX9U9cJU9y
	 CphQFff9Vow0onawaTwkXENVBqZqYgnqNo4axyS/3kCUjgME5jX7ut1ETiHmZbM2IY
	 AvrBt6KRnjRJGsJ0bOTHIveo=
Received: from [192.168.20.100] (pd95313d1.dip0.t-ipconnect.de [217.83.19.209])
	(authenticated bits=0)
	by achilles.binarus.de (8.18.1/8.18.1/Debian-6) with ESMTPSA id 65DGGILR1258635
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netfilter@vger.kernel.org>; Sat, 13 Jun 2026 18:16:19 +0200
Message-ID: <2b4db6cd-bc9b-47ff-99ee-7c15da7a343f@binarus.de>
Date: Sat, 13 Jun 2026 18:16:33 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Content-Language: en-US, de-DE
To: netfilter@vger.kernel.org
From: Binarus <lists@binarus.de>
Subject: "nft list hooks" not showing the custom nat chains, and unexpected
 priority for nf_nat_ipv4_local_fn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Bin-MAIL-FROM: <lists@binarus.de>
X-Bin-RCPT-TO: <netfilter@vger.kernel.org>

Dear all,

I am still struggling with understanding the packet flow through the netfilter hooks and chains. Therefore, I have set up a very simple test scenario. Before listing the ruleset, a few remarks:

The following relates to netfilter 1.1.3 with kernel 6.12.90 on Debian trixie. I had to modify the kernel to enable the hook listing, but that's the only change compared to a Debian trixie vanilla system.

The test system has a ppp0 interface (default route / internet access) and a physical NIC interface (network 192.168.20.0/24, IP 192.168.20.249). The following ruleset is totally useless for any practical application, but I hope it's appropriate for investigations:

root@charon /etc/network # nft list ruleset
table ip t_IP {
         chain output-route {
                 type route hook output priority mangle; policy drop;
                 ip saddr 192.168.20.249 ip protocol icmp meta nftrace set 1
                 accept
         }

         chain output-filter {
                 type filter hook output priority filter; policy drop;
                 ip saddr 192.168.20.249 ip protocol icmp meta nftrace set 1
                 accept
         }

         chain output-nat {
                 type nat hook output priority 100; policy drop;
                 ip saddr 192.168.20.249 ip protocol icmp meta nftrace set 1
                 accept
         }

         chain postrouting-filter {
                 type filter hook postrouting priority filter; policy drop;
                 ip saddr 192.168.20.249 ip protocol icmp meta nftrace set 1
                 accept
         }

         chain postrouting-nat {
                 type nat hook postrouting priority srcnat; policy drop;
                 ip saddr 192.168.20.249 ip protocol icmp meta nftrace set 1
                 oifname "ppp0" ip protocol { tcp, udp } masquerade to :61000-64999
                 oifname "ppp0" ip protocol icmp masquerade
                 accept
         }
}

The goal is to investigate the flow of an outbound icmp packet that is locally generated. I believe that the above ruleset includes all pairs of hooks and chain types that exist for outbound local packets. I have included the "nftrace" line in every chain because I wanted to see all chains the packet goes through even in case I had totally misunderstood the order.

But before the actual test, I looked at the output of "nft list hooks". This is the result:

root@charon /etc/network # nft list hooks
family ip {
         hook prerouting {
                 -0000000400 ipv4_conntrack_defrag [nf_defrag_ipv4]
                 -0000000200 ipv4_conntrack_in [nf_conntrack]
                 -0000000100 nf_nat_ipv4_pre_routing [nf_nat]
         }
         hook input {
                 +0000000100 nf_nat_ipv4_local_in [nf_nat]
                 +2147483647 nf_confirm [nf_conntrack]
         }
         hook output {
                 -0000000400 ipv4_conntrack_defrag [nf_defrag_ipv4]
                 -0000000200 ipv4_conntrack_local [nf_conntrack]
                 -0000000150 chain ip t_IP output-route [nf_tables]
                 -0000000100 nf_nat_ipv4_local_fn [nf_nat]
                  0000000000 chain ip t_IP output-filter [nf_tables]
         }
         hook postrouting {
                  0000000000 chain ip t_IP postrouting-filter [nf_tables]
                 +0000000100 nf_nat_ipv4_out [nf_nat]
                 +2147483647 nf_confirm [nf_conntrack]
         }
}

Now this leaves me totally clueless. Focusing on the output and the postrouting hook only (because I'd like to learn about these two first):

1.
My own custom output-route, output-filter and postrouting-filter are listed. But neither the output-nat nor the postrouting-nat chain are listed; at their place, the respective internal netfilter functions are listed.

I then have changed the priorities for these two chains (setting them to the shown value from the ruleset ±1 each) in case the default priorities must not be used. But that did not change anything: The custom nat chains still were not listed in the output of "nft list hooks".

Could somebody please explain where my misunderstanding is? In further tests, I have verified that these custom chains were indeed active, so why aren't they listed?

2.
According to my research, the nat chain in the output hook is for source nat, not for destination nat, and therefore its priority should be 100, as given in the ruleset. The famous "netfilter hooks" graphics in the nftables wiki says the same, at least in my understanding.

But "nft list hooks" says that the priority of nf_nat_ipv4_local_fn is -100, as if the nat chain at this hook would be for destination nat instead of source nat.

Could somebody please explain which type of nat the nat chain at the output hook is meant for (snat or dnat), and if it is snat, why the priority is -100 instead of 100 as expected?

Thank you very much in advance, and have a nice weekend,

Binarus

