Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473B22045B7
	for <netfilter@vger.kernel.org>; Fri, 10 Oct 2025 17:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760118328; cv=none; b=o7HuHiSVSAfiYixtMBLUlt7+ht4ScjIAa7pAT2mdrSexuW8ChLu6mDFA3RIZ6KdkyC3LkMhneJF38JwSgZLeMhhhKpjpU6Gqn1187IeG37oVljXVd3UiBVK9WpvjxkkwhQ+xXKU2OUr1fsSbO9aaDRmvGoL9ROBNdPO0iGrNwjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760118328; c=relaxed/simple;
	bh=fTK84StSDEgcpYsuRrH7QWEm4zF/KRpD2NeQzuVbS8s=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=hXaaxYR9a76MynoyCiW1WkFl9cbKK969Tbg4zthILsi9fONhBEQa76dx+5QscZIbIzuYEA36Yjbqbl4wb/xmgpK5M3TLLClG9wBWNi/Jk6rdMfzPMDhqj+Nm3QdX1eJeALxk4wwRe3ab0+llTN5Gn5NXlwjYlmxLl6/Hs4MDk5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=OlKUNwjy; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="OlKUNwjy"
Received: from zimbra62-e11.priv.proxad.net (unknown [172.20.243.212])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 520342003EE
	for <netfilter@vger.kernel.org>; Fri, 10 Oct 2025 19:45:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1760118324;
	bh=fTK84StSDEgcpYsuRrH7QWEm4zF/KRpD2NeQzuVbS8s=;
	h=Date:From:To:Subject:From;
	b=OlKUNwjyxulMx9F4px+0YrikmsPfk+kyP8s9V+jCl8WsuoesOKucwA++dSjXnB0uH
	 wDtLa8lGVivP6fi4UIpVjDx1tlqL7MC1lZaHtnB2nEoeKKAq+XARYbwSj4dvyc5nnj
	 +mMeQCNiaaFYVgPgdyutS0j5fELWzagNw7pGoc1ICg2E51KT1arDVSUhzsBssYPUlz
	 jboN6gIDvfIk9UB5uPTj7F/y+YulbCC4nN1ilEjIIPJpMEfGKNbgQvHHSWfJ7Lny86
	 wlQjOTTGXe+UH9d2sLUlNSa3CsafZobbB60cnEuUOKot5ib52+iI4Bd7krDZGwyMhD
	 1FUU27NImfz6Q==
Date: Fri, 10 Oct 2025 19:45:24 +0200 (CEST)
From: "Antoine C." <acalando@free.fr>
To: netfilter@vger.kernel.org
Message-ID: <2145964596.1381722050.1760118324261.JavaMail.root@zimbra62-e11.priv.proxad.net>
Subject: Rule with double check ignore with 802.1Q packet
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 7.2.0-GA2598 (zclient/7.2.0-GA2598)
X-Authenticated-User: acalando@free.fr

Hello,

I found a weird behavior with NF tables. I am trying to filter specific packets and I cannot understand what is going on in the following case. It looks like a bug, but I do not know NFT very well so I prefer to ask first.

I am using 2 virtual interfaces veth0 and veth1 on Linux:
Linux sopvubu22-214d 6.8.0-64-generic #67~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC Tue Jun 24 15:19:46 UTC 2 x86_64 x86_64 x86_64 GNU/Linux

Interfaces were created with:
ip link add veth0 type veth peer name veth1


NFT were configured with the following script:
---
#!/usr/sbin/nft -f

flush ruleset

# INPUT Filtering
table netdev tb_in {
    chain ch_in {
        type filter hook ingress device veth1 priority 100;
        nftrace set 1
        ether saddr AA:BB:CC:DD:00:38   log prefix "--test 1-- "
        ip saddr 192.168.140.56         log prefix "--test 2-- "
        ether saddr AA:BB:CC:DD:00:38 ip saddr 192.168.140.56 log prefix "--tests 1&2 -- "
        ip saddr 192.168.140.56 ether saddr AA:BB:CC:DD:00:38  log prefix "--tests 2&1 -- "
    }
}
---
Then I send this specific packet:
echo AA BB CC DD 00 50 AA BB CC DD 00 38 81 00 28 48 08 00 45 00 00 1C 00 01 00 00 40 11 E0 F6 C0 A8 8C 38 C0 A8 8C 50 1D 89 1D 83 00 08 2A F8 | xxd -r -p | socat - INTERFACE:veth0

And I get the following log:
trace id 5235f40e netdev tb_in ch_in packet: iif "veth1" ether saddr aa:bb:cc:dd:00:38 ether daddr aa:bb:cc:dd:00:50 vlan pcp 1 vlan dei 0 vlan id 2120 ip saddr 192.168.140.56 ip daddr 192.168.140.80 ip dscp cs0 ip ecn not-ect ip ttl 64 ip id 1 ip protocol udp ip length 28 udp sport 7561 udp dport 7555 udp length 8
trace id 5235f40e netdev tb_in ch_in rule meta nftrace set 1 (verdict continue)
trace id 5235f40e netdev tb_in ch_in rule ether saddr aa:bb:cc:dd:00:38 log prefix "--test 1-- " (verdict continue)
trace id 5235f40e netdev tb_in ch_in rule ip saddr 192.168.140.56 log prefix "--test 2-- " (verdict continue)
trace id 5235f40e netdev tb_in ch_in rule ip saddr 192.168.140.56 ether saddr aa:bb:cc:dd:00:38 log prefix "--tests 2&1 -- " (verdict continue)
trace id 5235f40e netdev tb_in ch_in policy accept

What is very strange is that the "test 1 & 2" is failing, despite being exactly identical, apart the order, to other tests. I get the same log with 'dmesg'.

The packet sent can be decomposed in (ether + vlan + ip + udp) headers but no data. And if I remove the vlan part (81 00 28 48), it works.

Is it a bug or do I miss something ? Maybe it has been corrected in a newer kernel version?

Thanks for your help,
Antoine


