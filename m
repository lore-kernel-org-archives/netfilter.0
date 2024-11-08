Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED51199EB2
	for <netfilter@vger.kernel.org>; Fri,  8 Nov 2024 17:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731085988; cv=none; b=jPv3hCqxbQ4fCcWxPVRkal2b0vvqnV2gMI4iBff1hON81loKpAJrsbKwMymkpjujGJk2vZJ54Ype/v44O4i9cNCxGEoi7TKXJV1sJHImeOZ0RaEz6tIhM7mhDUg70usUOZI89jBzrT0cCSpczu33qHQLHPe500R+aQNOk6BVdt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731085988; c=relaxed/simple;
	bh=iZbFtdruhQfq340iuseRZTBbOm7ICyLkPka0ppR49vg=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=hcKIY9F+BJ85q9pZjyHFEPSlgbCVgxiR2sCjxK3Q0AbWHAwZ4AkOAnrVeoUf3Z8s4eC0kkeUtp0+OnBtXMzYEDMFPPqouVCrNoKJqT+ucvKE0fXCQKJVoslP1eVafYBRQincc5l/YIJa4Mr/wHVKkFufM7EvBmKWJtjGJrbGvfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=g+5h9mWK; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=T3MKnquA; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="g+5h9mWK";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="T3MKnquA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=ME4SofBI2lqYgLY84v9566Fvh9WnSVDvxii08z20KZM=; t=1731085983; x=1732295583; 
	b=g+5h9mWKUEkW0qjbA3tCkikzIlx2k5gFScIJglYIx7y005YBJVGj0g9ypfqItInnH2bMZ5Ga7a8
	FxhS2eb6of8jEXtBz1m7Eng2jrX4DjPueqZdd9koktf/pz6bu3LjGSk84BZMhLkQ/2oqGwVk//N23
	NQZFyhOI/ALTmaCLfbs=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=ME4SofBI2lqYgLY84v9566Fvh9WnSVDvxii08z20KZM=; t=1731085983; x=1732295583; 
	b=T3MKnquA3EXcI86PRiZxRkVUrl8ohVT9pI4NqdZie/QzDkLVcrAAE9EXJt1+WeaZMaEzQqUiOxr
	M3q1GvUkoAg==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1t9SPJ-003fmI-37
	for netfilter@vger.kernel.org;
	Fri, 08 Nov 2024 18:04:26 +0100
Date: Fri, 08 Nov 2024 17:04:22 +0000
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: connection tracking and kernel dropping packets
In-Reply-To: <CAOLfK3UWDAOAww10O2NxFBPgLa+Rr92=Lw+qFb1fxDOhD_6Dgg@mail.gmail.com>
References: <CAOLfK3VUyrxBzd4sfk9Fhb8RnmQ8TAbszh0j2TD1a24WE-h74g@mail.gmail.com> <771EECBD-1B8C-46F9-8429-B1118380F7A2@slavino.sk> <CAOLfK3UWDAOAww10O2NxFBPgLa+Rr92=Lw+qFb1fxDOhD_6Dgg@mail.gmail.com>
Message-ID: <E750F0BA-6121-47D6-8CC0-0B636949CEF0@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 6=2E novembra 2024 17:44:50 UTC, Matt Zagrabelny <mzagrabe@d=2Eumn=2Eedu=
> wrote:

>I've waited a week to let the TCP streams in the conntrack table time
>out=2E I'm still seeing the kernel drop packets:

># cat /proc/sys/net/ipv4/netfilter/ip_conntrack_count
>65536

># conntrack -L > /dev/null
>conntrack v1=2E2=2E1 (conntrack-tools): 22 flow entries have been shown=
=2E

Your system seems to be broken, you can have zombie connections or
you meet same (old) bug=2E

Try to reboot it, with a little of luck it will solve that (i roughly reme=
mber
some problems, in old kernels, after conntrack become full, but i am not
sure), othervise you can start to track it from zero and try to find sourc=
e=2E

Perhaps unload/load the conntrack module will help too=2E=2E=2E

BTW, you can show conntracks count by:

    conntrack -C

You can test which number it display, mine matches=2E=2E=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
