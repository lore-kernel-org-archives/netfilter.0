Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8358E2192F5
	for <netfilter@vger.kernel.org>; Tue, 22 Apr 2025 08:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745311780; cv=none; b=Ha2WPqPYyR01BDjciVomfgYnna8okM7jaB6AsRrcqU39MEaSjLUEbq/JSBV9O7Si05QSn5rFma0QKgNU4cdJm6B4V07s9xTWmFcXrhAgbIuMBt8PK2az9wtR8mTe9NuuEK6CmEsdukoQVotTUP1prxYlQUH5g/3uwBa+LZAwWjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745311780; c=relaxed/simple;
	bh=GiRUhb9t5Yk3pKSd4LXG+TgdFS+GYr3gwoxm7icm8+0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=JHd2ErUPnWU0tfJtdhQvMGVvfVHeg9XwmcL1OgDA94dNGth4vYe/3gZr9fxZtzbQgbexD6epOThwusucOzisW1dDTJujwHZZIlkHu4TyVg9ZlrFlR3BKtDDulAHWuIM8tvncHqWcB7ofpYPy1cpNi2Q1hme7ocTPZRjOVnFroXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=nv6w6Keu; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=mm7ngCak; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="nv6w6Keu";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="mm7ngCak"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:From:
	Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:Content-Type:Message-Id;
	bh=rTonLWJil0Rzd/34RkQ/uKVXRAKdfzWXEcm8bmAfxNw=; t=1745311775; x=1746521375; 
	b=nv6w6Keui+iPZ1P2MONp5M/0bcUWwa+F7jWzLUcFDXvRbP8NugbdjiJnEa6xqB/NtFbsbYx5PeF
	d2QVtoMhMAjjUQbp80lQzQ7Tx1eahAn6xHZ8O3nc/lgBuGmU2cfnnGvW/tj7RvcsU+7nACoTQLVqZ
	WQ/UBNud9l/iVsUKLnE=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:Message-ID:Subject:To:From
	:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:Content-Type:
	Message-Id; bh=rTonLWJil0Rzd/34RkQ/uKVXRAKdfzWXEcm8bmAfxNw=; t=1745311775;
	x=1746521375; b=mm7ngCakIGZ8w0mFDk9edzDH25SKh7W4ZjvucSvPq+Ofp+fUTQL0jkvq/MtJN
	4jUHrpFIBntRPaZdDAUgW1TBw==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1u79Jl-000rMb-1c
	for netfilter@vger.kernel.org;
	Tue, 22 Apr 2025 10:49:26 +0200
Date: Tue, 22 Apr 2025 08:49:23 +0000
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
Subject: nftables RP filter and loopback
Message-ID: <905173BB-6745-4B59-8795-F9AC1E063A38@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all,

i encounter strange problem with reverse path filter in nftables,
which i don't understand, thus i ask for help=2E

Some background -- for long time i have on my desktop (with
some bridges/veths for LXC, VirtualBox ifaces, and one dummy
iface) this prerouting chain (to shorten it i removed counter and
log parts):

    chain r_prerouting {
        type filter hook input priority raw; policy accept;
        iif "lo" notrack accept
        fib saddr type local fib daddr type { broadcast, multicast } accep=
t
        fib saddr =2E iif oif missing drop
    }

That works as expected, but recently i start to play with tproxy
(not related) and in these experiments i deleted the "lo =2E=2E=2E accept"
rule and then the last rule ("fib =2E=2E=2E drop") starts to drop packets
to localhost, including the 127=2E0=2E0=2E1 -> 127=2E0=2E0=2E1 (the same
happens with IPv6)=2E

The host has Debian with kernel 6=2E12=2E22 and nftables 1=2E1=2E1=2E

While i can imagine, that it can drop traffic to local (non loopback,
192=2E168=2E10=2EX in my case) IP, as it is routed through "lo" but
configured on "br0" (bridge in my case), but i din't play with
that as it drops loopback addresses too=2E I log these drops, thus
i see in log, that traffic is really 127=2E0=2E0=2E1 =3D> 127=2E0=2E0=2E1,=
 the
tcpdump shows SYN packets without response (on any iface,
to be sure) with the same addresses=2E

I search on Internet, and i found only one related thing -- the
iptables rpfilter module's manpage mentions, that it never
match on loopback traffic, but nothing nftables related=2E I
don't see the same note in nft manpage, nor on wiki=2E

I verified that couple of my initial assumptions was false:

+ my first idea was, that lo iface has index 0, but it has 1
  (of course)
+ my second idea was, that i mess routing table by some way,
  but "ip route get 127=2E0=2E0=2E1" shows that it belongs to "lo"
+ the tproxy is not related at all, the problem persists without it

Of course, when i add accept "lo" traffic before fib drop,
it works again, or when i add local to accepted fib types it
works too=2E Here i stop to do more assumptions and decided
to ask to i can understand what happens=2E

Please, is it feature of "fib saddr =2E iif oif" rule and "lo" traffic
or i miss something?

regards

--=20
Slavko
https://www=2Eslavino=2Esk/
