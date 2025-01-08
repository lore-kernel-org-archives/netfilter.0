Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3DA18A6A9
	for <netfilter@vger.kernel.org>; Wed,  8 Jan 2025 21:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736373582; cv=none; b=LG0cWk50HS32WFBV2su609htzvKV8RvZNHpQPzZbVnvVdach0YLcWzCPROJqF96ttu7p9M9fyzs0XXfxyyCdT2ZEUisBVt7ApBZpFjynRWMbP6XEzACzsRikryVuY/8r59d1ztXTdhmac1zt9tVz8HdqdONvbgoMMS5KceeZgek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736373582; c=relaxed/simple;
	bh=TGe61LkLqXnJCNxfmbHClluZnez9z0nPU3M1+kEVplI=;
	h=MIME-Version:Message-ID:From:To:Subject:Content-Type:In-Reply-To:
	 References:Date; b=k6JR+EPvxXgs2ud+dpriYWCkkVzPGAR1PepcvPOPzlsAUfYlgOIIZ8Bpuk6K7b+gyKbUhvRihHZ6PEpd3G3Q/UzaHcvCzlBsuNIBvCGYCYs+UbW6Pkd/h/1ANrU+zzKZl0pDyCpVz+ZdBwq74eXtcDhXbR7Y2bLupWrNoMghL6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=potatojuggler@gmx.net header.b=oU9ST5Pj; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=potatojuggler@gmx.net header.b="oU9ST5Pj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1736373574; x=1736978374; i=potatojuggler@gmx.net;
	bh=GVe9x4GjgbfHnr2qZdOdhP5TiMokl3hJT8HPEesk4GE=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Subject:
	 Content-Type:In-Reply-To:References:Date:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=oU9ST5PjriSAcssXpqBnlgGmeEXHHvRqjr3RVSVz0uXsFByu2tDVj1TpXGEJOF/M
	 s2rVnWeu6hnKcfdyTzofffUvtjat5GaqJLBD5xlG/za0aSgL0GvhiWj43PJ6cqvxx
	 KFV8nDHgeHYIP8hk3TVmONYxkCJJ+BoX3D69fo4Dv9ZprgBV9v0PUaXOkhTvjC0uH
	 RdaCzZgzIQxNoargJ12d1/teN1tHcVkRt4p2ebXzVdy6vI+OdRiqg6V45R+bTSXXx
	 NHWLqFt8ok5757vJJ7d8IMKRn0ISwqF8tkiifhp06mmLxX4nE/xNEnsRQnD1UYaYU
	 9LegLD8cscYid/DP8g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [86.56.211.2] ([86.56.211.2]) by
 trinity-msg-rest-gmx-gmx-live-bbc95d94c-v89sw (via HTTP); Wed, 8 Jan 2025
 21:59:34 +0000
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-c141489b-3bc6-44fd-bf1e-da6f4ec06b80-1736373574654@trinity-msg-rest-gmx-gmx-live-bbc95d94c-v89sw>
From: potatojuggler@gmx.net
To: lists.netfilter@kevin.km6g.us, netfilter@vger.kernel.org
Subject: Aw: Re: aggressive firewalling via nftables
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <57c39b0f-3aa5-42db-8ef0-7a928420e50e@app.fastmail.com>
Importance: normal
References: <trinity-8c3627be-7f9f-4150-a74a-5a69dbd8781a-1736180864807@trinity-msg-rest-gmx-gmx-live-548599f845-9tnlq>
 <57c39b0f-3aa5-42db-8ef0-7a928420e50e@app.fastmail.com>
