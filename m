Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3627B3C4
	for <netfilter@vger.kernel.org>; Tue, 30 Jan 2024 19:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706643283; cv=none; b=PHub+rKX4sap5yaZI2Ci4vXXLp0zXZP9sq6Wf1vZzmSCcXZrO8ob07jVSCrFZx6Yk63AJcqmuzRr1ij4M5+xAJbjl6EO3SUQDKDzZIXK3M0TBcAVXQ9x5TaoXmU8oYEFgCzvrJHq2ISvDn5bzE5yS2cSsRe8Tj6JcJSAjQws8i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706643283; c=relaxed/simple;
	bh=CjrHkwqKsXmj4K4Pr5KN2E/DowgpSRiSWw0Dyt9T470=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=OFAypSQtD1mUC7/HxA9RvWKVRZsa+ODvsg1sV1MegnjRD3SkI+m11hf2Z603+9W4ywcAOt9njiJAhrkAK9SjkRrfmjj1w57dB8Oa4pLoUqAbSJ4bnPyxdjUw4nexpwqpkQckztqv5fsRvK5i5r3a3RMFBpbegeejBZhIjWKzTUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=ahllM36+; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=w/cnp7f1; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="ahllM36+";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="w/cnp7f1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Message-Id:Content-Type:In-Reply-To:References;
	bh=BYcuvcEgEKboUpTKym2+k0CFCt27UpWtU+SChTVYULo=; t=1706643278; x=1707852878; 
	b=ahllM36+M/3Yq5Lk79NiX5F6V/8urgrCY2ZywB3dj1mgWYIjT6MuyMsjKHOs6NQOxgLTg0DiIvX
	2XPEyehm7Yq+f2z0D8E5fUsUegj8RBlUpJ+Jf8nNH0icSeEfjgqNxuWRPUMJdk6LaznO0LuVj+x4B
	cw6QjfYo4paVowzv7b8=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Message-Id:Content-Type:In-Reply-To:References;
	bh=BYcuvcEgEKboUpTKym2+k0CFCt27UpWtU+SChTVYULo=; t=1706643278; x=1707852878; 
	b=w/cnp7f1XhNYQEmpWfzuVypq5xUhg3ycw89A/IEqf2bLS2rh9VA9g4qkwDHfk5plYRVLEGqQ/iA
	32guEe8zMDQ==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1rUtsQ-001cmd-2L
	for netfilter@vger.kernel.org;
	Tue, 30 Jan 2024 20:34:35 +0100
Date: Tue, 30 Jan 2024 19:34:30 +0000
From: Slavko <linux@slavino.sk>
To: Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
In-Reply-To: <eb589516-f7a2-4c17-81fc-fe2eecc6855b@app.fastmail.com>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net> <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com> <Zbj04V-90zpQwEzl@torres.zugschlus.de> <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com> <05FFEAEF-0123-4A2B-9607-B162D0AA6C61@slavino.sk> <eb589516-f7a2-4c17-81fc-fe2eecc6855b@app.fastmail.com>
Message-ID: <47667AAA-1B0B-4262-AC20-2F224B2BB092@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 30=2E janu=C3=A1ra 2024 17:57:21 UTC pou=C5=BE=C3=ADvate=C4=BE Ker=
in Millar <kfm@plushkava=2Enet> nap=C3=ADsal:

>It is easy to say that it is pointless if not the one to be responsible f=
or implementing and maintaining the code and trying to take into account di=
verse - and occasionally conflicting - user desires=2E There have been vari=
ous set-related bugs in nftables over the years=2E Complexity surely matter=
s to someone=2E There are multiple open bugs now that concern both performa=
nce and memory usage=2E Efficiency surely matters to someone=2E

Please, aproximate my English, it is far from good=2E=2E=2E

I mean mostly that, that IPv6 becomes reality, and soon or later (the late=
r
is IMO more realistic) will replace IPv4 at all, thus all L3 addresses wil=
l
become 128 bites long=2E Sure, here will be always penalty in using 128b
addresses in compare to 32b addresses, but world is (slowly) moving
to IPv6, thus that penalty is something, which cannot be avoided=2E

Debate these penalties sounds for me exactly as debate when 64b
OSs started=2E I remember "arguments" in that time -- twice of memory
consumption, twice of binary sizes, etc=2E=2E=2E While all these arguments
are (or can be) right, they are pointless, as IPv6 is here and is not
avoidable in future and we all should to learn to live with that, despite
if we want or don't want it=2E

>For it to improve, you could put forward a concrete suggestion as to how =
it might be improved, be it supporting logical disjunctions in rules, suppo=
rting a generic address type in sets or whatever else=2E

I am not able to provide real suggestions, as i don't speak C and i
have minimal knowledge about netfilter/nftables/kernel internals,
thus i can be totally wrong=2E

Anyway, i  have some ideas from user (admin) point of view, of
course=2E I can imagine this:

+ sets will store protocol agnostic L3 addresses and it doesn't
  matter (for me) if IPv4 will be mapped to IPv6 or these L3 sets
  will internally maintain two sets -- one for IPv4 and one for IPv6
+ nftables syntax will provide some sort of abstraction, as it already
  provides eg=2E for UDP/TCP ports (th dport), eg=2E "nh saddr" (nh as
  network header)
+ nftables will provide abstraction for ICMP(v6) types, something
  as it already provides for reject, to one can build common rule
  for both, including the one common set/verdict map -- for me
  it doesn't matter if it will internally map namex to protocol's proper
  values, or specific names must be prefixed eg=2E by ipv4 and/or ipv6

> That would, at least, be a step along the road to (potentially) convinci=
ng whoever is going to do the work that it is justified=2E

Yes, that was initial idea of my reply, we all (users, admins, devs)
have to provide own point of view and find best possible solution=2E

>On my part, and despite having been a user of nftables for many years now=
, I would prefer to see its QA and documentation improve ahead of - though =
not wholly at the expense of - new features being added=2E

While i played with nftables for years, i use it only on one of
my servers yet, and even this machine uses mix of iptables
and nftables rules (the real blocklists are still using ipset),
the ip(6)tables is used only to drop traffic, all other logic is
done from nftables=2E Nothing extra, just slightly more than
basic firewall, it uses sets to limit (per IP/net) logging,
connections, dynamic blocking, and every used set must be
doubled=2E=2E=2E

My nft sets doesn't contain huge amount of addresses, as long
time blocking is done by ipsets, with (semi) persistent and from
fail2ban (up some tens of days)=2E

I implemented it about year ago, and yes, the documentation
is hard to read=2E Most of it is ip family only, some parts are
hard to understand, and even more hard to combine together=2E
But i cannot be sure, if it is not by lack of my English=2E=2E=2E But
my feel from docs is, that they are exactly as my notes --
perfect for me, but hard to understand for all others ;-)

I found as very useful examples from announces in this ML's
archive=2E IMO these announces should be copied to (or be
linked from) the wiki=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
