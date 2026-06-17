Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBFD2848A8
	for <netfilter@vger.kernel.org>; Wed, 17 Jun 2026 01:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781661158; cv=none; b=KEhixmN5aoC71gAbBYfiT1F4xUzj7tkjxIkD/cATC7wu/bwqlfHMFGraGoud5AQlNeXRdJ60+qDdQ42p7D1gHmTfkKsh7N0SX5NfuZsWS9+b4u+IpQDW1Ajc7S0TxN3N1lIBytixmqnSp5AIH4wZfCuMtTpka7kGCFuENl5buxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781661158; c=relaxed/simple;
	bh=mCrz5pEAO8atiPt97TSNRsM9Hb8rKnAUoNo88M3SqDk=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DGusgezDaNlPsGg1gg1X7B+jbuY+88xknUielbAYFJPbVFZqbSMNYw6AVDyNHmIV71wKRz5FrP/y5pBx/LcLejVhfopoDfjII7h0kVxYHuy8Sl+sMx797nENSTgJ1mTFTjnhi9KZU1vAkkxW1NmtWuezPUDRYiFyIzG43E4NkgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=nLH+H7vP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dCMNnWmW; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="nLH+H7vP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dCMNnWmW"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 0617C1D000C0;
	Tue, 16 Jun 2026 21:52:35 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Tue, 16 Jun 2026 21:52:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1781661155;
	 x=1781747555; bh=HddByqEWodUWh2i+nBL1sALvfLoDaIjSN52Pg6C2lZE=; b=
	nLH+H7vPKfg0SigTlUM3eUYHK7ANhwl2/ZPFJ+VtTWFyP1Fg0ZfyUfPRFot0AXnu
	9E2IFj0QsGxANW7Ins+v49EwCN7+CHcptyUdhe8S5YEuqmop+AMsa2XaA9ijI3V/
	Fw8Vx1GsOEvI3G9x8ML2e+f7c8iSFn/dKgcFf4WUcjsJ+5NFPdkFrz7MONmTRxZ3
	zYbZg+8rnGIyMSyUCtCgT9IF8ipC6MahW4UZ7hxqGTDNXGJ14mn31azHWhsTmOfi
	cM6j6QQ0AqKyRkxOChE5kZhkrYbil2QlFwDNHqYPShqfMHkROrryYChAV3w6hLuh
	UdNFyYcMOIe1lVc1kq7Byw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1781661155; x=1781747555; bh=H
	ddByqEWodUWh2i+nBL1sALvfLoDaIjSN52Pg6C2lZE=; b=dCMNnWmWTxy46ybmO
	+/M7mXYpZcikJVHGSePQCoH40Y42bCD31uB9VwYBoIpB+Gv9Pj46palg3hMFFeiY
	Lhdg5trbZa27eqPie9s2wVN1zxPYPWYBnS6XFbZb9hf5OCoS5xtKQtMS8wBsT3HT
	TF5EdXBA4DiO5uFoxknOqAsHqAOko43jUKXyhCA5FINKDBOoBS72M/iomJFbVWho
	8hJhA3ICWvW2n8u4Qz0d0+3XzyNEMu1qNEjrBr1VFKrLYFx4plsQH5pbOgLW01RZ
	ufGr59HiRDh17DtcBbMsPTnZl/W21eZWVNWmbZVp7L9N0y0atw0P4SC3Dlr5V8ER
	4CXVQ==
X-ME-Sender: <xms:4_0xaj8nBW-I8PeEQWUex5O_OBl7jgJevBfR36VDp9umKdR9RKvNcw>
    <xme:4_0xaqgjF5JYinWMcH7hIuq0cD8rQVy41z9O3BKUFr1jV2SEq-wQ3yQgkZ_pZ414h
    MyqE-WMuf9fYkNFLfvW__fP5Zf0nj4LwrGSwz27Pht3s4tZydI>