Date: Wed, 8 Jan 2025 21:59:34 +0000
Sensitivity: Normal
X-Priority: 3
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:nuqQkdNc6eF9ul5IlBNoFJGxiNmFV4BYe7OU18AFl15cYoEQmuiUbjPir4qj4z25cBCfV
 +3T60u/dw5qB6g8W9GwdxEXwX6crpsaphpk0DLCxY9dN6BlU02gsFQk4AgYCLxKA9XRDxVwK3Zl3
 AgpVkQBJWbRrgmw7a3MOqauYGhfaLuMVKZCd1GAFYIZhbqDEER+GJ6yDgx3DznVDZCwveKgtpvf0
 YQsX1IwM62BlxZ0BRclvnW+CrBSLP0TIvCUkyUnQAwqHzbTXQ+BuxkimMHJUCC8U3rQL1gZwgUU7
 whxOdFlFaJpOwOJpVeXve71mycPz7aEF2dcMBkcp0oqRQmRaP6IfEnm5C7yshUH2U8=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5ItU02rTd8c=;R5aQSlYokuq9uvonHIbVawlpH0R
 0Rskhr1rjL8GA3E3NqiVYlwb0j+N83NvX0pfGV7lNjRkYx2cHzccXBz61JPuT6JMjLCBA5V/C
 z2rhaFV6tLDUrtCquHkLCstSdBp0GiX7zrTuoPvQ17pGbGhV1DCJrJ+t1oEPPJdUp17FlSZdF
 1sgmaocxW7x5Osb5S9eEAea8UiT5dprAyq9HGJ4/4Yeo7oMC+ROOd25oU4qmDtTJ/wCCjm6MI
 UqiMwSoXJ52pWjg+wD8lOEyd9l4s2XQxoaPRNxcnqEYxMcYtsWXn7105u3AdtRr0NeAl59dxE
 +oveekAYXqHcYn/Y082WvVg2e5DR5nSWDR+Gxzy8heZ3XNLAvNhr6tzLHX02BQvGtzQM/gqwf
 eGrNIutal0cEnScjvgzNOUKmOX4W7h7h/5l6WH99R2vsa2/trJANEdVLNR24Qq+gdqLGRXUmG
 wevfEOwuD+6kiP8vSEOCNbAiz/ce1HTrG8P39wH2FgHFavJoFtSKVCMXstnEPVKZSjx4FmjrE
 woPHMZwNDPMnYEdQIaYiQRGDVz2bpW1EzcHZabMEu9jZc8tHKbQYrp/Xv4i9zVIySNyTDEKom
 A2ZNQp/CfthidfnYfRyOOBl8H1KQxC1UaVBK2/OSpECUIsPJj/HYuAyYdXVt2iIku+44RGTOZ
 ll1VVjKjaVR+6WjvPQnGAmVVSVbAvOaHhWi6mqH0L/SvHPN71L9D1M+Z+vTYDN2c01bPtscpN
 pOXQX479DRFwnd1+HVWNC+aJOPeAYADVqWPneLtLACPZ7mtOznH84FMV60F7mQI96GOLrMDhe
 ffNRCYxIwS1M+jxSvLq+Z2fEeOX1w6B3JgGnceztk76r6uMhc0OQBZ/SD+HYbkvbhjQBEDzyY
 UPaiGkGwB0CO+5Mpka1Ik27u1LUqd4ei0Y0M=
Content-Transfer-Encoding: quoted-printable

> A small clarification: QUIC does not use TCP at all, not even for an ini=
tial handshake. It is entirely UDP-based.
You are absolutely right, thanks for pointing that out! Somehow picked up =
that it does a TCP handshake for IP address verification and then switches=
 over to UDP with a negotiated session token - I read up more on it now. I=
 want to offer HTTP3 as well on my server, so I will have to find a way to=
 properly track / rate limit new QUIC connections or traffic volume... wil=
l address that sometime later.


On the #netfilter channel on the Liberia IRC I already got help in order t=
o match new TCP connections with the following rule:
    add rule inet filter input tcp flags ack ct original packets 2 update =
@rate4tcp { ip saddr limit rate over 12/minute burst 24 packets }
Since I do the following at the very start of my ruleset, it will correctl=
y only match verified new connections, but not forged ack packets:
    ct state invalid drop
This will find the second packet from a client with the ack flag, which is=
 the one concluding the TCP handshake for the new connection - and with th=
e set entry I can track and rate limit.
My question now is though, if this will also match the ack packet, if it h=
as to be retransmitted (packet was fumbled up in transit)...
Does "ct original packets 2" match the second packet overall from the send=
er, or the second valid (not incrementing on retransmit) one only?
The man pages did not go into too much detail on this unfortunately.
