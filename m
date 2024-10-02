Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67964194083
	for <netfilter@vger.kernel.org>; Wed,  2 Oct 2024 08:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727859063; cv=none; b=E+Nin50osX/nXgdV9ueBdCsvhhXUmIcrky/7WNW+hR5TV4MFqT5ayXHIix+i8IYjDTif5JYANtL0YOsIoXfOfmWRsIHMO4oIHNeIZaLhok773z/cOk6Mm2rp8KtfsNeJJllHH5T40alEsSpz0rMTtRY0bHFiU4/S63yxIktzt4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727859063; c=relaxed/simple;
	bh=4pM51LkfBWUdKQceeGLkTo8mOxtvtTOQdt2liqGjICI=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To; b=BZ2ZL0rqNXezZ6Oue5yB9xveeUPWn+VHSvQ41tg3qRBi6Qjgy53qSbXhLXaQYneTUpsseW4Gne6ThDsJQwO0O7G7B+Oe/EdmCeToi+Kat1oePMtrMaKBJnQhoksUTHYyoavaCY8CGZ9LbKZ2OXOF7K0JGJX6w7YTR8XtVuk1AKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rjp.ie; spf=pass smtp.mailfrom=rjp.ie; dkim=pass (1024-bit key) header.d=rjp.ie header.i=@rjp.ie header.b=RsRfbVjM; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rjp.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rjp.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rjp.ie header.i=@rjp.ie header.b="RsRfbVjM"
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rjp.ie; s=key1;
	t=1727859056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wp4f3zL7phnvgF2otzRkljAP/hp0570s+bFsnM0bA4g=;
	b=RsRfbVjMvAhl8ImFChDWPCN3yO18TX1UNEJhOzYOgJaIza9z5a5Ui/7z2vr+jU0jI6zALr
	81MiSWtAku2EI1d/PkSCyhO7iztAMwWdLdGYC/MPRLIQwtkgro5ty6UcJ4aWy/gH0qO5Fu
	s6sPS79RRnjcJdmSboId9zsVri5JeVs=
Date: Wed, 02 Oct 2024 08:50:53 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ronan Pigott" <ronan@rjp.ie>
Message-ID: <5dd9da7a3d3a2773ec124ceea3c516395526a73b@rjp.ie>
TLS-Required: No
Subject: How to count bytes?
To: netfilter@vger.kernel.org
X-Migadu-Flow: FLOW_OUT

Hi netfilter,

I'm interested in counting the total number of bytes emitted by a particu=
lar
application/flow, inlcuding ip+tcp headers.

In theory, this is what the counter counts, but the accuracy is broken by=
 GSO.

The man page says the following:

  Careful with matching on ip length: If GRO/GSO is enabled, then the Lin=
ux
  kernel might aggregate several packets into one big packet that is larg=
er than
  MTU. Moreover, if GRO/GSO maximum size is larger than 65535 (see man
  ip-link(8), specifically gro_ipv6_max_size and gso_ipv6_max_size), then=
 ip
  length might be 0 for such jumbo packets. meta length allows you to mat=
ch on
  the packet length including the IP header size. If you want to perform
  heuristics on the ip length field, then disable GRO/GSO.

But afaict, disabling GSO will not have any effect on the ip header lengt=
h
field =E2=80=94 large packets are still generated with len > mtu and rema=
in intact for
all of the netfilter hooks before they are segmented. I think this paragr=
aph
should probably be removed.

Is it possible to make an accurate count of bytes in netfilter?

Thanks,

Ronan
