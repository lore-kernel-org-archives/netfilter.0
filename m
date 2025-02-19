Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812F62580CE
	for <netfilter@vger.kernel.org>; Wed, 19 Feb 2025 22:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740005019; cv=none; b=sI0hvDRZuaseknHDGZyEAji68cMnaNP7FV1vs32btR/EtCgQqaLKklvE42DQJcNUy+00ma/fOIkh5nBsOKd+NSoAQvFmmsZpUyLIOmDGdNR+tk4NVK/y/6/67xobTQ4b+VGjPoKehNNHyi16Tln2ku34hCXS+Mzh7jruxcSoBRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740005019; c=relaxed/simple;
	bh=4/tZ0MSqH4lu0tBPhFBYBMT8BdhrSNcb+QiPwk1hEb0=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=g1t27LIji6jRsdB0SVhnRGQ8ujjivSBlfXoZ9UVQN7v+Kn3svZZysmCNPMKORf0E0eSrFDRePb4SaXhEB0PQzLJwnUZMTkVlVMMJb6/mV4tdcq+K+DQezsS7jPdDW1wYMF7X+6cApjC+dHMcmj8HTa+e9r8LqJ9YNFUku/Db0ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=iNMRTFP3; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="iNMRTFP3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1740005009; x=1740264209;
	bh=4/tZ0MSqH4lu0tBPhFBYBMT8BdhrSNcb+QiPwk1hEb0=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=iNMRTFP3jPw9N8VcYwPnwgEKoBHBtCRwDG+xdowMxLMEblLuRfIun9J4USlVIebzr
	 RBICEs5px4vAK0Y6ddFaeu2h0KMyyWwwkwhOoIasTFXOvbJIIx2LHdipx6kzKEiaRP
	 6MpymFNylnUiTdDfvF/kpfH967RSySTzPRs/M+FmPUYHJRQF+c3mVV8L5hyB8tNOWC
	 OMC/oaVteSkGjvkKZIR/cr6rQSMXOuR7V0qjvrNZSLGwiOVnB1opLVQ68yyvgE4UMQ
	 n91wnilJuUDOQ9bNrJwhhEzvyh6z57N0MakaV1LyNinrVPf6VNMDNKvzBX4GU7IB0z
	 f7za4doGF5ZTw==
Date: Wed, 19 Feb 2025 22:43:24 +0000
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Subject: ICMP Raw Payload Expressions
Message-ID: <Aris5k4E14tRGyaRBMoLpJVwxj8ZQ7YAWng8XdmcCP-Ft4huCCAy7vfECg7hNuT96V_-83ag43NSThe0_lrUosHDmxumF6BELVRe_PRHeCU=@protonmail.com>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: d1e950754417b9ff17a563710213c0502b07e954
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Packet structure of ICMP-DU (Destination Unreachable) (in my case) is Eth,I=
P4,ICMP,ICMP-DU

It is my understanding that Eth is ll, IP4 is nh, ICMP is th, and ICMP-DU i=
s ih.

If I am to match the ICMP header, is `th` the correct offset?

If I am to match the ICMP-DU content, is `ih` the correct offset?

Thanks,
sunny
