Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D5A1974FE
	for <netfilter@vger.kernel.org>; Tue, 29 Oct 2024 15:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730216862; cv=none; b=VyJhUGSCe5dDHySdBpNUCcCv7AsSwAnin1HG7v4Uj5vJzHiBY4APS3VSdtyqEOBE9V4mPEsiYoUO1EelSjDcKmYut5DtQRqIhO5OSccHufuiZRooxbJ0j2NtAaTxog2ZJXyBxPcYa21cU9jaElKIuM5i+S3h2XVr12CPDasrn0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730216862; c=relaxed/simple;
	bh=odaxn6qbvDBTf+jZLetOJYmvIgm5P56CCNTq2gzgwpk=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=gGLZhcTzpevYLEWF1WpXj9n21Rni7JxilyZAUZUJ5loGPdhc9ZxSvr9zW8gGjmm4HT56sTP0q9wTZFxtr04WzJ1JGudUNUk1clR6Gn2pIV1bbChhg6GAsgE8qa9eZG/DlFbdhU40RjCcpQtm502ZQA2bvAAAdfC0rs157aSzxjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=Te1gv4cF; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=hQQZP674; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="Te1gv4cF";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="hQQZP674"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=W/tLUvY4Jx2yC4ZEoG0HOeVbhb4Ez6oSwwBtgpV0dGg=; t=1730216858; x=1731426458; 
	b=Te1gv4cFXTQFduiN6+vcBEzatXCy03xPit2rXm0jes3KdCDoK+Dg74ZhoCm+riVN47ghZI2V1t7
	94QYSQQd1kNZG3YTbkT3g0QxvKTN0FQMb46v3gsp/RLQawv5Wcf4+L009VFYDkHNPBGKPYl8cc02Q
	WKp9RboyHquoEjWLeIE=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=W/tLUvY4Jx2yC4ZEoG0HOeVbhb4Ez6oSwwBtgpV0dGg=; t=1730216858; x=1731426458; 
	b=hQQZP674rUgPV4ZgMYrNwiAq772iSAxKnU70LS3S2hEe4usYrTxOtgcmoTP4XEafvNAnq+a5/aU
	UuRCVbUUyBA==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1t5oRN-002AEr-2t
	for netfilter@vger.kernel.org;
	Tue, 29 Oct 2024 16:47:30 +0100
Date: Tue, 29 Oct 2024 15:47:25 +0000
From: Slavko <linux@slavino.sk>
To: netfilter <netfilter@vger.kernel.org>
Subject: Re: connection tracking and kernel dropping packets
In-Reply-To: <CAOLfK3VUyrxBzd4sfk9Fhb8RnmQ8TAbszh0j2TD1a24WE-h74g@mail.gmail.com>
References: <CAOLfK3VUyrxBzd4sfk9Fhb8RnmQ8TAbszh0j2TD1a24WE-h74g@mail.gmail.com>
Message-ID: <771EECBD-1B8C-46F9-8429-B1118380F7A2@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 29=2E okt=C3=B3bra 2024 15:11:34 UTC pou=C5=BE=C3=ADvate=C4=BE Mat=
t Zagrabelny <mzagrabe@d=2Eumn=2Eedu> nap=C3=ADsal:

>=2E=2E=2Ebut it is still dropping packets due to the CT=2E

You have first to inspect what is filling your conntrack table:

    conntrack -L

Then you have to decide, if you have to add more notrack rules, or
you are under eg=2E SYN flood or so=2E=2E=2E IMO you forget that DNS can
use TCP too (not mentioned in that article"s rules)=2E

Do not forget, that "lo" traffic can create (a lot of) conntrack entries
too=2E

>I'm running Linux 3=2E2=2E0-4-amd64

IMO quite old, AFAIK modern kernels can do better with SYN floods
(via better SYN cookies approach), if that is source of your problems=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
