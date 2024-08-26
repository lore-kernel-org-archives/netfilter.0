Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26AA1946B8
	for <netfilter@vger.kernel.org>; Mon, 26 Aug 2024 17:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724691760; cv=none; b=cWkvCSOnrtoCAIFxG58KzPNqBQWD+2Y4gpmoKQSBP1v64PbRP+5mHSoKCZXAPEuFRUc53JnIhJH6DL22+3cenA8gsGJuinG3g8iFdB0TMkBHgblw9auWXB1WV2Jj52psxF/6nQHUr7bosdjd2jyFBDEKXftQ5SglvoDw6ethvcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724691760; c=relaxed/simple;
	bh=ergrD3KbXQYxqfbZyDzStZ1g6aMAZI/O+vVZ3p3Z6FE=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=t9ra90k//AYu8RVyL622/MZgl/RybeNwfC9K2OJbeMBBBAZPb4vKUQGtned76NO+ZYsztM75jkIXlf8/oJKTamjhcjgCOPHqmn3C8GR/G8szCq2Q79wGMxYKhb43YOm3uVPUhDSZUMsF96nHJxW+cN3vKLfiQCblMIPrvf7kpn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=YCIy7vmV; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=3VK3ikSk; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="YCIy7vmV";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="3VK3ikSk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=gSDjSeiEboehdY3RdmvYDJdwv5JQCk5b7zeTpkGpgF4=; t=1724691755; x=1725901355; 
	b=YCIy7vmVNiV/4IM/DO33sdHhpB2N3FqxRVL2XtL6y2fOiUpeMd5QN5L5J9+btOP6s0JsPWoZZ60
	QSVi6H91SQViVzZoQlg+j9GatRFeNCXipl6f9T7yabRMGgZABzLVyGqAExrjBjFUqcD6mA70yGZJY
	QM86UtOsLMS18eokC1Y=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=gSDjSeiEboehdY3RdmvYDJdwv5JQCk5b7zeTpkGpgF4=; t=1724691755; x=1725901355; 
	b=3VK3ikSk7Syz7f8Jx2g3i4z6c6sgmaK4GGzJ2iV8CN2uODKORkIyE745ryQchcqmjCiGs9sCZz7
	vi8Yh9R/8DA==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1sicxQ-003Yn2-1W
	for netfilter@vger.kernel.org;
	Mon, 26 Aug 2024 18:52:45 +0200
Date: Mon, 26 Aug 2024 16:52:40 +0000
From: Slavko <linux@slavino.sk>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: RE: Understanding output from "nft list"
In-Reply-To: <DM8PR06MB7717FA374DEC43522FF205EBF98B2@DM8PR06MB7717.namprd06.prod.outlook.com>
References: <20240823185036.85bd988a1ee2baab2f73b307@fourthriver.com> <a4f113dd-9749-4fd8-bb9e-21eff30370dc@app.fastmail.com> <20240824003902.7c838f9e49773fa44b7d037d@fourthriver.com> <DM8PR06MB7717FA374DEC43522FF205EBF98B2@DM8PR06MB7717.namprd06.prod.outlook.com>
Message-ID: <5F6FBD88-BFCF-41EF-8B7A-5047ABC992CA@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 26=2E augusta 2024 16:32:23 UTC pou=C5=BE=C3=ADvate=C4=BE "Atkins,=
 Brian" <Brian=2EAtkins@netapp=2Ecom> nap=C3=ADsal:


>  'Accept',  on the other hand, accepts the packet in the current hook=2E=
  No other rules reachable from the hook chain are executed=2E

Are you sure with that? My understanding of "accept" verdict is, that it
ends processing rules in current chain, not in current hook=2E Thus rules
in other chains (with lower priority -- higher number) in current hook are
applied=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
