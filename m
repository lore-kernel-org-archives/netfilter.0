Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC1516ABC0
	for <netfilter@vger.kernel.org>; Tue, 28 May 2024 10:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716890456; cv=none; b=QHkIglMEV7p1EP62q7xHAi9qJ6zxGYTTT6i4qmRg2YsMtStwAOKwVu7iUqPQpocNEmnR3+ThGLngKPo4YgMFeERYhuE3luNU9H9/Nnx+jkOpKtIVjDw2Ads/SrwHC7YZWZZ/JB7qYZMw3dYDGT2qL7iA/yAP3A23HmTSFpQqELE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716890456; c=relaxed/simple;
	bh=pgSS5fNC3mI/ica0R3IGTMXpHniMJUuMFZJWc9r7tls=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j+8+tvcWSmIOsg6qeugti0rIzNarjpbL1OmA4S61PDmufb4LZmKFT7nThryhc2nte2E4ekhyiaseMs16K7PyXLGOdFUCT3d2HYs5LnNuYJZn6/vCuy559112MLJg4iliYcpk8x8TvLSl9tMOduXl3XROwUVpxoIlMJ/vj3aF+e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biscuolo.net; spf=pass smtp.mailfrom=biscuolo.net; dkim=pass (2048-bit key) header.d=biscuolo.net header.i=@biscuolo.net header.b=gsF5GV2T; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biscuolo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=biscuolo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=biscuolo.net header.i=@biscuolo.net header.b="gsF5GV2T"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55ADD6000C
	for <netfilter@vger.kernel.org>; Tue, 28 May 2024 10:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biscuolo.net;
	s=gm1; t=1716890451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fo7K+7/6QFXFG+/itWSsU43nkfiGiU9/L1K0jgFJD3k=;
	b=gsF5GV2TQZWWbV0WRbEr6tlZHIz6CQ74mIrb24lhE20mccOb2OfluqD+nKsYDkHMz7MF8B
	nEP5bZ9HzojoAz9FYx+Pe3lvIKfAf5D2q0Ynbrrh2HYEUzDBhyXtHgdUs/19yJ7+L0JHF/
	QCxA3DWldDSS5/T1JjLJw722XUxyD0CHNNlGgxnRKJ3DzNFgVke2/ztPgYcdfjM6nDbvnd
	pp7aQCR0UsEgUA4fsFgp/u1hP2Qymsgj2o+Vw4Z3lFnJdTi2c0usPW5IqZo7igRTr7G+VZ
	TMHCR0+KbS2QZ0DqEJIOldXcDCnqJ0qXcPihcdd54FjfaDDpErPGC35RZScz8A==
Received: from roquette.mug.biscuolo.net (roquette [10.38.2.14])
	by bourrache.mug.xelera.it (Postfix) with SMTP id 7C63732C9601
	for <netfilter@vger.kernel.org>; Tue, 28 May 2024 12:00:50 +0200 (CEST)
Received: (nullmailer pid 26162 invoked by uid 1000);
	Tue, 28 May 2024 10:00:49 -0000
From: Giovanni Biscuolo <giovanni@biscuolo.net>
To: netfilter@vger.kernel.org
Subject: Re: connection refused from DNATted host (libvirt guests!)
In-Reply-To: <875xuzw77l.fsf@xelera.eu>
Organization: Biscuolo Worldwide Network
References: <875xuzw77l.fsf@xelera.eu>
Date: Tue, 28 May 2024 12:00:48 +0200
Message-ID: <87sey2uugf.fsf@xelera.eu>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-GND-Sasl: giovanni@biscuolo.net

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

I'm not subscribed to this list, please keep me in the From: when
replying, thanks!

I've found a solution, I'm porting here hoping it could be useful to
others.

I've also change a little bit the subject to include the important
missing information about libvirt guests.

Giovanni Biscuolo <giovanni@biscuolo.net> writes:

[...]

> I'm using libvirt to define and run a guest (IPv4 192.168.133.9) inside
> my host

OK now I've understand that:

1. libvirt (still?!?) uses iptables and not nftables to define firewall
rules (see [1])

2. iptables defined filters are _not_ visible via "nft" commands, at
least not via 'nft list ruleset' I was using to look at rules.  I was
actually expecting a uniform interface to netfilter, but I see that even
today we still have to manage netfilter via (at least?) two different
interfaces.

3. when defining a network bridge with a forward "mode=3D'nat'" parameter
(the default) libvirt configures firewalling rules (via iptables) so
that =C2=ABinbound connections from other networks are all prohibited; all
connections between guests on the same network, and to/from the host to
the guests, are unrestricted and not NATed.=C2=BB (see [2]

The solution I've adopted is to (re)define the libvirt created network
bridge (swws-bridge in my case) using forward "mode=3D'open'", so that =C2=
=ABno
firewall rules will be added for the network=C2=BB (see [2]) by libvirt and=
 I
can manage all firewall rules via nftables alone.  Once reconfigured
swws-bridge I was able to remotely connect to my DNATted (and forwarded)
ports on my guest machine.

Another solution could have been to configure some libvirt nwfilters via
XML (see [3])... but no :-D

[...]

Happy hacking.

[1] https://libvirt.org/firewall.html#firewalld-and-the-virtual-network-dri=
ver
so libvirt can use firewalld backends but not nftables directly :-(

[2] https://libvirt.org/formatnetwork.html#connectivity

[3] https://libvirt.org/formatnwfilter.html

=2D-=20
Giovanni Biscuolo

=C2=ABSi pu=C3=B2 sperare
 Che il mondo torni a quote pi=C3=B9 normali=C2=BB.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJKBAEBCgA0FiEERcxjuFJYydVfNLI5030Op87MORIFAmZVq1AWHGdpb3Zhbm5p
QGJpc2N1b2xvLm5ldAAKCRDTfQ6nzsw5EpVfD/9ph3Kgq3OTN1ZlGC1oXLHZrsAq
vts/msAwZWM4v/2QeNQll4Pq29KNIpKawDc7qIINxGTSPfwISylB9XZtYSaOMmfh
ikXNtvnRU00i9pACxMHtj2+wn5vKx3A725Az/HPlk5UXyqh6fN5GIWHOFyufV+Iu
V3GlBhoak3n4tokheEQXv4sXG0JuYJq9nDzgXLz0YGTOEYur5pqLHFiKRnWZBlgZ
AE2bGYvVYrctJ67QmNsjNeryvskdNoaE8Jyk+X9fvkIg0LzkuHEae0eMCU2F9kUF
DQRIy71pA4D09bw+omc+xUrr2HGeQysK//CN8mSw7yMBf9hacs3Bk6VIyh7JkVDN
7khFRzC8RXzvn+hyoPlP1oqBxWlszoJmCuSfw2RwLz3paJoHkPTpegRntcHr9tjA
hZYrX5z1bjETidx0A3N31d+EwW9jB2+67u4pkdVExd53L8+3mvRcjUO9Q8D4VP5k
QVFzGyC213CT5ooAexyLmrF3gafMwOtZslkhp3XqF0QQEL0EyglBYjBmVI8KKwHp
VVz0Lm3bgiuIuquPXemVDG90iTwGhbZN4iAjs2hH9USpMzAjAYWXXOaTMHwPYOzB
+w/gJ7bpK8T+ueBCu9QzpgzctlJM7CkPQu4bLGhAzOWremGO2h8vZRtfmbRyn076
UoElgPbokvM0QWrOfw==
=ljG0
-----END PGP SIGNATURE-----
--=-=-=--
