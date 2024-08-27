Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4F018C345
	for <netfilter@vger.kernel.org>; Tue, 27 Aug 2024 11:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724757557; cv=none; b=uQweT4iGFjzZHgUCKSTfhZj6z2hH5uJtr0LM5uU9b+fS6UWtIJva1UZJKV+nooE2TOY3UHoOcYGGd5T+PNYbcIg879muUsH48jgcTQFieRLIcTfqsO60koQFm+ZbMCC6yCKAIIbavHrRav/qlkxeOGfjs8yN26o0dKwoV+iHpMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724757557; c=relaxed/simple;
	bh=iZj3/M/kNi64N0zAxNISq/6mYt9CKeL+JpxVnVgkzl4=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=EbCJVSIQBpBQvTGCGW+gFCiIiZBGohbeeWapJVVb6XxCkNa2CfrUskwlEbZaYc/AbSp8crUN/uJjhBoFDiQKkSyuuqBXgSN7eHQRevCpOoTXSNt7D4ZN9N43dhZul6FtI5Q2f9MJ8pnQZ+EeC14bvu5iDV2VIgSYsxg2Yoc6JSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=oafPEQnw; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=X6ewOtYu; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="oafPEQnw";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="X6ewOtYu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=9m25IcQynJ4fIZ5wvittyXcPP6oTca41AS5UoIHEVuU=; t=1724757553; x=1725967153; 
	b=oafPEQnwwqoKOOwceUmIPjyBKHhTDJf0TsOfZBa2H7fq/tS4OiJ/5t6YvC2/c3EoO5JPPqLQ4ko
	Az7/8/2KhWLG9eh6rBi7D59txnBbkfusb8D6LiXBRMic5+0oP19EnR36FDYhfOfCwawY7AjLAkJFM
	/g+nnbv/QnJhnSdaSM0=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=9m25IcQynJ4fIZ5wvittyXcPP6oTca41AS5UoIHEVuU=; t=1724757553; x=1725967153; 
	b=X6ewOtYuQ4dtGhTlqkyOikcxytB22xEeLWaQSMatxH4mqZWraMiSCtDId8Xc7h3/2IRz1xZuL+g
	AmgNoVcCECQ==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1siuE9-003cky-01
	for netfilter@vger.kernel.org;
	Tue, 27 Aug 2024 13:19:09 +0200
Date: Tue, 27 Aug 2024 11:19:06 +0000
From: Slavko <linux@slavino.sk>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: RE: Understanding output from "nft list"
In-Reply-To: <DM8PR06MB7717BFEA7F827B53CD0FA03CF98B2@DM8PR06MB7717.namprd06.prod.outlook.com>
References: <20240823185036.85bd988a1ee2baab2f73b307@fourthriver.com> <a4f113dd-9749-4fd8-bb9e-21eff30370dc@app.fastmail.com> <20240824003902.7c838f9e49773fa44b7d037d@fourthriver.com> <DM8PR06MB7717FA374DEC43522FF205EBF98B2@DM8PR06MB7717.namprd06.prod.outlook.com> <5F6FBD88-BFCF-41EF-8B7A-5047ABC992CA@slavino.sk> <DM8PR06MB771745C3C21BA67F1D90C848F98B2@DM8PR06MB7717.namprd06.prod.outlook.com> <F385FADA-1F1C-4F41-AEEE-C6BF2312D29A@slavino.sk> <DM8PR06MB7717BFEA7F827B53CD0FA03CF98B2@DM8PR06MB7717.namprd06.prod.outlook.com>
Message-ID: <DCCBA742-75FC-4731-BFF7-02243C09284F@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 26=2E augusta 2024 23:55:20 UTC pou=C5=BE=C3=ADvate=C4=BE "Atkins,=
 Brian" <Brian=2EAtkins@netapp=2Ecom> nap=C3=ADsal:

OK, thus in our topic, the chain is in mean of chain with hook defined,
nested chains (jump/goto, without hook) ends whole chain=2E

>If, say, you had a table of type ip, and another table of type inet, and =
they both had input hook chains, I don't think accept in one chain would ha=
ve an impact on the other table's chain, although I don't know that for sur=
e=2E

I asked about that in this ML some time ago=2E IIRC, it doesn't matter
on table, all chains with input hooks goes into input hook=2E The inet
family table just register its input chain into both family (ip/ip6) hooks=
=2E
The order of processing is based only on priority value, in case of the
same priority, the order is unspecified=2E

In other words, it doesn't matter if input hook chains are one eg=2E in ip
family table and second in inet table, or both input hooks chains are
in the same table, they both ends in the same netfilter hook=2E If packet
have to be accepted in that hook, all chains (in that hook) must not
drop/reject it=2E

You can simply test that by enabling trace and then monitor it, i created
ip table (for you) just with one accept in input chain (redacted)::

    trace id be75f3b8 inet filter input packet: =2E=2E=2E
    trace id be75f3b8 inet filter input rule =2E=2E=2E (verdict accept)
    trace id be75f3b8 ip filter input packet: =2E=2E=2E
    trace id be75f3b8 ip filter input rule =2E=2E=2E (verdict accept)

=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00Note "verdict accept" in both, in th=
e inet filter input and in the ip filter
input chains=2E
=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00
Another note, both these chains has the same priority and the ip table
is defined before inet table in config, but packet goes into inet table
first=2E

=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=00=
=00=00=00=00=00=00=00=00=00=00=00=00=00regards


--=20
Slavko
https://www=2Eslavino=2Esk/
