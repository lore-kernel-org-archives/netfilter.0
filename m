Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046A814BFA2
	for <netfilter@vger.kernel.org>; Tue, 22 Apr 2025 13:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745327742; cv=none; b=fCvEMCAleylXpuhnSpwt16joQG4+RfUlZc2hkn/pdHM2c49RS84mAQGsVCHDdLOmWoMzN9m5TePL0w0ZHKWG22F0LCBXDnBHQSP/wfezYp/2IghLGRRoEGjbzgSRtiizLYjW9BOYgyp7IsC7x0gReQT5yRqXptloCZ3g19yNmZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745327742; c=relaxed/simple;
	bh=dZgSfvHPsoGJhfV7ZV6j+E5jyWNdKNTujx76DmDI044=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Dj3I549Qu7xJQAV9AsHihxv1jorfNClgw0Eva/gYpdJgtirEpyevv9Do+PiDRNPDBQjYDSBUodS90TeZtDDXbzz1PwYKpR4//+bxzNV0kfV4mZhbv1K1ZTeypLZZ3xNXyuX3fqyk05r3fhPoFCLa+aWOlKEiJ/wRcxdMK1VunTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=gv9yZ21u; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=vZyRk1Dv; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="gv9yZ21u";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="vZyRk1Dv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=YwgKZ7wbbCN5MawBPRtful+pjYFZ8eTCDXGopglmAJ0=; t=1745327740; x=1746537340; 
	b=gv9yZ21u2/rCc2Hpn82F97BOs5atErHY+4xXvhfNzQlDl2ib/sa+tHhacVbhD3eZV7M/Zwn1X4B
	kihKxiO1OxFfcqFLXfIketMF1DnRPGroKVtyEjapUmYw6vD5lggNuo1XvyrrVVGgD3r4ODufMsYyN
	qe51pCtLGzhcIBKjDq0=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=YwgKZ7wbbCN5MawBPRtful+pjYFZ8eTCDXGopglmAJ0=; t=1745327740; x=1746537340; 
	b=vZyRk1DvWNACelVWDlLwrJQHgUiMPm934UrVxL3FKT1pXq27W7wupoY/m7n01lSRSIHzSGVcvn9
	GsA9ez2ykCA==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3)(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1u7DTN-000sF2-2b
	for netfilter@vger.kernel.org;
	Tue, 22 Apr 2025 15:15:38 +0200
Date: Tue, 22 Apr 2025 13:15:35 +0000
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: nftables RP filter and loopback
In-Reply-To: <20250422125351.GC2092@breakpoint.cc>
References: <905173BB-6745-4B59-8795-F9AC1E063A38@slavino.sk> <20250422114352.GA2092@breakpoint.cc> <622E44D0-8F02-4663-ABAD-01497C7D6692@slavino.sk> <20250422125351.GC2092@breakpoint.cc>
Message-ID: <C56FF994-7809-411B-ACBF-1FE2F6730CA2@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 22=2E apr=C3=ADla 2025 12:53:51 UTC, Florian Westphal <fw@strlen=2Ede> w=
rote:
>Slavko <linux@slavino=2Esk> wrote:
>> + from 6=2E15 it will work even in input hook and lo as expected
>
>Yes=2E
>
>> + before 6=2E15 it doesn't work (properly) outside of prerouting
>>   hook only with lo traffic (other ifaces works)
>
>Yes=2E  fib works fine but not for loopback traffic=2E
>

Thanks, IMO worth of (short) note in manpage, or at least
in wiki page=2E

refards


--=20
Slavko
https://www=2Eslavino=2Esk/
