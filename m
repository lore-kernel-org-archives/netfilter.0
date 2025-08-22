Received: from mail.dsg.is (mail.dsg.is [65.21.16.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94348248B
	for <netfilter@vger.kernel.org>; Fri, 22 Aug 2025 02:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.16.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755828463; cv=none; b=HJdf4nPMdygBGjOgwdXv3jR/GEisA+IO8XwYdY0KNJ9vQj9yfEhOu+5G/DJKJV7GehIv0SF0yXjfNhLb7eBEj0XQVUh1fedr3wydTdHhQhEE+oVQ6lig3F/Q0x7prcxFzztG8+3pKfWKBh/yHXSOAcBRUPPPIV3HvO45lQNBFpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755828463; c=relaxed/simple;
	bh=+AQzGnoVjTbAmoBoBH7n4gbIcFzDuZDBdlAh/LvLJfM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u6/p32adr4mnspV38uJ/cj0MLaJggK3wF8wHP1eIN4EA6EZPWUEo1EGsDw8J16qFSQkXniNcGQUzKlmPtn3Qhr0fdJ3UIVw2gt+BYq4lcpT8INjed42Upa96SIM5Mt4LMZNdoBASZZnGofLcwB4j/PfFxGQFpDu6nhlmkXn6EVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dsg.is; spf=pass smtp.mailfrom=dsg.is; dkim=pass (1024-bit key) header.d=dsg.is header.i=@dsg.is header.b=Wc5coe/o; arc=none smtp.client-ip=65.21.16.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dsg.is
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dsg.is
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dsg.is header.i=@dsg.is header.b="Wc5coe/o"
Received: by mail.dsg.is (Postfix, from userid 1000)
	id A5AA92005088; Fri, 22 Aug 2025 01:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=dsg.is; s=dkim;
	t=1755827937; bh=+AQzGnoVjTbAmoBoBH7n4gbIcFzDuZDBdlAh/LvLJfM=;
	h=Date:From:To:Subject;
	b=Wc5coe/otJLKNnBxiLXIbq7j3frkc9Jdk+6gAzsZr7wtIww8Cp3cspDgjGfp1f6aG
	 OKnF9kZ8zEYzuzUETs4O5YNdUe0pAVNiERKd+FQdWzM4+OnphTWbr05Et4TGjJXIDS
	 4TeS2dRRQt1Wqzr6uhROT72fAJ63x8Ltl7dH0Zrc=
Date: Fri, 22 Aug 2025 01:58:56 +0000
From: =?utf-8?B?RGF2w63DsA==?= Steinn Geirsson <david@dsg.is>
To: netfilter@vger.kernel.org
Subject: Hardware flowtable offload from multiple tables?
Message-ID: <aKfO4E3RwYl0hlIp@mailstore>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi all,

Please CC me on replies as I'm not subscribed to the list.

I've been trying to get hardware flowtable offload going on a ConnectX-6 DX
card. I have managed to create the flowtable (needed to create a SF interface
and apply the flowtable to that - using the PF directly does not work).

However, it seems that a device can only be referenced from one flowtable,
and the scope of the flowtable is only the current table. So if I have separate
`ip` and `ip6` table types, I can't do hardware flowtable offload from both. Is
my understanding correct? Are there any workarounds (other than changing
everything over to a combined `inet` table) available?

I can create either an `ip` or `ip6` table with offloaded flowtable, but doing
both gives "Device or resource busy" error: 
```
david@vyos01:~$ sudo nft add 'table ip test  { flowtable fttest { hook ingress priority 0; devices =  { en1f0pf1sf88 }; flags offload; }; }'
david@vyos01:~$ 
david@vyos01:~$ sudo nft add 'table ip6 test  { flowtable fttest { hook ingress priority 0; devices =  { en1f0pf1sf88 }; flags offload; }; }'
Error: Could not process rule: Device or resource busy
add table ip6 test  { flowtable fttest { hook ingress priority 0; devices =  { en1f0pf1sf88 }; flags offload; }; }
                                ^^^^^^
```

Thanks,
Davíð

