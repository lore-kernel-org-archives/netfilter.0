Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956B827D786
	for <netfilter@vger.kernel.org>; Tue, 22 Apr 2025 12:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325133; cv=none; b=S2U+pKwghlMZnVE5/w8bW70ZQvSG4H/fgotdX4KTxzl/cOf8l0jZ/64GRzJjFtRWN2Qw3BQDafwgCrfOMxlJTaltVRaMs7OIGBGOnqF1gd/kvdlXw/xdCUCpbVaecwLDBYC0+VXFG4JSnwTcTyAf1BeaWy1bMSqD10c6YG52UE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325133; c=relaxed/simple;
	bh=7S4l0wiGn6xE5mnxom27n9Ix58afAwZuVQFCpnduJ/8=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=sK7JH9zHDs+yvphUFtqtx38FyUwN0SVknpQiJyllfdybHbriJPr7QZSMs/F+F3s81H3fJboc7EVcjtieW7oteunpn5M68yrH5j8qk6U9nC+1j4HfwH8SELJgb4WExPtEr4Koo6oDXeDpfAvGOw+YCApjdhpReaH3ALmqrbRH1yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=PzcnDMEE; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=L9nEmELC; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="PzcnDMEE";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="L9nEmELC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=8oNNWlDFBtpt9RVOPn5FsPK/9VDT9YVrWsij9I/nfYE=; t=1745325129; x=1746534729; 
	b=PzcnDMEEcxDxql7v1jaP0Wu8LhA8rD2Ea7SqS3iBdfkkzgqaW/tjjzU8WlLWXLYs03iqe7/zbWn
	T23T+5XKvz5XqQYb+uQnKtfRhmoyL2TDjHIe4G1cWiNxCa1XPHhqrGFzu2jrMZ5QtO+drqxklIE/7
	CJ6fYaLuEWBlkTATnD8=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=8oNNWlDFBtpt9RVOPn5FsPK/9VDT9YVrWsij9I/nfYE=; t=1745325129; x=1746534729; 
	b=L9nEmELCHyo9vbFvocxfO2N6lnZT7lSfNZ7EvUH9dXu7jcSed0sM2kK7SPJvl2yUUv5RkOHAAHE
	kF4PQ23a0CA==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1u7CnH-000s6F-09
	for netfilter@vger.kernel.org;
	Tue, 22 Apr 2025 14:32:07 +0200
Date: Tue, 22 Apr 2025 12:32:04 +0000
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: nftables RP filter and loopback
In-Reply-To: <20250422114352.GA2092@breakpoint.cc>
References: <905173BB-6745-4B59-8795-F9AC1E063A38@slavino.sk> <20250422114352.GA2092@breakpoint.cc>
Message-ID: <622E44D0-8F02-4663-ABAD-01497C7D6692@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 22=2E apr=C3=ADla 2025 11:43:52 UTC, Florian Westphal <fw@strlen=2Ede> w=
rote:
>Slavko <linux@slavino=2Esk> wrote:

>This is an input chain=2E  The loopback bypass is restricted
>to PRE_ROUTING before v6=2E15-rc1=2E

Uh, oh, ah, i checked everything except this and i have in my
notes something as "fib outside prerouting can provide not
expected results" (without explanation), now i understand what
happen and too what that note means ;-)

Thanks, i changed hook to prerounting and now it works as
expected=2E

>(This is an oversight, originally fib was rejected in input chain, and
>when that restriction got lifted the lo bypass check wasn't adjusted)=2E

I didn' use nftables in that time, thus i cannot compare
behavior=2E Just to confirm that i understund you properly:

+ from 6=2E15 it will work even in input hook and lo as expected
+ before 6=2E15 it doesn't work (properly) outside of prerouting
  hook only with lo traffic (other ifaces works)

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
