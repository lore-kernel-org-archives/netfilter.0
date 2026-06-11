Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5381D1DED5B
	for <netfilter@vger.kernel.org>; Thu, 11 Jun 2026 01:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781140004; cv=none; b=oYj52m1cncYQWvQBrl7lEV4/CXQvU4/jxCRWkOUGu7ed2i1gZse6laWKh+arEw929jf7kWfpzGk+cc2ZsCCDE8FCxxhLWkvMJf99jdmW9iM8rPxwuELb1lmnSpZV9ZeVQtdEt2cIH4b6lhQ3Kvw83iu9oofV58EDCX/p3tWIAaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781140004; c=relaxed/simple;
	bh=5+vZoj2Ctf3zFIeBX6C3nySwSWZHWm1IWULrcpNfW88=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=dSaHBMKkMgBW4YtjV0B+VYlOCnRcQJqS4o01oSIpQA9mkVnwam6P9Owy7fqlCjj82LklhM4J8utog2B60ylwNtQZWPss88ejbp8cCG42zXTCk37Hu/QWmAiFbsD/8Mc9hj7egjso+G8wxONFdbr7nvuWOJb4jMgUn9LaTjpMZBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=S1kWNhMQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EkJeAz6a; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="S1kWNhMQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EkJeAz6a"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 924921D0008D;
	Wed, 10 Jun 2026 21:06:41 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Wed, 10 Jun 2026 21:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1781140001; x=1781226401; bh=zMOdTXnkQhRcH3faoJ+AmX7iUaNgFNok
	5w5SwGyZf9c=; b=S1kWNhMQ5SwLSHIbAtKlr/Yges70xMP0WNert8Llu/VB8Vak
	noiu1uIvZ+qMoV3iyYOCuoGmEynxX0C8+jpFeXD8Pn/3ZD/AkaDPupT2US+9wDho
	IeHSdydp/paap5B71AyBnQbzagn4tzlYsoYvk+btDTz8CIVDT6ei0Zl5NyJxRkI1
	H2hm1ajQX4KiiZRbL7fV4bTVCg9Z9bMEPlQirVsFQq530HOna9lIWh4QNubiFZJi
	WyiIOfsriRcjI2GPhA6tVGMJQHNxVvGSZVJhn6h7Ug5eWoz9+YTJqXXeP0LPTv20
	6F5/q6iE+cV05bSR0b0DfoLN5/wdlImd7hWXSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781140001; x=
	1781226401; bh=zMOdTXnkQhRcH3faoJ+AmX7iUaNgFNok5w5SwGyZf9c=; b=E
	kJeAz6aew+UXZ47q4iNxP+bedWZtHSuk1cusjy+FEDusrnFakrX3riq2aXn9A5vL
	cQxejevU1P46Adm5fnPGilJTJLoOI4WNKRhragvRp/74Ss9RWmBMEIrTWIbJZzM4
	74P0YsFIZ8gTjgYmN0FnTPHAkLzgRMAu8Coptc/ebxEj17ckMNgCMKgYgtCyLBvk
	HHTuPuuXI5Jx8bErK/8b/274Opmc8oTgONALBj75D5rnVhSHWcD9PX9X7yhWOJ46
	TP4rLaI2jsbZev5HdxmLMoXlXoA9i0AzI/LtSeqbYo1YAzsQHXLiq+4meKc0pA2s
	Bc61HRHKjbNjSXewxzySw==
X-ME-Sender: <xms:IQoqahhvuewYbsUL4P5EHt6Fu5TTLm0cutlILUmSC-dzURarxO0neQ>
    <xme:IQoqag2xcnp99jbd_R5RSX52EyG_Izvm0p0THoePglPc3L7Yz_YTXuju-sZhbAHsz
    0nrG-EbOhM0JYBAfIJS_ioxZwKmd53RjtU86u0xV3PU1ohIqjg6Cg>
