Received: from anxur.fi.muni.cz (anxur.fi.muni.cz [147.251.48.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F203A19CC31
	for <netfilter@vger.kernel.org>; Wed, 18 Dec 2024 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.251.48.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734527364; cv=none; b=u2+JL4piAh18SaDfq3Tc1+bnNF2o0bOAOvsoExVlIREcfVdhPONxIl9CeolhaI3+OpCBn8odbnBkLbOztwm52VhD0tudrnSGzzmabvpgGZsWGp7FAk08vAQC+ocFSGntaofpEplvDNNv8vLixngkS/bOm9NYtlnggs+ztXlYP6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734527364; c=relaxed/simple;
	bh=D9hkuv/97ZeaTFrbGqgxgiXQFI7xHSoAbwFOtyd1wzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRTMnJxm6AbW87NWyyJ/dEtOOe2onXfwoTPC4vhU+K6gynhwnUVDjrM7J5Dk61gnKAgkfcwm5OrbDfyW46qAJCx6WMOVckbolL4iwX8jFVWVutUpY/2mJuGs/5N+HKh/1X5GSiq6IRbI/qSzNHbTulk7rToHFbcLsdu6OV4B8ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fi.muni.cz; spf=pass smtp.mailfrom=fi.muni.cz; dkim=pass (2048-bit key) header.d=fi.muni.cz header.i=@fi.muni.cz header.b=YC/wF23v; arc=none smtp.client-ip=147.251.48.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fi.muni.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fi.muni.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fi.muni.cz header.i=@fi.muni.cz header.b="YC/wF23v"
Received: by anxur.fi.muni.cz (Postfix, from userid 11561)
	id 83F4F208EB71; Wed, 18 Dec 2024 14:09:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fi.muni.cz;
	s=20230215; t=1734527357;
	bh=rzG4nFewckNGQ4lJ43AUyINb4EzV60q2REZOsb6OToU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YC/wF23vQLBMFe3pcmqv8ZYLxXUiZIZ1eRYP8erErPsI22yBSo4FSHbfK83YBkqKF
	 VmS9YxQ12VOLWQGDGwcNWYwX58V17ydgwonFQO5u3KD1CDcjXj7/nKe679qME/F4l9
	 eVN4M9eF7zF/xvCIEokg5MCqg2fctAT/GXSOoLW5M9maDDTAosTFgbs0dYe5F2jgvz
	 cHSePBgSlf0thRWjci4t07we0JWDEqdyhxr5wmyYsh0hBvNjXL15VRQR6Uy1qryblN
	 jhpSYKlfnmRKXjvyPltR3UhOZH4QBNOJ6Xdd/ej4SXPS38gf5nnGThBDhCIa/WkQ4i
	 X/PEueoU40Aiw==
Date: Wed, 18 Dec 2024 14:09:17 +0100
From: Jan Kasprzak <kas@fi.muni.cz>
To: Kerin Millar <kfm@plushkava.net>
Cc: netfilter@vger.kernel.org
Subject: Re: nft table flags documentation
Message-ID: <Z2LJfd2t+8E1cH8R@fi.muni.cz>
References: <Z2K7YwrEyJqzTWtV@fi.muni.cz>
 <4fa1f631-bf9c-4d20-9830-31d3e57297b5@app.fastmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fa1f631-bf9c-4d20-9830-31d3e57297b5@app.fastmail.com>
X-Clacks-Overhead: GNU Terry Pratchett

	Hello,

Kerin Millar wrote:
> On Wed, 18 Dec 2024, at 12:09 PM, Jan Kasprzak wrote:
> > Hello, netfilter users,
> >
> > I am in a (long overdue) process of converting my iptables-based scripts
> > on my servers to nftables. I am also looking at what setup other users have
> > - I examined e.g. the configuration created by firewalld, and there are
> > some parts which I cannot understand from either nft(8) or nftables wiki:
> >
> >> $ nft list ruleset
> >> ...
> >> table inet firewalld { # progname firewalld
> >>         flags owner,persist
> >
> > - where can I find what these flags mean, and what other flags are supported?
> > nft(8) lists only a "dormant" flag in the TABLES section, but not owner
> > nor persist.
> 
> https://git.netfilter.org/nftables/diff/doc/nft.txt?id=4955ae1a81b73f9a61b7fbf1a73e11544513548e
> 
> For your convenience, below is a textual rendition of the relevant section of the man page, as of nftables v1.1.1.

OK, it seems that I should stop assuming that Fedora has newer versions
of everything compared to rhel/alma/rocky. Currently both Fedora 41
and AlmaLinux 9.5 have nftables version labeled 1.0.9, but Fedora man page
describes only the dormant flag, while AlmaLinux have all three flags.

Thanks for explanation and sorry for the noise.

-Yenya

-- 
| Jan "Yenya" Kasprzak <kas at {fi.muni.cz - work | yenya.net - private}> |
| https://www.fi.muni.cz/~kas/                        GPG: 4096R/A45477D5 |
    We all agree on the necessity of compromise. We just can't agree on
    when it's necessary to compromise.                     --Larry Wall
