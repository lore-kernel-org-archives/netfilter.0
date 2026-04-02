Received: from nikam.ms.mff.cuni.cz (nikam.ms.mff.cuni.cz [195.113.20.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3560635F8A8
	for <netfilter@vger.kernel.org>; Thu,  2 Apr 2026 12:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775133470; cv=none; b=Mr9zfv1Y+qxsnsbI7zTh6ugv8z1Zv8Oy57WBgaCuRWrDJBnNWsqyu7WsBDBa2xNwgwccJThWviUtGoct5A8Oqy8xADqiFWSgQz0UwSKRcRQvMdU2u7UuzW0WOj2n/WL1KCVbe1q2vPrslXeJiPvhdzbQ2tHIP4ZsAAdnGyKw76o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775133470; c=relaxed/simple;
	bh=Z6YEtvnRqjzmewBANs2NMYbZYBfiZzqFPlBftpvMDHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cE7KHNhI8Y5ieH+zfM2xa3qtRIn804c+iO3dTwV3rvBAfPgcMZT9yB2NOn6mLf9e0prNp8zvSzgvqJHRr4CBJqc7+XjqERZgDNNit/f9EU1nZYWOAeeVd3hTfKYRlZOVbrUr0jzNbJXIgBdRdr9aWPbPmjKa5OKDF9r/qr2JCy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=oJc8GX6c; arc=none smtp.client-ip=195.113.20.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="oJc8GX6c"
Received: by nikam.ms.mff.cuni.cz (Postfix, from userid 2587)
	id A7A61280F7D; Thu, 02 Apr 2026 14:37:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1775133452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OfX+dHML/VwNh5c+bdWAYA3DBm2P+o7CPJT4XEAHQSY=;
	b=oJc8GX6cKcYWChR5AxibUYrnLfUefuMAvxcPXAE9VhbrP/69tmMiFr0fcxZhBCAx2fo3Ma
	Zo/tyJLBE7v16f42B9arevsVJa/7ArGlAi6LRmZpnwH2gcXbk+g945mq3IJnyxmsIn+75o
	/HlJe/mfSvXSK0FvtnVHiurSDJ7FJ3k=
Date: Thu, 2 Apr 2026 14:37:32 +0200
From: Martin =?utf-8?B?TWFyZcWh?= <mj@ucw.cz>
To: Jeremy Sowden <jeremy@azazel.net>
Cc: netfilter@vger.kernel.org
Subject: Re: ulogd: logging IPv6 flows
Message-ID: <mj+md-20260402.123615.46599.nikam@ucw.cz>
References: <mj+md-20260401.114453.17525.nikam@ucw.cz>
 <20260401190727.GA5449@celephais.dreamlands>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401190727.GA5449@celephais.dreamlands>

Hello!

> The use of `ULOGD_RET_IPADDR` for both families is (or should be) fine.
> My guess is that there is a filter which expects `ULOGD_RET_IPADDR`
> fields always to be IPv4.  I thought I had fixed all of those.  I will
> investigate.  Can you tell me the whole stack?

My stack is just:

stack=ct1:NFCT,nacct1:GPRINT

[ct1]
netlink_socket_buffer_size=1048576
netlink_socket_buffer_maxsize=10485760
hash_enable=0

[nacct1]
file=/var/log/ulog/flows.log
sync=0
timestamp=1

				Thanks
						Martin
