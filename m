Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13246146D4B
	for <netfilter@vger.kernel.org>; Wed, 17 Apr 2024 15:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713367851; cv=none; b=En4U/+MctEiyYCzNvoCh0fWnlp9pbTN4TfOFspA5NyJdjT1AJlwR6AdX85vE38AytLQtzClPPJk8yQJsr784zW/I5gz/kT/MYqrlkNa7GGVxniZBlx/JK0UaSPqdYi/KO8WHWmCR+EZecQs3apYAbdkkTw2NIb/CI77mysvi7Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713367851; c=relaxed/simple;
	bh=fNabOlSD7bSM3QZNBXRGXcIXx1M9xgAFjwHVxG1OLEs=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=AUztysxUahLHsJtk2l4y4aW8OPZSlXxkawIgZjscIlm9bPSErtNNWjDeXK9amNUtE+eKQqBq9Y2OyOTNCc+xfaZEivXi3WR0xY9PFBfFRfFDCCNeuCoTWs0zZM2cfuzZFOLmfhplZg2L92bJ8Kc2cLVRWOrH7if2Onqbhu+eJ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=JIuYmovA; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=dgRriEyf; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="JIuYmovA";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="dgRriEyf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Message-Id:Content-Type:In-Reply-To:References;
	bh=fNabOlSD7bSM3QZNBXRGXcIXx1M9xgAFjwHVxG1OLEs=; t=1713367847; x=1714577447; 
	b=JIuYmovAcbi+kjqe7gIeU9x1CshIdn7G5L0IUwT7+Aq/eS6tQEiJqyJrZh6mHVwkJF8cj1DXyyr
	W/EifcP16wxRdI1qgR2HBFCjm4dMJ9dQsnQPV6dyee+NXMjc7epVRKVsWMRk8T4UE2J3aB6/JC+LS
	fgb90tKvOZiqj8sMlDw=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Message-Id:Content-Type:In-Reply-To:References;
	bh=fNabOlSD7bSM3QZNBXRGXcIXx1M9xgAFjwHVxG1OLEs=; t=1713367847; x=1714577447; 
	b=dgRriEyfIXHcbyehBu9pjoBMUf9Wiv1+g4yujLgI7rhH8juGXR9joYuVRC7mYXVLRzIwoLqK2WP
	jZjQ8mzKqDg==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3)(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1rx7FC-000NCR-0i
	for netfilter@vger.kernel.org;
	Wed, 17 Apr 2024 17:30:43 +0200
Date: Wed, 17 Apr 2024 15:30:40 +0000
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: Re: Combining/compacting 2 rules into 1
In-Reply-To: <20240417141230.0bc7b1bf@localhost>
References: <20240416174748.5612bd27@localhost> <20240416195445.41b40f624e2dbec1c593c789@plushkava.net> <20240416191250.04884e9b@localhost> <20240416210851.a9f14dc3c046ce42af06d87a@plushkava.net> <20240417082917.5cbb38ae@localhost> <890e6c2d-ed3a-4a0d-84ae-5cd1a2425316@slavino.sk> <d7419059-cfb1-40df-9280-c673775cb04a@app.fastmail.com> <fb8c2fee-c2fa-49ec-87f9-c563d04f3343@slavino.sk> <2e3ee5dc-0628-47c0-937b-21daac1c76c0@app.fastmail.com> <20240417141230.0bc7b1bf@localhost>
Message-ID: <D78A1AF0-4E66-4B71-A1C9-C9DFBD8C1C63@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 17=2E apr=C3=ADla 2024 14:12:30 UTC pou=C5=BE=C3=ADvate=C4=BE "Wil=
liam N=2E" <netfilter@riseup=2Enet> nap=C3=ADsal:

>hping3 also doesn't work with IPv6 though=2E

That is sad, i don't use hping3 often the bad boys run it
for me :-D But i consider it as great tool for both, testing
& learning, as good that i didn't realize missing IPv6, i am
sorry for confusing you=2E

But i see that in many open sourde tools=2E A lot of them are
very good, but old and lacks modern features=2E=2E=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
