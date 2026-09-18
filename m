Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E3A4A689A
	for <netfilter@vger.kernel.org>; Fri, 18 Sep 2026 12:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789735396; cv=none; b=YmY4YhsA1T0aavBDw16qDQE7Gs43vEeRIhCM/ocpNxfdjAWfjLYKLWfDMyH7eMTQAlx/WXBPtpsGTPGbYDFyPDfhLhp/zBo2pcNCw3fEKbA4028m+ZK9pfi+TOT36ojOYtYfCqG7T1PYNdTeU5YkgdyX/48EMgnvQn9MHTmSt8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789735396; c=relaxed/simple;
	bh=g/J6LHM4j+e89UvlvqdW6pzj7dIaH+RTNlCi9wtlwRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZ/3u0g9X/EcuMGtz8mOCpn2/cIEWdalJDCNS35mxSz9ebz7tZdQCKpDDSFFqBO/2TwToofmTUA9d5HEShiPIA1B24+Yr7iltHCgmgpj4bPhMwW1XUub3GWtKU2G9xma3l2j1lIZt4PoI8wiJbfuPEme7YVljK1HV+TYVh+RFTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=Z0Tjadhw; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="Z0Tjadhw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1789735385;
	bh=rPj5JryDa8YUJPDrFM2NspMqowW0Vb4YkshkX6jiYiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z0Tjadhw1f+Tt8UQw87x/633Rom1XNHCrsThK5lmT1RpBQPGkC8+eVnVikKTH/mrZ
	 Yr9gze/Tlm+GJQRULR6zk8T3VB/orJ+gH+w9dRhfbGqdVCwd+jJ29riMr0kX8/xhkl
	 UDKocN4r0Oif+ojYo/9FZ5gk7YHAa0rdogkJz7Z2PllhLnXHWwD4pGRijVBlMspkdf
	 MhJyHG4SPy5VbCYAQwvsdq5lUolwsfYepU3ew7wcGWSXrnq7QHGAgT+CKOztBeV1gK
	 TwAJlUWt54+ull6+cIQSf/aqLt06iLaK3wZL4IT9qijAbtZQfV5EqA6a2fiftYcB9+
	 sicGGEznpLGHw==
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 02A9F60057;
	Fri, 18 Sep 2026 14:43:04 +0200 (CEST)
Date: Fri, 18 Sep 2026 14:43:01 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Kerin Millar <kfm@plushkava.net>
Cc: Henrik Nilsson B <henrik.b.nilsson@est.tech>,
	"netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Question: is git://git.netfilter.org/* down or have the git
 repos been moved?
Message-ID: <aq0x1ZnENM_jd5Fa@chamomile>
References: <DU0P189MB22277AA490C5FA005F58391AB7872@DU0P189MB2227.EURP189.PROD.OUTLOOK.COM>
 <31fdb556-e3ba-41ee-88a7-a93e3d772301@app.fastmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <31fdb556-e3ba-41ee-88a7-a93e3d772301@app.fastmail.com>

On Fri, Sep 18, 2026 at 12:50:29PM +0100, Kerin Millar wrote:
> On Fri, 18 Sep 2026, at 12:05 PM, Henrik Nilsson B wrote:
> > Hi all,
> >
> > Is git://git.netfilter.org permanently closed down or have these git 
> > repos been migrated to some other location?
> >
> > I have been trying for a while to clone the following git repos without success:
> > git://git.netfilter.org/libnetfilter_log
> > git://git.netfilter.org/libnetfilter_queue
> > git://git.netfilter.org/libnftnl
> 
> For what it is worth, the https:// scheme works for fetching. 
> 
> git clone https://git.netfilter.org/libnetfilter_log

Yes, this is preferred.

git over tcp/9148 has been restored now, but it might be disabled soon.