X-ME-Proxy-Cause: dmFkZTFmDZAf3VGZuprwqI6yDk6MDCsw32P3dsn3L2OKq9T8mwtqiNXg4ICok4BXdUi8M5
    mwWUhkOQCs6tYAjqNBu+H4HwsHliObS5bYmtV/SJvEMTWcQqGJHgBA0nzm1ASOGK/UzB9b
    2qxuPhYzJhyGD3FWISTjEXCFNcKbvgl6zllr2Ygl3Ke6XKV9JFvV8i4ooGbXNqhuJ6s5ZN
    O8q02Xif+mndnra3LeSY8imUPjqruJdTRoDH4qf3o1VumXc5Rt6kQ5CDIRY10TEYp9jTsr
    ypnuqVA7Jdbp5xNQdQugWzjSfrcjDtFToFNI5v8ygw8IeytPyQPrPqaN3JvBvbikLxbPHM
    7+HCfhyKUb5uK7zri8FKLdbxUijJ73Vpy891lbw+Bc64uvy8d97oRDiimPC3GE9r4RegUt
    1CrGFI8SKMcPZAIkFyZWzlCSIx7gfLObNu0UzPg5lNGNaH33n533PuUSQv2GN5ZudCsiZJ
    p8s26EjDX4tykaXSk/kymFdcOwBKvVLOiPX/qwm9FVzcs//XVHjQi99F429SYnG0e900rt
    at9VTNgbx46863t7IiYZ14ppsssFapovNrAS2rzSg9FrIgrrwny6CPt/ucHKQxMwn+bZwJ
    rpifuzM14gj+PpnPMj626pgx2flib/kIOTzLWTGtR+BZdMlzAAo0NklQzN9w
X-ME-Proxy: <xmx:4_0xaircc54d8AbMyasL9rvvxsRB0xPXojQLqdXTyzoEJJT8AytZnQ>
    <xmx:4_0xaunCtBkapBInRUUhZgnBwaeFmbyw-RupB6R_09WFGVuEjaU20Q>
    <xmx:4_0xauzQpv_u7qjUqpHhamJC5GT4UeFWCo_GEQ8BSSn3xQHOSgBp8w>
    <xmx:4_0xaunn4ph93ck2ZaBcNVkhFcWXUfl1e-g97tdLNSne9BRtqDM06Q>
    <xmx:4_0xavQFN7vvKuBmX0oVCrtL2tMsIxOmhZlQ4IoagyfdtRLelHiM3c5W>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9F518216008A; Tue, 16 Jun 2026 21:52:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A4AgOTky-GBw
Date: Wed, 17 Jun 2026 02:52:15 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Corwyn Briggs" <corwynbriggs@gmail.com>, netfilter@vger.kernel.org
Message-Id: <efd80966-8380-4d70-a313-b6d9585ef0b2@app.fastmail.com>
In-Reply-To: <8400bf65-82b4-495a-a5ef-4ad7a1fafb08@gmail.com>
References: <8400bf65-82b4-495a-a5ef-4ad7a1fafb08@gmail.com>
Subject: Re: No meta ibrindex/obrindex, only meta ibrname/obrname
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Wed, 17 Jun 2026, at 2:34 AM, Corwyn Briggs wrote:
> Hello!
> I am somewhat new to Linux and am configuring a custom firewall for the 
> first time. I have come across a discrepancy wherein the index of an 
> interface on a bridge (i.e. a veth bonded to the bridge) cannot be used 
> to match in an inet chain, but the name can be used via meta 
> ibrname/obrname. I would like to use the index since it is a bit faster 
> and my interfaces should not be dynamic, but meta ibrindex/obrindex does 
> not exist in any manpages I have read. I checked over the archive as 
> best I could and did not see any discussion about the feature either. Is 
> this an intentional difference or rather just something which was never 
> implemented?

Support for meta ibriport/obriport was introduced by nft v0.3, then changed to meta ibrname/obrname by nft v0.8.4. But these are only usable within bridge family tables. For the inet family, one would use iifname/oifname instead.

One cannot compare against the bridge index; nftables simply doesn't support this at the current time. However, the difference between comparing an index and a name is that the former compares 4 bytes, while the latter compares (up to) 16 bytes. The chances are that you would be wholly unable to measure any difference in practice.

-- 
Kerin Millar
