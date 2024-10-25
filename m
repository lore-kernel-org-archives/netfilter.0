Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9891F7566
	for <netfilter@vger.kernel.org>; Fri, 25 Oct 2024 20:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729887533; cv=none; b=lC/ilFARNVFsp7fOe5hgz/VxcwLYuTv2I/UgRVk55UIZnAylCaAaFnHm+VlnHYyg1YnJmLyAfNXfASr++Ll8VwkTPRScPeoKO3ToeBP36bsNf794NMKAQNFXjP3avhCYeZSS12mHRFj9zsOURS7rhXwT7ruY6piI4PQp0iXHVow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729887533; c=relaxed/simple;
	bh=rFb9B2pkIMXj2AeJgq6bBmHxTkJzUspqL5Pqn/u6j9E=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=qeLQbtybPybH57zx2zLD8bVNbouglpgVkDzJDOatbraPwoEH8EsCIyUURUA3NxBm5lOXXNK0qrX5ASNnwPVzpXXtm7M6Mpg2kvtwheeX08OjFgYT/N8IlZulXm2MrjY6UkpucFHCDy7fsK1gzriXWg86fowNmC84zakq1jWXTDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=e3Sh1I4h; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=a0mJ0Oq/; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="e3Sh1I4h";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="a0mJ0Oq/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=rFb9B2pkIMXj2AeJgq6bBmHxTkJzUspqL5Pqn/u6j9E=; t=1729887529; x=1731097129; 
	b=e3Sh1I4hUv390eRi3T1R8oTGvtQMNDdSkqQcyAt1EDmzTJ5DRMDBMTGFGpTXWmys/AB+wL51ChG
	ii3GFe41H6kYh9zPMxAdcxjDG6ARiYCgkgM8b8Eq8jX6IeFGXete6Rc8qmUSa1FOWU1vj7HgV4luY
	dx/5XkXkaS6TmOFiOBc=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=rFb9B2pkIMXj2AeJgq6bBmHxTkJzUspqL5Pqn/u6j9E=; t=1729887529; x=1731097129; 
	b=a0mJ0Oq/HflixUsfzGmwSh/lC8KCd13TqA4saAKPQExQp+1I6mpSX/+0Zaw/YXZLRn90pRCJDAX
	HjdGqS6btDg==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1t4QgN-001qEz-11
	for netfilter@vger.kernel.org;
	Fri, 25 Oct 2024 22:13:15 +0200
Date: Fri, 25 Oct 2024 20:13:13 +0000
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: Re: IPtables rate limiting question
In-Reply-To: <85253915-6d36-483f-a84b-69de4a1ba161@app.fastmail.com>
References: <CAMa3rT49eeJT-rKdrVRXyfQd91cvQy=Cid55X2RFEpP4P5hFJg@mail.gmail.com> <85253915-6d36-483f-a84b-69de4a1ba161@app.fastmail.com>
Message-ID: <B840B6F3-FBF2-449E-9AE6-F713CE6BE111@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 25=2E okt=C3=B3bra 2024 18:12:56 UTC pou=C5=BE=C3=ADvate=C4=BE Ker=
in Millar <kfm@plushkava=2Enet> nap=C3=ADsal:

>To that end, consider taking advantage of ipsets=2E Below is a sample rul=
eset in iptables-save format=2E
>
>*raw
>:PREROUTING ACCEPT [0:0]
>:OUTPUT ACCEPT [0:0]
>:limitban - [0:0]
>-A PREROUTING ! -i lo -p tcp -m conntrack --ctstate NEW -j limitban

Please will conntrack really works in raw table? I live in that raw table
happens before conntrack=2E=2E=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
