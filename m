Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE44613635C
	for <netfilter@vger.kernel.org>; Sun, 30 Nov 2025 21:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764537173; cv=none; b=aQA/QCkYisZBFi+SpZojzz1wrhSOMbnWekd3b87DMDq1sAnY2UhOqubHRpOCmpSKHPIO+0enJAUqkNJtvsbYonebOV/4CdBXWlcJkcbAC0DUHA19wYNPTMBl6TQqzO6AHfqdbjmRxTJglZQnQp9Thoi4jMPpTgXJo6ALCcHVX0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764537173; c=relaxed/simple;
	bh=RQU5smx6TkJEtlTQXBiSCnOhTAd7VBD3rVWstjMY5N0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=HKo3UKa1XZNWlNvzVcMl/9MqE0yd02arxrJCsCOH1K+NBHcXbi2QPOjSn3+DoevovRCqkdPUEuboxGKpKgIWrsW6SWgZbp1LVZBCpE1qIDqn6pj0+J3vr8EYSkPgGaYR7bGuW8NpZCJ1O5H74zr/tvqxJEJWir3gXqCVMVYq2b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=mk16.de; spf=none smtp.mailfrom=mk16.de; dkim=pass (2048-bit key) header.d=mk16.de header.i=@mk16.de header.b=M2elI6AN; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=mk16.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mk16.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mk16.de header.i=@mk16.de header.b="M2elI6AN"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4dKKK14lBWz6Djs
	for <netfilter@vger.kernel.org>; Sun, 30 Nov 2025 22:04:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mk16.de; s=key2;
	t=1764536645; bh=RQU5smx6TkJEtlTQXBiSCnOhTAd7VBD3rVWstjMY5N0=;
	h=Date:From:To:Subject:From;
	b=M2elI6ANiJDAycYG/DFk8tnho8nOmCrcNkLa70nTJft2BW7vxPJrlS9AH5r3sjzGp
	 aUjWb1PBYbwMcM4U9Wr8wren6e4j8kczO6K0O1imJ2PZD6/p/HBHLzYbcSYNvZuQgE
	 NOfR+2/D8W9uXcOPIYAb8+Efo6lOCQWhDCGAAm54l8eOXeiLcf2DXAjqBQK3Tj/op2
	 sYh6V/EpdBS3DslHs5iTfBODqE1+H7KFwMEMW8GYDH18toSmUl7Wbf3w4Bca7LeNbt
	 rOZwr4BWU/5M3OXmaKCUT9JdLmU25O6FondNrti0UMkKERqh5+iO60ebHMC5/PHCq9
	 KWJJBTZJBCR1Q==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4dKKK142Jzz4xN6
	for <netfilter@vger.kernel.org>; Sun, 30 Nov 2025 22:04:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe87b.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4dKKK06jVLz8tXM
	for <netfilter@vger.kernel.org>; Sun, 30 Nov 2025 22:04:04 +0100 (CET)
Received: from ciel (dynamic-2a02-3100-8043-f201-ad98-26d5-86cc-c8a0.310.pool.telefonica.de [IPv6:2a02:3100:8043:f201:ad98:26d5:86cc:c8a0])
	by mxe87b.netcup.net (Postfix) with ESMTPSA id BBEBD1C0087;
	Sun, 30 Nov 2025 22:04:03 +0100 (CET)
Authentication-Results: mxe87b;
        spf=pass (sender IP is 2a02:3100:8043:f201:ad98:26d5:86cc:c8a0) smtp.mailfrom=m-k-mailling-list@mk16.de smtp.helo=ciel
Received-SPF: pass (mxe87b: connection is authenticated)
Date: Sun, 30 Nov 2025 21:04:01 +0000
From: Marek =?UTF-8?B?S8O8dGhl?= <m-k-mailling-list@mk16.de>
To: netfilter@vger.kernel.org
Subject: Filtering MLD messages
Message-ID: <20251130210401.77c74ee1@ciel>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4VZ6B3Gyfu_OrrzUh9=bC_f";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-PPP-Message-ID: 
 <176453664399.1947370.16303324893105791979@mxe87b.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: BBEBD1C0087
X-NC-CID: 5e6z4CkWBSdPrWBYHX0BT2Zfnh4fb8Mkcg7k6CZMrkozcF6bwyrkqVY=

--Sig_/4VZ6B3Gyfu_OrrzUh9=bC_f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to filter MLD messages:
1. Only MLD listener queries and MLD2 listener reports should be
allowed.
2. The messages must have a hop limit of 1.
3. The messages must have a hop-by-hop extension header.
4. The messages must have the router alert option set in the hop-by-hop
extension header.
5. The source address is in the link-local range.

```
set icmp6_mld {
    type icmpv6_type . icmpv6_code;
    flags interval;
    elements =3D {
        mld-listener-query . 0,
        mld2-listener-report . 0
    };
}

[...]

icmpv6 type . icmpv6 code @icmp6_mld ip6 hoplimit 1 exthdr hbh exists ip6 s=
addr fe80::/10 counter accept;
```

I have managed to write 1-3 and 5, but I don't know how to filter
the Router Alert option. I have seen that there is `ip option ra`, but
it doesn't seem to work for IPv6. Does anyone know how to write such a
filter?

I would really appreciate some help!

Best regards,
Marek K=C3=BCthe

--=20
Marek K=C3=BCthe
m.k@mk16.de
er/ihm he/him

--Sig_/4VZ6B3Gyfu_OrrzUh9=bC_f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEmqKBWfzrPNg7whIBfoaRRmmRCMcFAmkssUIACgkQfoaRRmmR
CMcaHQ/+P+choBdpYl7jQCdrTkF7+Koy/zD4Eh6vsdnm4vDlgKtdLmvOJrQAwPRv
sKQGDjjRdQTBIkGMJIPyOVZjNgiIBaq8A86pjLl/XurPnZ5D/xZN4qeS0ky6ivy5
zuO8yrP5t0luOQjTsaPlOax6nx7z9nhEAD3Wab/jBFBqrD7qx/hNkxTiqqDh779T
MZZAHe0/M+/7ga0XLdKAM3l+7tq44mB+rSb7Fkh8bsVq2S1gSb8D3XgNA7ferZ62
TbC3LWbrH0GN/biAL0QjkXhyNBn3VUy5ke1Tt1Y5QiHU2ThqBgtFmTrKa1XZu98S
3xRUVdo5ILiF8QEnlHOHDQqtfrQxWfa0zZcddLdydiWZ+qi26+6+FXUXDhmd4ueN
ADJPW7A+rycskUnLmVovAgLQAvreVmVlXRK4n04s46ihoKrXSYmiAJwehwt3ppg2
OJFOcvPwKqIXnYJkdYJxsMTCHtnSf7PUoGnr67Kmp1ArMy7s0PtLgL4lKqiYReN9
cAWK68MeHHB8vZpCmFzUJk1aFHvPNzCYsphSfaCNyjQkmnpCNtOZt8uNiIR9isNr
pI4xo2DEDVCxq2zRZoRYBMVoRZLskruYlUj2Oz34Nxms1FDHClpM0TpTRgsErCId
D8U5mIiXGrk1Aj+LMIZWktZlbgu8qtz4I49UIvfU1d/YU/qvkLk=
=Hi/k
-----END PGP SIGNATURE-----

--Sig_/4VZ6B3Gyfu_OrrzUh9=bC_f--
