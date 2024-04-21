Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DCB205E22
	for <netfilter@vger.kernel.org>; Sun, 21 Apr 2024 03:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713671157; cv=none; b=u+8XfKLaD66ekIVM/pZjUXDMekCFERk5t0td0Jo55i84Z2aS8NWeFelbtrGMTIwDorvo0vi/OFSu5WI+iw9AwtvxMrFpXap4jYNhXdurcbC9HbGp4Av4mcgmIygniZP680CXgJ/WVB7dLpyUQot3SiuPqNsOuu6u8ZdKHDQseLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713671157; c=relaxed/simple;
	bh=DcNqW7JL0ZQ55dILZLKbvBdq8IMKnz2GsLrS/8YJT0A=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VbU3PiOt6xyRH3xDVFWSnGFi9hO0X1oEeejGnlR/7G9lCqF6D03FsWUAIdFnc5l7yRA3CQLVdB2V8ZTnTl7hsYuqsnYC/VNFRlDG7pq4DHfxlYd8P4kAoGzDubiG8VnkyTypWLyXqJEYuD8hLC6A4f+1q9X3zM2D9Mgih4hc5ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=haeKG37e; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="haeKG37e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1713671134; x=1713930334;
	bh=alVCrKbDChxCJ0e177Ug/E/r+oePU7CsgiaxlbcfTXE=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=haeKG37ePTCAEdSdCwHMQB9dBP8nHLAy4pGxUiGtw4jjKPgj+bxh+nEfVbG8588sO
	 jqvaapO0Lc8566rI8YKgkReSLLpyarpfzLaZvlPbD+T8Ar0i0ZYAklKbP1eFVIn1p7
	 bRvIqYk6xeErOaUz+KENLKYSJmctaeqEcgpOgjck3Kvtc8LsY3RbwX2ss/HUoUzGQJ
	 QWsr52C9FSU5NvY+eXxDv/dmlWNOxWc1t9359xyv2e3GrUq614GPdj5Zg8c0/JKrA0
	 D+5XbTl5wolj/q6G68i5dY6qL46id49+kN3i6x9pLRtYpiGfmFz18rHrmC19Zz1fRK
	 3SCbZkFBCtTIQ==
Date: Sun, 21 Apr 2024 03:45:31 +0000
To: netfilter@vger.kernel.org
From: Eric <evil.function@proton.me>
Subject: Re: [Thread split] nftables rule optimization - dropping invalid in ingress?
Message-ID: <rNVqfcHpj4XyJlxISjkKDdyRHbyPqlyF8MOHq07xz1_V3vc99maPQTsAuxgA2PZNbvff2dUfl2s0YdJBI4muw8A7FiMeKu2KvnjK0fG7kYo=@proton.me>
In-Reply-To: <20240420183750.332ffbad@localhost>
References: <20240420084802.6ff973cf@localhost> <20240420183750.332ffbad@localhost>
Feedback-ID: 48716100:user:proton
X-Pm-Message-ID: e689a2343d0dc00dbfd5665407652cbc958b8569
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable






Sent with Proton Mail secure email.

On Saturday, April 20th, 2024 at 11:37, William N. <netfilter@riseup.net> w=
rote:

> After spending some time looking for more info and based on this:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/n=
et/netfilter/nf_conntrack_proto_tcp.c?h=3Dv5.8#n700
>=20
> I think I figured it out:
>=20
> tcp flags & (fin|syn|rst|ack|urg) !=3D {
> syn,
> syn|urg,
> syn|ack,
> rst,
> rst|ack,
> fin|ack,
> fin|ack|urg,
> ack,
> ack|urg
> } drop comment "TCP invalid"
>=20
> This checks the listed values against the mask "fin|syn|rst|ack|urg".
> The same values and mask are used in the conntrack code, i.e. it drops
> invalid TCP packets.
>=20
> According to my own tests, this works in the ingress hook, i.e. early
> drop.
>=20
> The only question that remains is performance measurement and
> comparison, as mentioned.
>=20
> Please let me know what you think.

I'd be very interested in seeing some statistics on how many actual
invalid packets you see on a live link.  Stick some counters in there
and collect dropped versus passed packets...

My naive guess would be there are only tiny percentage of rejected
packets.

Eric
