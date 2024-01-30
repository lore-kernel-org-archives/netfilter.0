Received: from wfout3-smtp.messagingengine.com (wfout3-smtp.messagingengine.com [64.147.123.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43446128388
	for <netfilter@vger.kernel.org>; Tue, 30 Jan 2024 17:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706637484; cv=none; b=Wk+WU2rZq6YF/kK8q6pnJiedvcOSpFX/2lbVg3PyjQu4gcIZF7KgrJj97iz6arbuPXW+ertuZ8CTbeIwXzJ9YNAks8v6ePcS/psaDC9l7AbHDtZY6ruZBb8p6hFVPExyGRXFrmrvWHUpBbFyywKA9rtaWEHE0UrZgjcqeVpEfEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706637484; c=relaxed/simple;
	bh=NaG7XLKdkJ0Z2AAZltrcLHnVjJI0Z380pkzzbxs3nbY=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=r6C7YsAR+yQjllEItY8InZVqfvBevq+LEQyAYevEexuRmYwo3n/jhsiPyJyRrOL5ZJ51FzY80WaOyc/xz/Ud4KHG1uW0/5FmBY9UR2/qvbmIP8EeYYVYb+C2LNbf9KaV5LQZz7Px81FW0Ktav62Ehu1fhE6chhgCStubMS5PVyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=se4KbEeL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rKkBI+ey; arc=none smtp.client-ip=64.147.123.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="se4KbEeL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rKkBI+ey"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.west.internal (Postfix) with ESMTP id 2F5EF1C00081;
	Tue, 30 Jan 2024 12:58:01 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Tue, 30 Jan 2024 12:58:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1706637480;
	 x=1706723880; bh=NaG7XLKdkJ0Z2AAZltrcLHnVjJI0Z380pkzzbxs3nbY=; b=
	se4KbEeL78clxqEuaW/diyDlUDTjw2O2EKkQOIAs3k/wwBagHUSDHjhwme+RVGmC
	bwjfTrzQP/mtUhTE4z/QrQX8bMl8oX9xeuvJaOnFrW+dKjHJEKQEYDp84Z0vVGOg
	Xb1TwfFubW4TfLcpzeStMU5Mhl31CScfKP/dC5hIV+SLffa12Qb/kHDHRa2hXn89
	nxRtXnQH9N4nxB+orwBO4eViGLTtn0ELtIrt8uz3ie4VIvj4B2kJzAh03Wfq00gw
	nTXKpeDnWCZtFURm6ocVeQwqBD0c0Ysx17/7K3rRTTD/pF+D6wynmKI+3520dQUC
	wuvz/xLF+j5PjNE/5NOK0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1706637480; x=
	1706723880; bh=NaG7XLKdkJ0Z2AAZltrcLHnVjJI0Z380pkzzbxs3nbY=; b=r
	KkBI+eyIyndbIw5hA0ASb2L3j7nVCgnNQPlDr2CsiEpdnwC5m+ef+FkzKe84uymb
	dUkQ/7MN1rUBl/XvneB8kVn6cFAflRLOoxog8TgQqStU+vyOYLBtmxBwcN3aL64C
	DMn19365d/Cdkx3WI0goA/8344B7fy8tTXt9i8nErkpaYQQmsjAirmOUAZTT/bbj
	l5UmSGs95Zc5NF1vYG79wl1qQqDxtm3Z7+qONvAWYazIua5ttafysoPYbOK/z6zI
	WrGG/8LVcPQlr8l4dSbFQyDKKKqDuBUlxgMpcjso/M1TFO+IdJb4zR9QZ8qn7PgI
	IvSASPMVF+yWxyIiri8LQ==
X-ME-Sender: <xms:qDi5ZaHCRGVbf4TWTALTOWAO0ZQVjuYR52aUYgzP0Lk-kp1aUBaxYg>
    <xme:qDi5ZbWghTfn3tL5tnL_fadch1w7aD0x2dve1vrOyK4E2wTxRjko9b9Bkt6MFxnVV
    v70jFr7zjM1IVhr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtjedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedfmfgv
    rhhinhcuofhilhhlrghrfdcuoehkfhhmsehplhhushhhkhgrvhgrrdhnvghtqeenucggtf
    frrghtthgvrhhnpedtgfdufefhffevvefffefgudfhledvteeutefhkeejveelfeeiffdu
    leelgeetteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:qDi5ZUJjhMYyZp7HqJIn71y1x6oTcSLnnY1REhxUWcDncIQ94LqE3Q>
    <xmx:qDi5ZUH7RnnqMDz3iQ76QIzNgYTaovoql4gLAzcUXE0bEy4gc4SBAg>
    <xmx:qDi5ZQUlJaN-dvv5jlNRd7iPjTRqj4CNtobERtk09iAeIREUPHHnvg>
    <xmx:qDi5ZbfN74KZAcy12z_R8-o6OybC7XmbVZdkxCxXlQDdEjpysYZnN81wGtE>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 34B681700093; Tue, 30 Jan 2024 12:58:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <eb589516-f7a2-4c17-81fc-fe2eecc6855b@app.fastmail.com>
In-Reply-To: <05FFEAEF-0123-4A2B-9607-B162D0AA6C61@slavino.sk>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
 <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
 <Zbj04V-90zpQwEzl@torres.zugschlus.de>
 <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
 <05FFEAEF-0123-4A2B-9607-B162D0AA6C61@slavino.sk>
Date: Tue, 30 Jan 2024 17:57:21 +0000
From: "Kerin Millar" <kfm@plushkava.net>
To: Slavko <linux@slavino.sk>, "Netfilter list" <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 30 Jan 2024, at 5:00 PM, Slavko wrote:
> D=C5=88a 30. janu=C3=A1ra 2024 15:17:32 UTC pou=C5=BE=C3=ADvate=C4=BE =
Kerin Millar=20
> <kfm@plushkava.net> nap=C3=ADsal:
>
>>Granted, one cannot create a set that is typed in such a way that an e=
lement can be either an IPv4 or IPv6 address/interval.=20
>
> Nowadays IPv6 becomes more and more common. While allmost all
> can stay on IP(v4) only host, not all can use IPv6 only host (yet, as =
many
> services are still IPv4 only). In other words, many will have dual sta=
ck,
> to can access (or be accessible for) all and they will need dual stack=
 FW,
> and IMO will need it for many years.
>
> Having separate support for IPv4 and IPv6 was acceptable at time, when
> ip6tables was born, but nowadays IMO firewall cannot be named modern,
> if any of its part separates that. And any argument (memory, complexit=
y,
> etc) against it is pointles, as dual stacks are (and will be) here.

It is easy to say that it is pointless if not the one to be responsible =
for implementing and maintaining the code and trying to take into accoun=
t diverse - and occasionally conflicting - user desires. There have been=
 various set-related bugs in nftables over the years. Complexity surely =
matters to someone. There are multiple open bugs now that concern both p=
erformance and memory usage. Efficiency surely matters to someone.

>
> Nftables now has inet family, that is great step from iptables. But st=
ill
> requires to maintain separate rules in it for anything with network la=
yer
> address, eg. mentioned sets (and for icmp/icmp6 too). I hope, that it
> is temporary state only and will be improved soon.

For it to improve, you could put forward a concrete suggestion as to how=
 it might be improved, be it supporting logical disjunctions in rules, s=
upporting a generic address type in sets or whatever else. That would, a=
t least, be a step along the road to (potentially) convincing whoever is=
 going to do the work that it is justified.

On my part, and despite having been a user of nftables for many years no=
w, I would prefer to see its QA and documentation improve ahead of - tho=
ugh not wholly at the expense of - new features being added.

--
Kerin Millar
