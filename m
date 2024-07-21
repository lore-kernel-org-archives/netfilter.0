Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053412AE9F
	for <netfilter@vger.kernel.org>; Sun, 21 Jul 2024 14:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721572728; cv=none; b=kKIW2aAqnJBJvTmXcT9gjjJFFDVK82rnqZ+SCj+FrKph/7ojYWY0/zqWiLFbbRwXTLgMy4Q2xsc3+GU9arz6XzF2XHSF5PZkSB7I2VlZGt8gsazDmL0Xd1rL44o2S85QMK6U6lM0Evl/QkD9bCk47K+hoafu6Uax+BuaftSmqsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721572728; c=relaxed/simple;
	bh=BpXWzXeryaXV1OdF3j+7N/U6x38z4reGgRgxk84lN7o=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=mp6fbRaUW+12SgMQhb9vMpXWPm+AFbRCSq730G5/6++Hb1X6zq0aWeKG0ncgjiO5GajcouRcTZugb5I6Ulb/pgAKzFplVMBs+w8irX5HQk8AnUt8gE9IEYUXW7brqIW0W+t0X5DAkJQ6nMkPAQ+MNtefpJ5px+ArDxUbK/9iYFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=PXBllCZk; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=ykaIhban; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="PXBllCZk";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="ykaIhban"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=BpXWzXeryaXV1OdF3j+7N/U6x38z4reGgRgxk84lN7o=; t=1721572724; x=1722782324; 
	b=PXBllCZkaaxqAKF5DCpZl//Jyv03ff25fCydYKyrs+VT3oXe2je7KanNvAMrFUF0rJsiy+FxVXP
	U8FvYtYmjOWlersaTFV5OcLah4s+m31map9/inQKMiTeVXm9WROaNmV5LcTY2FMB88xO8E6tEPIWo
	M2ghhM3t8XjcAk1HVag=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=BpXWzXeryaXV1OdF3j+7N/U6x38z4reGgRgxk84lN7o=; t=1721572724; x=1722782324; 
	b=ykaIhbanUYNHA4NNnYHMxU05YSXC3u/uKf/ZKsmeA/FVF2UUvv+bLqvz98uB82KH5jOnvlgIaMZ
	fF27Wh0jbBA==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1sVXhx-000PRQ-1v
	for netfilter@vger.kernel.org;
	Sun, 21 Jul 2024 16:38:41 +0200
Date: Sun, 21 Jul 2024 14:38:39 +0000
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: Sets update
In-Reply-To: <4a9d6e4b-61e8-4aa6-ac50-8cbb9357e398@app.fastmail.com>
References: <A1B9EF5A-1696-4A6D-B0D1-81DD32DC41C0@slavino.sk> <ba07a45c-7564-4b40-92de-ea698d16f49f@app.fastmail.com> <20240721132337.29d2fbc9@bonifac.skk> <4a9d6e4b-61e8-4aa6-ac50-8cbb9357e398@app.fastmail.com>
Message-ID: <9C0711C5-60F3-4A5C-A441-85EAFEC8592A@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

D=C5=88a 21=2E j=C3=BAla 2024 12:29:44 UTC pou=C5=BE=C3=ADvate=C4=BE Kerin=
 Millar <kfm@plushkava=2Enet> nap=C3=ADsal:

>You have a point=2E If on a severely RAM-constrained system, you may pref=
er to avoid the use of asynchronous pipelines and generate temporary files =
instead=2E Doing so would minimise RAM consumption=2E

Correct me, if i am wrong, please=2E=2E=2E

AFAIK memory is not problem in pipes=2E Yes, any pipe consumes some
memory, but AFAIK it is somewhat limited (i don't know exact numbers)
and if full, the writing process is paused, thus stops to produce more
output, and thus not consumes more memory=2E

On other side, nowadays linux systems uses tmpfs for /tmp, thus storing
output in temp file can be even worse (in mean of RAM) than using pipes,
as whole output is in that file=2E Storing temporary file on disk is possi=
ble too,
but doing that too often can drain Flash's lifetime, as modern Flash stora=
ge
are really limited in that (in comparison with magnetic disks)=2E IIRC the=
 disk
was used for pipes in old Unixes=2E=2E=2E

But yes, without temp file, one cannot produce the same IP list multiple
times (reading it into variable is the same), but at least second temp fil=
e
have to be avoided=2E=2E=2E

>You are definitely not the only one to think so=2E

:-) nice to know

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
