Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243B215A490
	for <netfilter@vger.kernel.org>; Thu,  1 Feb 2024 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706784652; cv=none; b=U6Qk5WRSRnMG+NtJ0wpKcZL+9S/QxmaOWPmg6wQVDJPVjn+9A6M7caovIgAAXTxHcDARNqTtXZQhu34NE1ybr3hcpAax6nTh7qGLw8HRUYsd6gmv+YqNWCZ0FTMEd9O4p7CSSrEkS9uLfxbGHL/ALTc+ir+mLh2WajUwexHQuQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706784652; c=relaxed/simple;
	bh=bAmviGox+YLLXiiM8bh31EpsiLOctsO8HsKl8L0tpQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GbJg+qruAagoFJGMaRRAwPE/ZyKJdA5+yU9Qo9YP4MxSUnfaIOwVVJzYKWI8Lzrone5PhvNQrhWlvQn3jf5RI0dfTX+wkD9JZRzEOFvazwp8w87Z3/BrQfPTmLkNTXQbgEnCAt/Cvq32l6SUr3NZ4eXRHBxRUwAUZIiLx00YA98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=q0p3nKe3; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=VdKNQZUk; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="q0p3nKe3";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="VdKNQZUk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:In-Reply-To:Autocrypt:From:References:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Message-Id:Content-Type:In-Reply-To:References:Autocrypt;
	bh=K5tvenq4KWR4Ij5xxEtpBgXljlbCbreSpbsMxB2d4V4=; t=1706784648; x=1707994248; 
	b=q0p3nKe3gIL/Qej7sTK2F7Zy+qysEnNkGPwzWG2eOdzx4Rri1/XTciB04wToHQM7iPRMBnWphIb
	7RYzy/tNANVlDmh5z5fSKIZN5zzsnTcEYaLuLpgS8qzxiluBRe3FIb64o1FFjzfv6JJsv/Hvk7RhD
	8xLhOitLkKGKqbJgs5E=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:In-Reply-To:Autocrypt:From:References:
	To:Subject:MIME-Version:Date:Message-ID:From:Reply-To:Sender:Subject:To:Cc:
	Date:MIME-Version:Message-Id:Content-Type:In-Reply-To:References:Autocrypt;
	bh=K5tvenq4KWR4Ij5xxEtpBgXljlbCbreSpbsMxB2d4V4=; t=1706784648; x=1707994248; 
	b=VdKNQZUk3Dzybic+L0UX62J0v2vYKwBEeppw2753/i8oCGmXuNFaUeRZzTbVNW9CoV0bAuhVYuX
	3jADPlnT/Cg==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1rVUea-0005U9-1Z
	for netfilter@vger.kernel.org;
	Thu, 01 Feb 2024 11:50:44 +0100
Message-ID: <75cb1437-0fdb-4599-aa8e-9f12fdf6057b@slavino.sk>
Date: Thu, 1 Feb 2024 11:50:43 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Combine ipv4 and ipv6 in a set
To: Netfilter list <netfilter@vger.kernel.org>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
 <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
 <Zbj04V-90zpQwEzl@torres.zugschlus.de>
 <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
 <Zbom4bTPnkTMbLNE@torres.zugschlus.de>
 <5f76a328-4018-43c7-9f4a-86a1e2a4a94c@app.fastmail.com>
 <83255444-F0BF-4340-B721-976AC8E5B6AC@slavino.sk>
 <20240131221012.289b2a17152cbcae39132ab1@plushkava.net>
