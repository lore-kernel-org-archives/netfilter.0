Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793460120;
	b=C59hvNHAeUibCHkvQLsQObg08CJ9jwcdZ1XmEjKOixBb0CqLVpkcnjYuoF+lgyGR4nrp
	 1et+WhTFtA8zQ0KIVUzdBb63OmtA0d+6JQrKjEKVRtZS3ArJVTIc/DDgr/4WTsOlUMLmJ
	 56CGIdu6fEGULrWTlYbwx/x4zfPvXi7ZJmv5Rnft5Eja37uLELrue1y+KKzzVhg8w1VVa
	 qVXt1epiShgy60rBJgBzmrHi9JrQs21RxFmppkq+nHqhMar63BZafGOYsYcqH2WAxa/+i
	 CMGAjhmZq0EQpshnvp6mjROc4t6VvXvNyvFNo+yUhb6MKGK5x86SinHERi98MbyMoMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793460120;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SCxhG63YHAFXkOVH8UZ3UYS+hqElctg+27qUKpREdVQ=;
	b=MwUG7PosqJFkrbgQc2xCN/ojdB7WRjjqDbapRKEhhQvJbvzaZ6YvXj5b00whcSPXEABM
	 TNZOAdw0LqqMxFshZE5+RphUzWIWEOOI5KB+8/vHsb4BJccFJEm2iqXzzRFRCeRsLSsfP
	 x/QlLJOdAhxwx3fZ+U1rK/Xe4o+9+WRNgM6I5tevE45XvV7KuuYtr930qEkWNownR0DYr
	 XQCQGApeXmt5f37BPmTCKCcr9224pUdmnsGZ+kuph9diuVeA6phIJ4g9u6+t/ydKrZARN
	 +TGbC6UJMkVdKI4YZ2ohQW00ir2qpLLFve8wdMmiJlxBwXhkX4CoXnK7/rH4y/D3GAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=Nawok0QF;
	arc=none smtp.remote-ip=79.135.106.102
Received: from mail-106102.protonmail.ch (mail-106102.protonmail.ch [79.135.106.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C61606A31A
	for <netfilter@vger.kernel.org>; Sat, 31 Oct 2026 15:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49C61606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=Nawok0QF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1793460118; x=1793719318;
	bh=SCxhG63YHAFXkOVH8UZ3UYS+hqElctg+27qUKpREdVQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Nawok0QFnqeha/QtzBbE1sT1OVbWEPohFw7/zxzlvXIXqFf6BThHI9dL1PfPfaVJ5
	 G3ep3YVVnQmewbcNU2ZGrpiUdxEC4Yz624Zkh4q2Rvo0VQCl3R+c3Zzs1IQE8NF2n8
	 Tog2jAW3pEBI0gL747SF/gersOlUD7NxVDppn5XwUynjs1ztn3I4rZZiOi6lwYxTnZ
	 emwCdf6cJgH36wrt+XELb4gFn69AdxQHI4RZ7AX/vpLRihUT9XvFD1DkR5syB/fgJ1
	 z26RPP5Ab6GdIUxolR4GDD/VJj6ACl8VSbOZB9v664zNgy0iQJdcPhfBBcG+1qbwhn
	 R2QZleZGd4FuQ==
Date: Sat, 31 Oct 2026 15:21:55 +0000
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, "netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: Changing iptables backend on ipfire 2.29 Core 204 firewall
Message-ID: <tFPvjiny7aomwwtbNLJpjkgm6IgE6hF9RwKQuO5ZQG6PeyBvL5F4BOOm_7cQTXn-fNYkHZOAQ1rRiGA5QyTPdvTyl8CRMNetEBnnOzr4Glk=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: f8eede5d874ad70b6bead8aaafb3fc12c62dbd61
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:netfilter@vger.kernel.org>
List-Help: <mailto:netfilter+help@vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netfilter+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: Changing iptables backend on ipfire 2.29 Core 204 firewall

Good day from Singapore,

My ipfire 2.29 Core 204 firewall uses the iptables-legacy backend.

[root@ipfire ~]# iptables --version
iptables v1.8.13 (legacy)

Can I change it to the nftables backend?

Thank you for your advice.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals Singapore
31 Oct 2026 Saturday 11.21 pm Singapore Time