X-ME-Proxy-Cause: dmFkZTEZI6PgFIPUzTtfNPi+x+QKOhN/2MCrGlgVSrrJPQPrBUK5/Pd36yQOyx7BCdnL1J
    HZoAEVTosG6dPscdG8Ne3nxwFXkrEdJy45jW3kLdUhV40//W7HQ6BCU6QQ3zKeg+6lE4Pr
    TuQOoF7vIzFuTRV3rgZYoO/kKxGvDJkRZ0kTNsSiy3ifBGTiPyPh3Njrzwr8A7dtDFR9S2
    hyb/lOrG9Mdv3hjHV7a8rLsDwYDieoUiHBIaIYbitAZuM1BV9sly5NXsbsWw79Kkshjdv4
    g1WBLzUA+oRkHSYZGKEkIIixaCYn+juaRKOJdPreOcNWNj1O0vAnie7+0EBOLB7U6k+sdQ
    PBWJib+Eejcx1dV6cZU+IqwrRuaioHYnPLfPjIj7jYDO/FNO/GlgBEIIj93JyonsqDtKLF
    ZyJXwYjf6G8HBq6odH5Wj5+pm1eHjsXQllHpU9222vm7XPXHNI9jYrIC6urmNXXLqSmO6b
    MiwzdwWQnTJauzdJ0jtKpDeBbV8zWsXDpcLRdisZXQlRJWmi/fdo3UraiQljo40PqZq/Ga
    oo6UTFAb+JMokDyHA8debpXFzfRPlm2P9S0jkKhE7tM9GlufNLj//igx91YUnFTRBG+KZ8
    ix8bLQmS0NBcOP9+EORLk4wNVqpV7KtnoeM6q/yrrxjJ9YdHWI6ZemoyZbgA
X-ME-Proxy: <xmx:IQoqaq9pzH2m0C4ML-EIydEmwD6Hh_pr5mGRaw17o5orVE_KvFS9rQ>
    <xmx:IQoqaie9Gk93vZ2gOVsO38vp8IkX2U_rqqz-bSwvaqxgVoZA1x37Pg>
    <xmx:IQoqajEPqVBB23oi0TPdaPKungqLtByz-he6slwJU9emXb7ra8-TVw>
    <xmx:IQoqagf_XsVlTE5sE4binBOwoaw-_mK1X1w_M859lz2wWVJTWN1XCw>
    <xmx:IQoqatBqgO7zDyhNR57IHE2Tmfr1hTQUXKX5fuKA1_LVYqhGx7qlivED>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 168FE216008A; Wed, 10 Jun 2026 21:06:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AbmbupR3g_CV
Date: Thu, 11 Jun 2026 02:05:48 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: "Randy Bush" <randy@psg.com>, netfilter@vger.kernel.org
Message-Id: <8057b5ab-29fa-42b9-865f-2fbceaa0e94a@app.fastmail.com>
In-Reply-To: 
 <eo6IAy4tTDDl6AcRVB1pmRAiEEylNBe2EGlUxAsDHSglsWmdaXg-oFwfDcPGyTmYP17SvtgGpOOye8uy2u9lZLgPaxuTnUWPY7jiJEgpdM8=@protonmail.com>
References: <m233yv2r20.wl-randy@psg.com>
 <7b1ed82b-3bdd-4cae-bb08-7f8479778a7a@app.fastmail.com>
 <m21pef2ope.wl-randy@psg.com>
 <6fcf67b9-4fee-4b1c-85f1-597afff788ba@app.fastmail.com>
 <m2o6hi1hku.wl-randy@psg.com>
 <ead376de-4dd5-4725-86df-bf7cf798b672@app.fastmail.com>
 <m2ik7q1ff8.wl-randy@psg.com>
 <2c8aa7b9-b387-402f-be90-a59f8b669e30@app.fastmail.com>
 <eo6IAy4tTDDl6AcRVB1pmRAiEEylNBe2EGlUxAsDHSglsWmdaXg-oFwfDcPGyTmYP17SvtgGpOOye8uy2u9lZLgPaxuTnUWPY7jiJEgpdM8=@protonmail.com>
Subject: Re: prefix len confusion
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 11 Jun 2026, at 12:51 AM, Sunny73Cr wrote:
> Try this:
>
> table ip filter {
>     chain forward {
>         type filter hook forward priority filter;
>         iifname "lo" accept # please filter this too, you'll bounce 
> your bushies (brows)

Packets sourced from or destined to 127.0.0.0/8 are not forwarded: they're dropped as martians unless net.ipv4.conf.<iface>.route_localnet is set to 1, where <iface> is the incoming interface. Hence, in most cases, the commented rule there is superfluous.

--
Kerin Millar
