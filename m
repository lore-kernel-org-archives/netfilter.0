Received: from server.interlinx.bc.ca (mail.interlinx.bc.ca [69.165.217.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12B033C9
	for <netfilter@vger.kernel.org>; Wed, 25 Sep 2024 17:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.165.217.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727284704; cv=none; b=kn767XmhZBeTm8FscD+/O0v7ZyDrA21NsgRYPs843RmVpiqwOfPi2fPtGJlzwQOCqMkZemfz+FsbofTCSWEKn+IZkZ0c36/MsFt8i8re5uJ8+glDpgo0NPtIxEa4vX/P1oDZktDDx7ZpF9mv37A3MUKb6HbRY0Lv3Oh8Emwlu3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727284704; c=relaxed/simple;
	bh=7EINyORnKVWj1GQBWQZSQQ7rQyaQG/8w7Oc1MAz0nII=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=lLoqoPUhhwklOEqlttvo0LZC0Wq+W+BcsfP+1MxekA1B9J7wk/ae0u/kAmrjJXjPfTUzdfJPeM8EYWHJO6bq9Kk2g9fKFkQih1t0alMLPAS9mxzYpNo0FFdSQnzuOuJODeAOUBb7teehwuK8oCPXYRYnq2qhFC31teErvg3BI00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=interlinx.bc.ca; spf=fail smtp.mailfrom=interlinx.bc.ca; arc=none smtp.client-ip=69.165.217.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=interlinx.bc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=interlinx.bc.ca
Received: from pc.interlinx.bc.ca (pc.interlinx.bc.ca [IPv6:fd31:aeb1:48df:0:3b14:e643:83d8:7017])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by server.interlinx.bc.ca (Postfix) with ESMTPSA id 3AE022FB9F
	for <netfilter@vger.kernel.org>; Wed, 25 Sep 2024 13:09:40 -0400 (EDT)
Message-ID: <97d9d783d0ff4ac494b909176f2a99df2d1190e5.camel@interlinx.bc.ca>
Subject: Allowing closed connections time to drain before logging packets
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
To: netfilter@vger.kernel.org
Date: Wed, 25 Sep 2024 13:09:38 -0400
Autocrypt: addr=brian@interlinx.bc.ca; prefer-encrypt=mutual;
 keydata=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
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-L64RTmuyybRTmnwt57gP"
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-L64RTmuyybRTmnwt57gP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I often see entries such as this being logged in my system log:

IN=3Dens3 OUT=3D MAC=3D[redacted] SRC=3D[redacted] DST=3D10.75.26.3 LEN=3D7=
4 TOS=3D0x00 PREC=3D0x00 TTL=3D43 ID=3D3769 DF PROTO=3DTCP SPT=3D33944 DPT=
=3D22 WINDOW=3D229 RES=3D0x00 ACK PSH URGP=3D0

I suspect these are packets that come straggling in after a TCP
connection has been shut down.  Is there any way to have netfilter give
recently shut down TCP connections a bit of grace time before logging
packets that have been sent after they were shut down, just to reduce
the false-positive noise in my logs?

Same goes for UDP in fact:

IN=3Deth0.2 OUT=3D MAC=3D[redacted] SRC=3D[reacted, remote IP] DST=3D[redac=
ted, my local IP] LEN=3D99 TOS=3D0x00 PREC=3D0x00 TTL=3D59 ID=3D0 DF PROTO=
=3DUDP SPT=3D443 DPT=3D37242 LEN=3D79 MARK=3D0x3f00

for, for example, QUIC connections.

Cheers,
b.


--=-L64RTmuyybRTmnwt57gP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEE8B/A+mOVz5cTNBuZ2sHQNBbLyKAFAmb0Q9IACgkQ2sHQNBbL
yKDrJgf/d1RqY5DP7vPBARvRRgwn9sZ0VRHafLGKrc/3htb1P1D+3RZMJ6gE2q6W
Geem8B13bOn9CK2FfO435zoXHkXlTEBY2gMYyuo5HPVfGMGLxiTDjUPJguO4p0EB
61CiWbHzxsHxKraPN/RyaLw6T3FtnS5E6DJ3dfMW/ri3++g5cfvEXCnNibZAIXrA
CiwqfNm27YDaHMXcqNBFZRNr9wxo7jWvJIbGeKOeFFUnZEYIf/Ow8SnBD14NYmOe
1P/bPYL9M+cpaiWKaR26tdBYOJ7NkGJTv68C6GhiMLnBBK8Rnk97r11SCZF11SK3
PDaQfZ7JR7rlPNsuU1Vo1FRmiHNatw==
=QpCn
-----END PGP SIGNATURE-----

--=-L64RTmuyybRTmnwt57gP--
