Received: from smtp-outgoing-1701.laposte.net (smtp-outgoing-1701.laposte.net [160.92.124.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2342DFA42
	for <netfilter@vger.kernel.org>; Wed, 16 Apr 2025 22:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.92.124.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744842212; cv=none; b=WVNforEuALkIr/357vxdSnpZRY1gw/GTo4GdcwvGicDg2Sv9MUkfItvw0M7UIPvkbvA42mvLrx+N6+ubZOdUYVUj+KCr7uKKV0rrGrPtZvSQoq7V9jhuSTgK41Xqg8uEM11k9Iecu0puFWPzQuXakiV2X7SBi4pYbN0AOBtviPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744842212; c=relaxed/simple;
	bh=EUQqj7VSfFRuse+GlaSROLijh2+v5nS9P5J1bEAMPgo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=exiyie8qdOPFRNeAkoUmtV9ZIAhKQSZxGB0QJ/cCGhS3i3SZwFKFyPSQGmVqakpBDzrQLKfDZAP4Ih0iLeygJUx5w8cMMXvqDAZmtwyg5yFoHdV3vK3i8Jwzcp2m8zCOgKtVXH81gv2pS2Ar8I1oejVpi4DZ7eDYPjwp5uFINw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net; spf=pass smtp.mailfrom=laposte.net; dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b=DJiMqIkW; arc=none smtp.client-ip=160.92.124.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b="DJiMqIkW"
X-mail-filterd: {"version":"1.9.1","queueID":"4Zd5rz5Ncdz16Hmf","contextId":
 "e9f05809-8395-4193-bedd-7fe4cb9cf3e9"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0105.laposte.net (SMTP Server) with ESMTP id 4Zd5rz5Ncdz16Hmf
	for <netfilter@vger.kernel.org>; Wed, 16 Apr 2025 18:22:11 +0200 (CEST)
X-mail-filterd: {"version":"1.9.1","queueID":"4Zd5rz4Ypzz16Hmd","contextId":
 "cfbe5e9f-bb3f-4eb3-a285-5be93be8720c"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 40
X-lpn-spamlevel: not-spam
Received: from B550-AORUS-ELITE-AX-V2 (lfbn-ren-1-301-157.w2-10.abo.wanadoo.fr [2.10.138.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mlpnf0105.laposte.net (SMTP Server) with ESMTPSA id 4Zd5rz4Ypzz16Hmd
	for <netfilter@vger.kernel.org>; Wed, 16 Apr 2025 18:22:11 +0200 (CEST)
From: Kevin Vigouroux <ke.vigouroux@laposte.net>
To: netfilter@vger.kernel.org
Subject: Can the PCP field be set in the netdev table?
Date: Wed, 16 Apr 2025 18:22:11 +0200
Message-ID: <877c3kvzyk.fsf@laposte.net>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1744842201; bh=EUQqj7VSfFRuse+GlaSROLijh2+v5nS9P5J1bEAMPgo=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding; b=DJiMqIkW3qZv5kJ2VMoqQ+TGnbsXPzY6HIhpSJU0QZ+atzMOpWbmehwRtPfrPe597XPPSF9QWou/zqAKr/A19VWTkbbufRMpBikMjb1lWTu2/SSg3XekWiX1TiStbOthlsS7u7O9yyKn8+ulFxPPMG5dwRc4GA+IFgjQmEozwFJ7xLH4K1jbprWH46rw5P9wdNz4BBh5aSPBNgdBa70IOwQuzQHKY0zgMFjWT4zc0p8ZLukOLcnbv2s2WhJGcDs8FlaS3tf455xhRIjeyV6cvnq36aX1hFn8q5GPtTeyeGswjXFZPppzxTS6vPj74BOccKmgOds7gqBhiAqOetqmzw==;

Hi!

I tried in vain to modify the PCP field with many rules. Nothing worked.

#+begin_src
table netdev t {
	chain in_update_vlan {
		vlan type arp counter
		ip saddr 192.168.60.5 icmp type echo-request counter
	}

	chain in {
		type filter hook ingress device "end0" priority filter; policy accept;
		ether saddr 96:3f:66:77:df:88 vlan id 5 jump in_update_vlan
	}

	chain out_update_vlan {
		vlan type arp meta priority set 0:6 counter
		ip daddr 192.168.60.5 icmp type echo-reply meta priority set 0:6 counter
	}

	chain out {
		type filter hook egress device "end0" priority filter; policy accept;
		ether daddr 96:3f:66:77:df:88 vlan id 5 jump out_update_vlan
	}
}
#+end_src

#+begin_src
table netdev t {
	chain out {
		type filter hook egress device "end0" priority filter; policy accept;
		ether saddr 1f:9b:96:c7:14:d3 vlan pcp 0 vlan pcp set 2 counter
	}
}
#+end_src

#+begin_src
table netdev t {
	chain out {
		type filter hook egress device "end0" priority filter; policy accept;
		ip daddr 192.168.60.5 icmp type echo-reply meta priority set 0:6 meta nft=
race set 1
	}
}
#+end_src

#+begin_src
$ sudo nft --debug=3Dnetlink add rule netdev t out vlan pcp set 1 counter
netdev filter t
  [ meta load iiftype =3D> reg 1 ]
  [ cmp eq reg 1 0x00000001 ]
  [ payload load 2b @ link header + 12 =3D> reg 1 ]
  [ cmp eq reg 1 0x00000081 ]
  [ payload load 1b @ link header + 14 =3D> reg 1 ]
  [ bitwise reg 1 =3D ( reg 1 & 0x0000001f ) ^ 0x00000020 ]
  [ payload write reg 1 =3D> 1b @ link header + 14 csum_type 0 csum_off 0 c=
sum_flags 0x0 ]
  [ counter pkts 0 bytes 0 ]

$ sudo nft --debug=3Dnetlink add rule netdev t out vlan pcp set 6 counter
netdev filter t
  [ meta load iiftype =3D> reg 1 ]
  [ cmp eq reg 1 0x00000001 ]
  [ payload load 2b @ link header + 12 =3D> reg 1 ]
  [ cmp eq reg 1 0x00000081 ]
  [ payload load 1b @ link header + 14 =3D> reg 1 ]
  [ bitwise reg 1 =3D ( reg 1 & 0x0000001f ) ^ 0x000000c0 ]
  [ payload write reg 1 =3D> 1b @ link header + 14 csum_type 0 csum_off 0 c=
sum_flags 0x0 ]
  [ counter pkts 0 bytes 0 ]
#+end_src

I don't have enough knowledge to understand this issue. My device is a 802.=
1Q
VLAN whose master device is an Ethernet NIC (this is not a switch or softwa=
re
bridge). Is it a =E2=80=9Cdriver=E2=80=9D issue?

Any help?

--
Best regards,
Kevin Vigouroux
