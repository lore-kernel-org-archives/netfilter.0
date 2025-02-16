Received: from sphereful.sorra.shikadi.net (sphereful.sorra.shikadi.net [52.63.116.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8B2189BB0
	for <netfilter@vger.kernel.org>; Sun, 16 Feb 2025 10:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.63.116.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739700744; cv=none; b=Ch3juH6bNVGodnplF8PnnhkoucdpXZtLyJCB5igu3i0IctmpJzxubcr+SabizdBWegmT7SL78m/C9OUehR/tP1dJ35c67KPkdmIr7zdlRgf8MAlo+y3wWbGTK0FRf5RmQcKb6JHlH8cHxc/byD1p5cwjlfL5er440SZruBrKoBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739700744; c=relaxed/simple;
	bh=zdKP5U6OiRf2HA+g6DsOtZ32CN5HYa2IdBtuvH9y9i0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bMbuqrkJiRahxzfJnt6hIxHMiotKQRm6f9ZRlJdNsjZ80wr/wB24l836SpiNw9Ru97rEey12cD01hp0Ib928dtambrObszigyiMYLjD/mtnu0JI8DXocwzdKUIjtXCCt2viJ5P8/gj+JU20ptIShml6nAJwTaRUtFCZBO2TutK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=shikadi.net; spf=pass smtp.mailfrom=shikadi.net; dkim=pass (2048-bit key) header.d=shikadi.net header.i=@shikadi.net header.b=cxc05b6K; arc=none smtp.client-ip=52.63.116.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=shikadi.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shikadi.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shikadi.net header.i=@shikadi.net header.b="cxc05b6K"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=shikadi.net
	; s=since20200425; h=MIME-Version:References:In-Reply-To:Message-ID:Subject:
	Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=FYAviY1s4OdRM6GDQY1UWKnPSOB62x8rpSK6b22hA5M=; b=cxc05b6Kht1S6c1dbkzmG8IY8k
	kg3tD/FU7n7IQjOKkSDMwcvq9fEIN+JHC8dOMborR07OAZQephbKBfIIhLnh6PqM/zEFAtlgOgAoZ
	K4Dm/nXI29m4nnsMwxySI/eMow44Ax8/kYAtkt9rQdLHQBV0E4wYVFhXHMOzpLWHwGkfKXH8AQW4f
	YtPVw0/NrNC+EzI1+47vMF4QWAgmP4adgPix/3pfZ7FtAtZjO/SinC6IbOim4NYXepOCzktoV1wGO
	/oAdV4xbLJj7bBpsnDHkZJ3l5yhJCbjfEzEZeG3HlFx8JPnNLz10PdpUayRocosysNvVTyWX3Q1AH
	V4ahYeIg==;
Received: by sphereful.sorra.shikadi.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <a.nielsen@shikadi.net>)
	id 1tjbdM-0007qu-1r;
	Sun, 16 Feb 2025 20:12:20 +1000
Date: Sun, 16 Feb 2025 20:12:17 +1000
From: Adam Nielsen <a.nielsen@shikadi.net>
To: Alon Bar-Lev <alon.barlev@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Static bidirectional static NAT for duplicate IP devices using
 iptables
Message-ID: <20250216201217.6d99e00c@gnosticus>
In-Reply-To: <CAOazyz0KRqij4oenpBKbgQHJMem18OAQmNkyytfPSG0y0L6X_w@mail.gmail.com>
References: <CAOazyz1wYSHCYt+nk7hu2fmiW+GRRMMX0sejAa-31xH_VeWvXA@mail.gmail.com>
	<CAOazyz2H52h0unuTEadOFP3cWD7CfHUMG+HUGwVnnZQjtWRJ9g@mail.gmail.com>
	<CAOazyz3dGP+QJ_BOvXQ7gnQzTvOhGcxwA9y-RRJx=CjmMNmWhw@mail.gmail.com>
	<20250216124022.127f90f3@gnosticus>
	<CAOazyz0KRqij4oenpBKbgQHJMem18OAQmNkyytfPSG0y0L6X_w@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> > I am by no means an expert but I would've thought that all you're
> > trying to do is to convert a 192.x address into the same target IP, and
> > just control which interface the packet goes out on based on whatever
> > the original IP address was.
> >
> > Is ARP mangling needed at all for this?  
> 
> Hello Adam,
> 
> What I am looking for is a static NAT to have 1:1 replacement of
> addresses from one subnet to another subnet.
> For example having 192.168.0.X <-> 10.0.0.X in both directions, so
> that 192.168.0.1 == 10.0.0.1, 192.168.0.2 == 10.0.0.2 and so on.
> The NAT is in reverse so that it does not NAT incoming but outgoing
> communications.
> And to make it more difficult, two interfaces share the same
> destination address, so that we need to assign them with different
> virtual addresses.
> In my example I proposed two conversions: 192.168.110.X <-> 10.0.0.X
> and 192.168.168.111 <-> 10.0.0.X.
> The 10.0.0.X is the device network which cannot be modified.
> 
> Do you know of a NAT configuration that can digest this?
> For now the only solution I could come up with is filter hooks + arptables.

ARP deals with mapping a MAC address to an IP address.  I don't think
you need to operate at this low level, and I think messing with ARP is
going to complicate what you're trying to do.

Think of a normal NAT gateway.  You connect to a remote host, but you
send that packet to the gateway.  The gateway changes the source IP
address and then forwards on the packet.  This way altering ARP is not
necessary, because a real IP belonging to the machine is used for
outgoing traffic.  The normal ARP process handles it all as usual.

If you do the same in your situation, then your 10.0.0.10 device will
need to see traffic coming from 10.0.0.X (whatever IPs you assign
v10@eth0 and v11@eth0).  Because these IPs are in the same subnet, you
don't need to deal with ARP issues or routing the reverse traffic as
you would if you kept the 192.168.x source IP.

Then all you have to do is configure your machine so that any traffic
destined for 192.168.110.10 and .111.10 gets the target IP changed to
10.0.0.2 and gets sent out the right interface, and when packets come
back from 10.0.0.2 the reverse IP translation happens as well.

This might be tricky since both interfaces will be in the same subnet,
but since the packet leaving the machine will already be in the same
subnet as the destination IP, you won't need to deal with ARP at all as
it will be handled automatically.

I think you probably need both SNAT and DNAT rules to make this work.
The SNAT rule would take care of ensuring outgoing packets have a
source address of 10.0.0.X, while the DNAT rule would map the 192.x
target address to 10.0.0.2.

I would try to use two different IPs for the VLAN interfaces, e.g.
10.0.0.10 and 10.0.0.11, just to make things a bit simpler.  If you use
the same IP you may then run into ARP issues, unless both VLAN
interfaces have the same MAC address.

Cheers,
Adam.
