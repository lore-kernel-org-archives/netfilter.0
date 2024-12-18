Received: from anxur.fi.muni.cz (anxur.fi.muni.cz [147.251.48.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A190D199396
	for <netfilter@vger.kernel.org>; Wed, 18 Dec 2024 12:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.251.48.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734523754; cv=none; b=gYZqMstLRe+bwQU70CkUo3QtTSI05Dmk5hTbHBZ9oxPx5/DYJACPeyX12gRodVmUZ86zT72wnpXUDEWFMu2SYDrHtDNXmXtuoCAx37CACo9YKfzq5BZkpVlQmbCgO7p1RkgUIixfVqu7/Y3WSDI9FeJkcuZPL65G/2a+5VywK7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734523754; c=relaxed/simple;
	bh=eKxjC1VX1oXnWNiVvUmJSdXj8tiM9rtL+Lf/MenC4Zg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lgadFyXM7mFaPwqx0lHDvNFX8pOECh8c5X+ImEIT37gx/CjPUnW7WC6q4rdc0XkVv9z4pA3lSBum4ULljAWkH9VNgxCCVdEeNu0qjOSJixVFq9PoeWSnjMJtFK4bj3Bi8MuTf+hsfJkdPreHTz8kP2WH+LFJMBq8Q47mj/V4Xqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fi.muni.cz; spf=pass smtp.mailfrom=fi.muni.cz; dkim=pass (2048-bit key) header.d=fi.muni.cz header.i=@fi.muni.cz header.b=camn/3h7; arc=none smtp.client-ip=147.251.48.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fi.muni.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fi.muni.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fi.muni.cz header.i=@fi.muni.cz header.b="camn/3h7"
Received: by anxur.fi.muni.cz (Postfix, from userid 11561)
	id 6186720920CF; Wed, 18 Dec 2024 13:09:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fi.muni.cz;
	s=20230215; t=1734523747;
	bh=Eqj1YgIQsxdbCf4eY6NaJSeppX3jpOKkKVRILafSHRw=;
	h=Date:From:To:Subject:From;
	b=camn/3h7ZBOgPd2UFcNcAo4RiQ4SJQqymfwtHYu5NJJw/pj3iIgCVA+OIWgCHb4iz
	 jkEzYBlk6C/CUXAdlTGjeTdd6cEcG+nylInl1OXNtGzBz5pJKe4rtop9p+IdKQnxOT
	 Yi2NU5dFukP1150tjsE50vwxu7mF5uHabJP1lLRS78xjAu0LmPrv/ydT+vmsZzNPEG
	 dCgIzRxslyXAApF6s6NmKap+FDWvtLnCXY+dFcO1g4jTCeoQg+0ozUFQMpEje5dYy9
	 09UCxL+Z/K/I66/OXxNs2954Iobzb3qhsz4bXhAAhT/+Sh+zzF9Bbx5piRhgqHZjsg
	 Ko9rByrzXNRYQ==
Date: Wed, 18 Dec 2024 13:09:07 +0100
From: Jan Kasprzak <kas@fi.muni.cz>
To: netfilter@vger.kernel.org
Subject: nft table flags documentation
Message-ID: <Z2K7YwrEyJqzTWtV@fi.muni.cz>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Clacks-Overhead: GNU Terry Pratchett

	Hello, netfilter users,

I am in a (long overdue) process of converting my iptables-based scripts
on my servers to nftables. I am also looking at what setup other users have
- I examined e.g. the configuration created by firewalld, and there are
some parts which I cannot understand from either nft(8) or nftables wiki:

> $ nft list ruleset
> ...
> table inet firewalld { # progname firewalld
>         flags owner,persist

- where can I find what these flags mean, and what other flags are supported?
nft(8) lists only a "dormant" flag in the TABLES section, but not owner
nor persist.

	Thanks!

-Yenya

-- 
| Jan "Yenya" Kasprzak <kas at {fi.muni.cz - work | yenya.net - private}> |
| https://www.fi.muni.cz/~kas/                        GPG: 4096R/A45477D5 |
    We all agree on the necessity of compromise. We just can't agree on
    when it's necessary to compromise.                     --Larry Wall
