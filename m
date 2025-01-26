Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C0425A64F
	for <netfilter@vger.kernel.org>; Sun, 26 Jan 2025 09:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737883421; cv=none; b=BqW24uji70pF+Fjo4O96tb8RoZ82J5gcgparYoXwDhVhFlQG4vFRk4SP+RRzkvFqvm/uLU1lsCM3MYVEgtHyoHx7mbDCuSFc+Ipv0+TOjHDf7LzQCY5YoYg+JqrV3+nz2TPPk7GrQiCQp73WUQoeKl6Y58PaCdi3SOcO9ar222Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737883421; c=relaxed/simple;
	bh=leq7ETQaileYo1V7r0qfpQ1SJO74WLuhBm+3n9XpL6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2niDOI+DyRag5h5+3SU59dgpJleqg52vnyiSOhSjBewqdmwgdsRCyaOZdcjN+rO5M0x82xN+mjdA+ABfFkiR4dx0PGiKJ9YPphNGGRgeV5tkZi5Q0f+6PJoS94pHPK8wxO5Wbh3LqzTX9y/aW6FJC/Ji1cSQFH+XB9x28T+PHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=PeSuWkyA; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="PeSuWkyA"
Received: by shakotay.alphanet.ch (Postfix, from userid 1000)
	id B888C1241331; Sun, 26 Jan 2025 10:23:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1737883414; bh=leq7ETQaileYo1V7r0qfpQ1SJO74WLuhBm+3n9XpL6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PeSuWkyA+0GmC1CusQNz76XU+Su5jTmw6IuArgqsh3KTHnM3wlrOfUrKDhPUXRDfl
	 7tDl+8WtQLOM7ofhfZuvX201UVaqLJelYw0s7hB9peX4x2pMryNKwZG6RimUz8rwv3
	 D3SvMpTpIAI4IFz6CsEmqXOYuzJJ6O54+PEtMWR62hqOm/2W3x7qkJVAexXA0Yi2OP
	 2m7Q/ej4Pr6i9SqwjcHyM6tG3o7wZYrdBlfsn41RkdDiUpiggI3ZzCW1h/XAXxFZMh
	 v5AHlVcP6nyqqE1A/OeZ+OGeoYdPVBis1WvTNiX8MbjlGFUbB4SXYXLf+8hL9Oo7KD
	 vmtGBjsom0LeQ==
Date: Sun, 26 Jan 2025 10:23:34 +0100
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: nftables DNAT routes to wrong iface
Message-ID: <Z5X/FjHPPIHy/89n@alphanet.ch>
References: <Z5UJheaMk+bZsEFe@alphanet.ch>
 <o-Kdk2GAq901xVkHQ5Aru09OR2zTnTDL0Dl4V_SkKMgUtNUrTTgP_dBjqTs5qukem5k3sekFKj88zrlZYr_fzHCSaiNDq8i_7w9mz3dY1TQ=@protonmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <o-Kdk2GAq901xVkHQ5Aru09OR2zTnTDL0Dl4V_SkKMgUtNUrTTgP_dBjqTs5qukem5k3sekFKj88zrlZYr_fzHCSaiNDq8i_7w9mz3dY1TQ=@protonmail.com>

Hello,

On Sun, Jan 26, 2025 at 06:19:23AM +0000, Sunny73Cr wrote:
> > 193.72.186.128/26 dev enp2s0.300 proto kernel scope link src 193.72.186.130
> New reply (and now public): '193.72.186.128/26' does not cover all of
> '193.72.186.0/24', and some packets will not get routed.

Why should it?  The firewall 193.72.186.130 on which the DNAT is done is
connected to 193.72.186.128/26 because this is how the router
193.72.186.129 on the other side of the VLAN 300 defined that VLAN:

   193.72.186.128/26 dev enp5s0.300 proto kernel scope link src 193.72.186.129 

Indeed, the addresses 193.72.186.128 (reserved, subnet) to
193.72.186.191 (reserved, subnet broadcast) correspond to a
193.72.186.128/26 aka 32 - 26 = 6 free bit, so 64 addresses.

On the same VLANs there are other machines, such as 193.72.186.190 that
I used for my test.

BTW, those (193.72.186.129, 193.72.186.190) are ping-reachable from the
Internet (193.72.186.130 is currently down, as it is a test machine).
The setup works, it's just the DNAT that routes wrong for some
reason (I am an nftables beginner).  Do not try random connections to
those IP addresses (ping is ok), you might trigger the IDS.

The DNAT problem is that when a machine from 193.72.186.128/26 (e.g.
193.72.186.190 in the example) sends a TCP datagram on port 8080
of 193.72.186.130, this gets correctly DNATted to 192.168.202.10
port 80, however, then the routing entry:

> 192.168.202.0/24 dev enp2s0.202 proto kernel scope link src 192.168.202.2

is not respected, and the datagram is sent on enp2s0.300.

In another case, which is 46.140.72.218:8080 (on enp2s0.400), the DNAT
correctly works and sends to 192.168.202.10 on enp2s0.202.

As said in the mail, the reply packet won't work on 193.72.186.128/26,
that's expected (not default route, and no conntrack/mark set
yet), but it's the initial packet which is routed wrong.

Thank you & have a nice day.
