Received: from azazel.net (taras.nevrast.org [35.176.194.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAC131716B
	for <netfilter@vger.kernel.org>; Thu,  2 Apr 2026 15:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.176.194.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775144108; cv=none; b=i164DBLWOMTxuPPsIcA7uedyi+Whxz/PgTkHXGTEyC1b298Blzbw+pYBoxdiWGEAD7ob03iwhATM9LFbpPEHGyKUMJNq3PHnHl1Ls5UeoB3Dbi6sdUS2RH9kA3UJ8zDw6bhKM+nITXRpKZamGo/jrRJ79xxGDCQ4A9FrsweIGTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775144108; c=relaxed/simple;
	bh=dmCQbAlqOGmf8IyGSTAVTtmehX64IuJr58a7mXgRUiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVIbFi9/zm54urJYnmsmAh+vxcFrDGsVHAfKCZ0WcBzsn2tQyZEnArIu2gDD4ZDUzws4wdYz5N6DMGEyjwUCZlUJENg3y9kqoa+m7bXrNRDOew1rHiYQOhN26FSdp548LLGssCPGxGoedKsUkk0QF9cvesBqw98bXAv/28gck/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net; spf=pass smtp.mailfrom=azazel.net; dkim=pass (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b=ncQ65Grb; arc=none smtp.client-ip=35.176.194.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=azazel.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b="ncQ65Grb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=azazel.net;
	s=20220717; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RNC0aNiRZ+8mWJZmkfraKp25KQmrUGSWpmvm2+ydAmk=; b=ncQ65GrbC3qaZ0+GU3jrjz5LOD
	9zQVEozqdQ9/phB7EIT7dSsqzSs2n3jLqsdF6jMBHGtdZaJbq4TnOspq6VehMYwVA7UnPKgJrj4YA
	4H019/1zOr946YrLz5LpmlKlOvsiFf0dPxuQFuPpjxX7s1tS+ONRvLm8ufe09SIqLnJWHVwF3iPVv
	kZij+2WC9iKE2bq7EtCXnznC1RrSaLnNYb7gPc1jEP1kGXtNIU1p0d3/1Q3qkzzut0a4IT2Vwxk0B
	rOTxlgbooo5y6HR7eKbH/BvFtdSUtpJiNumvFMQMGr+oj0Bmyj9AINOKGPcp/UIyWXI6HLEh715sn
	KwZvP1Pw==;
Received: from [2a00:23c8:a49f:6601:3e21:9cff:fe2f:35f] (helo=celephais.dreamlands)
	by taras.nevrast.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <jeremy@azazel.net>)
	id 1w8K4W-0000000Dihs-1BYq;
	Thu, 02 Apr 2026 16:35:04 +0100
Date: Thu, 2 Apr 2026 16:35:03 +0100
From: Jeremy Sowden <jeremy@azazel.net>
To: Martin =?utf-8?B?TWFyZcWh?= <mj@ucw.cz>
Cc: netfilter@vger.kernel.org
Subject: Re: ulogd: logging IPv6 flows
Message-ID: <20260402153503.GB5449@celephais.dreamlands>
References: <mj+md-20260401.114453.17525.nikam@ucw.cz>
 <20260401190727.GA5449@celephais.dreamlands>
 <mj+md-20260402.123615.46599.nikam@ucw.cz>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YWpUTwx8ogLNEFo5"
Content-Disposition: inline
In-Reply-To: <mj+md-20260402.123615.46599.nikam@ucw.cz>
X-SA-Exim-Connect-IP: 2a00:23c8:a49f:6601:3e21:9cff:fe2f:35f
X-SA-Exim-Mail-From: jeremy@azazel.net
X-SA-Exim-Scanned: No (on taras.nevrast.org); SAEximRunCond expanded to false


--YWpUTwx8ogLNEFo5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2026-04-02, at 14:37:32 +0200, Martin Mare=C5=A1 wrote:
> > The use of `ULOGD_RET_IPADDR` for both families is (or should be) fine.
> > My guess is that there is a filter which expects `ULOGD_RET_IPADDR`
> > fields always to be IPv4.  I thought I had fixed all of those.  I will
> > investigate.  Can you tell me the whole stack?
>=20
> My stack is just:
>=20
> stack=3Dct1:NFCT,nacct1:GPRINT
>=20
> [ct1]
> netlink_socket_buffer_size=3D1048576
> netlink_socket_buffer_maxsize=3D10485760
> hash_enable=3D0
>=20
> [nacct1]
> file=3D/var/log/ulog/flows.log
> sync=3D0
> timestamp=3D1

The problem is that GPRINT (and OPRINT) used not to handle IPv6
addresses correctly.  I fixed this a couple of years ago and the fixes
were released in 2.0.9 (which is currently in Debian Testing and will be
in Forky); however, the version in Trixie, as you are aware, is 2.0.8.

As a work-around, you could use the IP2STR filter, which does handle
IPv6 addresses correctly:

	stack=3Dct1:NFCT,ip2str1:IP2STR,nacct1:GPRINT

As the name implies, it converts the addresses to strings.  The output
keys for the strings are the input keys plus ".str" ("orig.ip.saddr.str"
and so on).  The result is output like this (reformatted for
legibility):

	timestamp=3D2026/04/02-16:15:53,
	orig.ip.saddr=3D32.1.8.176,
	orig.ip.daddr=3D42.5.180.0,
	orig.ip.protocol=3D17,
	orig.l4.sport=3D47294,
	orig.l4.dport=3D123,
	orig.raw.pktlen=3D0,
	orig.raw.pktcount=3D0,
	reply.ip.saddr=3D42.5.180.0,
	reply.ip.daddr=3D32.1.8.176,
	reply.ip.protocol=3D17,
	reply.l4.sport=3D123,
	reply.l4.dport=3D47294,
	reply.raw.pktlen=3D0,
	reply.raw.pktcount=3D0,
	ct.mark=3D0,
	ct.id=3D1615795605,
	ct.event=3D4,
	flow.end.sec=3D1775142953,
	flow.end.usec=3D478848,
	oob.family=3D10,
	oob.protocol=3D0,
	orig.ip.saddr.str=3D2001:8b0:fb7d:d6d7:2e4d:54ff:fe4b:a9ae,
	orig.ip.daddr.str=3D2a05:b400:c::123:63,
	reply.ip.saddr.str=3D2a05:b400:c::123:63,
	reply.ip.daddr.str=3D2001:8b0:fb7d:d6d7:2e4d:54ff:fe4b:a9ae

J.

--YWpUTwx8ogLNEFo5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

wsG7BAABCgBvBYJpzoymCRAphqwKvfEEDUcUAAAAAAAeACBzYWx0QG5vdGF0aW9u
cy5zZXF1b2lhLXBncC5vcmdv8H7H5sja/LCvL8V0RccahD2qUqeYRcUBft7OJc48
0RYhBGwdtFNj70A3vVbVFymGrAq98QQNAAAAMRAApqzq5U7kTVU8MOtN4+NCP+Zx
5fzEkRb2aFoKEViITNDGfGuyNhRab6Nv/2MMlfXcPx77yPFxPrlHSTnZ4VpSHW7l
wGNlMTSfkiL3SGbC2aKdz3eZ3ZXz2/8mwKim9vUfKv4012dpuw++Wx1ToIXO7R7y
I88AUGtfSnleqs/mxCMqPy/3lacvkAJog6RJvVB7F0H+Jh94jONHSqzdX39WYrPx
nZvojXE7OE5Hs3bMzKYfhZZJ7wJiOrwmrTpnA2wKo7PtuFSCkw/UvMSCvCyfWCfS
jeVBpnDXHmzSyvcUFt8FGNSN2tD3EDDuuFTxfBCfTTYBZ9cio9sGS9yWb1q97h6J
GsJhrzEjr4ITJEOwliaQB/Q99v4RisPeEAo5iySbXZtJHpbPURLIswyKPMEQdb10
fvUAZnaVvvQS3SOWCp4Plt4kpxbQVjZdUNmXxIoQA6VbZllystbFRqtt/tnWoIOA
PwHqvCtfH1PKdxHcWeETj4y8JMXRWH/kkImWmWw4oBjVw5qL178ImP5j4OR/kdoO
aQWJ7hhEfbMbUW7GwFARoxtbQ9ta4YF8zfW7kMbcUk0DB/p8cuUWMwAxi7G6AC3B
EM4Ag4i1y3ILNmW2kYl+4+XmYpKrZoqlu8WaPaDDMfjYno2yDInV3Chr0bqF9n+X
Q9YCj0ep2uz/nEtM4tg=
=B75x
-----END PGP SIGNATURE-----

--YWpUTwx8ogLNEFo5--
