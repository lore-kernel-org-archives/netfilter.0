Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AAB2C80
	for <netfilter@vger.kernel.org>; Sun, 26 Jan 2025 06:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737872211; cv=none; b=AYSR5LP4loJ5wFZdhC3wKEAuX+LbWMzSnBaHLWNAioGdQaeeTWtzzh65N9oTF1DEdhIwofeX+hIugfjKUpyNru4SOXm4a+Wg85+jtuHE+1iPCty8j6iVf/O78I+dAYTkgT6Z4rekHAfVGqbmFewrCsuDPf+3XCiRlssEtsY8dK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737872211; c=relaxed/simple;
	bh=+mEYXvv+sRyTZS8J/k48GVRKa99HMscSfAO+m7s3EZI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YhfithWLorY96KDYcLUy278EBjNuwJty7c/bLpS5slOANf7Q1L20y7jb38YivLXNxXpmNunigstzJxwFYCwOrRon+Y3zOxTIiBnUplynZHA4EMxsZweUObPGZGQpYa093CasT4klQeq/Icf1QMMs55g8FNDnviXC0dV/f3G06bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=b0O4w/GG; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="b0O4w/GG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1737872201; x=1738131401;
	bh=+mEYXvv+sRyTZS8J/k48GVRKa99HMscSfAO+m7s3EZI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=b0O4w/GGuaivx7ZN2Vi+QbcdKDGURBWovFJqDR03UDwt7cnnfVselj3k05YfHi0Px
	 A5fJypjgWVGY970oprxyfY+2x5sg8ekLNidQisXOTMARqRqAXooqaQ62lsR9/9y6p/
	 DgIOdbgMRlREkWscW5x3tEc1iUGBTxtaFYf3MXoCnGPvrCOfmdMyoPuZuARLLfsE4g
	 ZwhYQzXsg348mDqh97Tn/VkI8gFr/nzMuQtldQqDwdm+D3j8DRXonSTEJAe8EPRuTe
	 DtW7zN44RMcKnVZl8JW45Vxq0uYfqBPMbDPPYrdOwi78oUxNPxTTM0Wmx3c8TVbg/B
	 gTeZLGYSAYuOg==
Date: Sun, 26 Jan 2025 06:16:40 +0000
To: Adam Nielsen <a.nielsen@shikadi.net>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: DROP rule is ignored for multicast traffic, but only via Wireguard
Message-ID: <p9JEctPurB2u2xYPmntE0hNiDEwwfhZmyGEnYlpmmE2PQcHHwlNFwgbXJSMMEdMNlScN27ILZ9XOuxKkEkBsWonEg_r1GNHn68Kb7_Ft76E=@protonmail.com>
In-Reply-To: <20250126012028.2a3f1428@gnosticus>
References: <20250126012028.2a3f1428@gnosticus>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: c4348e72ac749fd210215e2a59817a8f73806be2
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

- Note: I am re-replying, as I responded incorrectly. My reply should now s=
how on the mailing list.

> is there just something going on here that I'm
unaware of?

I am uncertain, but consider that it is possible that the kernel is routing=
 based on Ethernet destination address.

You could try blocking destinations that match IP6 multicast MAC addresses.=
 To quote 'IANA Ethernet Numbers' (I forget the proper name for the documen=
t): "As described in <xref type=3D"draft" data=3D"RFC-ietf-intarea-rfc7042b=
is-11"/>, 48-bit MAC addresses
in the range 33-33-00-00-00-00 to 33-33-FF-FF-FF-FF are used for IPv6 multi=
cast."

There may be some specific sub-sets you are interested in. Please consult R=
FC7042 and related for further information.

Another thing to consider is the route that the packet follows. Carefully r=
ead your static routing rules and ensure you are filtering on the correct i=
nterface.

sunny

On Sunday, January 26th, 2025 at 4:20 AM, Adam Nielsen <a.nielsen@shikadi.n=
et> wrote:

> Hi all,
>=20
> I'm having some problems getting iptables to match some packets going
> through my machine.
>=20
> To debug, I created these rules:
>=20
> ip6tables -I INPUT 1 -i wg0 -j DROP
> ip6tables -I FORWARD 1 -i wg0 -j DROP
>=20
> This correctly blocked all unicast traffic coming in on the interface,
> but it did not stop any multicast traffic from coming in.
>=20
> I can use `tcpdump -i wg0` to confirm the multicast traffic is
> definitely hitting this interface, yet somehow it seems to be skipping
> any rules I have configured. I have "smcroute" running to configure
> some static multicast routing rules in the kernel, and the kernel is
> picking up and rebroadcasting the multicast traffic to other machines
> on the LAN, despite the DROP rules.
>=20
> Does anyone know why this might be?
>=20
> The setup is a Wireguard VPN, with multicast enabled (this is off by
> default). The remote end is sending multicast traffic, which is
> forwarded over the VPN where it arrives on the machine in question.
>=20
> This all works fine, but I am trying to set up some rules to match the
> multicast traffic so that I can use the packet counter stats to see how
> much multicast traffic is traversing the VPN. These rules work fine
> for unicast traffic across the VPN, but they are reporting zero bytes
> transmitted for multicast traffic.
>=20
> To debug this I switched to the above DROP rules instead as I figured
> they should have a more obvious impact, but even these are ignored.
> Those rules are inserted first, so they should match before any other
> rule is examined, so no other rules should be affecting their behaviour.
>=20
> I added these rules to another machine and they worked fine, blocking
> all incoming IPv6 multicast traffic immediately. The only differences
> with that machine was that the packets were coming in on a physical
> interface instead of a Wireguard one, and the kernel is not doing
> multicast routing.
>=20
> This makes me wonder whether it's a bug in the Wireguard
> implementation, or is there just something going on here that I'm
> unaware of?
>=20
> Many thanks,
> Adam.