Content-Language: sk, en-US
From: Slavko <linux@slavino.sk>
Autocrypt: addr=linux@slavino.sk; keydata=
 xsBNBE2fIMwBCADjOr4MY1rKxZnb4hsEdYBDFIHhZO9U3iLN/rNWSFKh3LeERd3Bu5gMz7Hk
 kn0nsoV2ijRKTLlXE0yzUtoJL+8WdNdWONt//cYcl8Z9V80uGFWfL6h0XWlqlup4XLTPZYz9
 7f/k1UsTltiIWd5hK6JU+PA6bFVO3ogq9Nx6ru6pNzQtx6D7D5ND9/4rN45MIYolEMMC2/1J
 bvM8PFdwB+QmJbj2fKb7jboKFS34VrUQ9xsVJske9/lC0MTWN1HT+dFiXvvue7TmwOgBAd/B
 24eGPVtcA2D13IRqhItDTS1DtacnzY3Okx/OEMdUIhjqKCBUGHeP22SagvAaKi8UYBBrABEB
 AAHNIVNsYXZrbyAoTGludXgpIDxsaW51eEBzbGF2aW5vLnNrPsLAeAQTAQIAIgUCTZ8gzAIb
 AwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQg/mquDkYjbYGXAf9FbEfo0wF7hfYgqll
 CfNSoCcGcj1WkqqXD0kkAY/5wIFTbOOtrGn7TijhuFu9aIzjd+K+3Q9tk4Tt6MSg9ibp25b2
 HLZPp8UiyPLeE0BAWFgAgtOrrIDg8VkvjfO2jSJjkHhHOWVP1xZYSlApNNhU1KUit7RE0ueV
 bWG45a8ONSp+eNCSHkgMC8VtoF3oMegi0rgFUXSdiEsZlrpXo0Q7HPFObg2ElTC9QgFr6Lmh
 uw6I+BvXE0arwa+4ndcesb5pV6TDONOrihgYvZIyZ6V4Bgnt9C6lvK1Y/e62W73YBAEIvQo7
 j90m0lrBEAMhUhj4aGooeJQ2b/aXkrBwc+9vos7ATQRNnyJKAQgAp8mP9O2fH0KnS1yJzAz+
 7fAM8dxFJbagFkv5ljvQ/qkEYh4uI+hWjgV7ok9+9kuzFiHbv8nczhcMr/J0JX4kok/5B5B4
 QuBdCXAoeAiWaPB4V6peLXheJKsBbBP/wNAFthJitt4P5XXrZbL4hv4+5Vm/uYXXYdQczGYa
 2UGMVZxYyH1wh3Ywfk2c4RvPfxfe7Q8pdvpK8U+mKKVDQ6kaTEJXB4EGkp80ncpEDmJEzqvj
 svKoHHruMUnuJdNkuKvE/knpiOw9jbifIkTQfLEJKgmJE6OpgQ5SEJpGBtCTEJr9Wo1l38ji
 6ujrUZyjBerdcucsXOKXk3n8mJhy4pshfQARAQABwsB8BBgBCAAmAhsMFiEEz0au30POX8OO
 zaE5g/mquDkYjbYFAmACuOoFCRY5xCAACgkQg/mquDkYjbYddAf/SWvH2Z5J23ZNqxpdORYU
 jUyHISTo3WaO0k72VdIHJqCHR+XSerysTyuBO4mf8SYQ2VpkIVLbOfxLKoHNt7jeVa+bjVki
 OFCjRPFhn3K+CVPwK45gvDqaAzQI4FAf2zCtdD0Zt44rwkb2e7RP7kGcI5EirVpU14bDk71g
 lE2JSezwkRYU+4ZUrDo9tGcUzJYjwHMvLXR5+yRIV+gqea1nb6871CtKh1w00X2VUXjDBtXo
 xSAd+NoTI57gwlnQOavvaITo8eGAnpSx9qA2k25uSVH76dn8KpL6O3b9MWfGn4o2KbA+3Cpg
 taCpoGgpKB7I+cQ4VywRYFH9rEMRgmr9Kw==
In-Reply-To: <20240131221012.289b2a17152cbcae39132ab1@plushkava.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dňa 31. 1. o 23:10 Kerin Millar napísal(a):

> This has also annoyed me on several occasions. Though I have been using nftables for a fairly long time, I still find it more natural to organise rulesets based on the conventions of iptables. Old habits die hard, as the saying goes. Incidentally, there is an open bug concerning this.

Perhaps you know that, but IMO it can be useful for some...

IMO the root of confusion comes from fact, that both (iptables/nft) uses 
the same name -- "table". I don't want to discuss if it was or wasn't 
good decision, as it doesn't matter, it is only name.

In iptables table more or less defines chain's hook priority:

    CHAIN => hook type
    TABLE => hook priority

In nftables one have (can) to define hook type and its priority by self, 
thus that purpose of ipt TABLEs is gone and main purpose of table 
changed to define family (and group objects) and name it.

I fight with that hook's priorities for long time, i was not able to get 
it, until symbolic names for priorities was introduced. And after math 
can be used in its definition (eg. filter + 5) it is really simple now. 
Great job.

>> BTW, i am curious, how big difference (in performance/time) is to
>> search IPv4 vs. IPv6 address in set? Is it worth to consider?
> 
> I do not know but I would expect a lookup to be very efficient in both cases.

I know only very little how ipsets stores items internally, mostly only 
that it uses hashes and tries, and i know nothing about sets. I know, 
that these tries are efficient way to search in large datasets, with 
near to constant search time. But if someone complains about performance 
(IP vs. IPv6) of ipsets/sets, there must be difference. The question is, 
if it is important/significant.

> I haven't paid much attention to memory usage. Benchmarking performance is fairly straightforward with the use of the shell, especially bash because it offers some useful features such as:

I mean performance in packet flow, how long it tooks to find (or not 
find) match or update/add from FW rule with ipset and with set, if both 
uses the same dataset size. If size of ipset/set matter, etc. Will be 
measured command time the same for particular action as from packet 
flow? That comparison will reveal, if sets are real replacement of 
ipsets in all (or most) cases or not. Or will be adding/removing item(s) 
from command line time the same as from packet flow? (IMO not, as 
command invocation plays role too)

BTW i recently realized how important can be command time, first some 
attack (which fills ipsets with thousands IPs), then kernel update, thus 
restart was needed, and it reveals how inefficient way fail2ban uses to 
restore ipset bans :-D But that is not nft related (and it was short 
time shock)...

> You might find it interesting to look at existing issues concerning the use of sets by visiting the following link.

thanks, i will check them from time to time...

> Of those, #1584 concerns "high memory requirements", where Pablo appears to be using https://valgrind.org/docs/manual/ms-manual.html to profile memory usage.

I meet valgrind only two or three times, related to some bug finding, 
but i got full guide from devs (do that, run that and post that or so), 
without understanding what i am doing...

Ipset shows in output (list) how much memory particular set uses, can i 
get that info from set listing (to compare)?

-- 
Slavko

