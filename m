Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3D81CD31
	for <netfilter@vger.kernel.org>; Tue, 27 Aug 2024 12:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724760028; cv=none; b=epfbJg0r8SJY3ADmygt2uxnbT9Js+64BRQUTpHV04Yh4NwxgvtYfMeeigm2qnlNUenfkaD8YWL9EpEGPt2rNckBC+pf+3HqzbiFV66WWvU3hVD/Lyqt7HtOa9jOZ23oxjG2N5iYZ/vCCJ5elc7cn8ef7grDnZ6ggXNFsAGE0n3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724760028; c=relaxed/simple;
	bh=ayYeD5D01n3FfVVGEYR9OAiThxA9Mmxb9boTSzO4bw8=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=JqYHGeXHxr3TtC5t81/DBz0A2HVGV1Fbioadk7ae5My6lTYbXe9W7LqT8CfOwJ5AFkDApPSEbbkCiehdAFyqjhZSHe1VcMVE2xv1YfaD/vaPXDRycbO6kBACauBTKW6z3LX+S2wXY6KbAOVolCVo9DM0MGd4qxynyqs/3wINft8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=yKauo+vu; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=bNIO9PPh; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="yKauo+vu";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="bNIO9PPh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=ayYeD5D01n3FfVVGEYR9OAiThxA9Mmxb9boTSzO4bw8=; t=1724760025; x=1725969625; 
	b=yKauo+vuwHUDF9dUm5ixLzNcjuOdNiR4cCyXUJhMfdXt3FBeZzZw71HMlw4Jdxl+IovA920TWF+
	xHDc8dStK21p7RmlhdixCF4PLxlGtJl4vyrrIMcMAWfhwtIVipaPj+Nqam/Kk0G0d6WdzYXxr9iVv
	NhAAZRAGaEW74jvDAjc=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=ayYeD5D01n3FfVVGEYR9OAiThxA9Mmxb9boTSzO4bw8=; t=1724760025; x=1725969625; 
	b=bNIO9PPhWM19gyP6Nv9cHYPoL0jpSgsQju7jIpII02YO9BDvp8Sj3RTkChFT+REFQO+I0aWA5fb
	fhQof50Q3BQ==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1sius1-003e0d-17
	for netfilter@vger.kernel.org;
	Tue, 27 Aug 2024 14:00:22 +0200
Date: Tue, 27 Aug 2024 12:00:17 +0000
From: Slavko <linux@slavino.sk>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: RE: Understanding output from "nft list"
In-Reply-To: <DCCBA742-75FC-4731-BFF7-02243C09284F@slavino.sk>
References: <20240823185036.85bd988a1ee2baab2f73b307@fourthriver.com> <a4f113dd-9749-4fd8-bb9e-21eff30370dc@app.fastmail.com> <20240824003902.7c838f9e49773fa44b7d037d@fourthriver.com> <DM8PR06MB7717FA374DEC43522FF205EBF98B2@DM8PR06MB7717.namprd06.prod.outlook.com> <5F6FBD88-BFCF-41EF-8B7A-5047ABC992CA@slavino.sk> <DM8PR06MB771745C3C21BA67F1D90C848F98B2@DM8PR06MB7717.namprd06.prod.outlook.com> <F385FADA-1F1C-4F41-AEEE-C6BF2312D29A@slavino.sk> <DM8PR06MB7717BFEA7F827B53CD0FA03CF98B2@DM8PR06MB7717.namprd06.prod.outlook.com> <DCCBA742-75FC-4731-BFF7-02243C09284F@slavino.sk>
Message-ID: <85E5B96E-8163-4EE0-8C72-3C071E124446@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 27=2E augusta 2024 11:19:06 UTC pou=C5=BE=C3=ADvate=C4=BE Slavko <=
linux@slavino=2Esk> nap=C3=ADsal:

>=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00Note "verdict accept" in both, in th=
e inet filter input and in the ip filter
>input chains=2E
>=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00
>Another note, both these chains has the same priority and the ip table
>is defined before inet table in config, but packet goes into inet table
>first=2E

Huh some weird chars from copy/paste in android's ssh terminal,
invisible in mail app, sorry for that=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
