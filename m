Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE6A40D57E
	for <netfilter@vger.kernel.org>; Wed, 10 Jun 2026 11:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090286; cv=none; b=hZutzmNNNG3UboHluhcL89ek1ZpgMi3oys2UwvznBgWty4khyeJT5ap5Rq+eQVRflpvVB2vzq4Rw/Uy3w5XNONvDcabWQy2UU0QBE2Ee6zuHg3JpUJvy0C0s/LwQzg8a/7/MykzwFjkV1QlS/lyy8jQXJ2NBKfm4PyCEDMbDA0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090286; c=relaxed/simple;
	bh=R01kFp57lBZRpXWXfghh83KwrOvf/n27juSPfd1TukM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIklry4gEceKZXnAAUG+ehvDHcx8S/4vUpTl6JLXG+h7pLgGcaTlFNf/l6A/FiZmHD0WJjvkQJO9UwzW3p3bhnN7dC/75oPBBW3kO36A0rBMWkqkrRIDS1S8Pu3yI2e1UmqMbPn6tvTz3rA2+qnhZaYYEla2Ex4ePmUQQnx9gOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=GmCuoHJO; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="GmCuoHJO"
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id A659E60196;
	Wed, 10 Jun 2026 13:18:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1781090282;
	bh=zXN9AnDAPBDHtaosfYTypOsJ0pxQ4+iscB1SEKzGK5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GmCuoHJOL8Zvsu9+T6wz83r86XHTPC2JHgpiMD5sKAGQ/lC+mRdBQcPNuqFSILDij
	 pP/5XQzYhBoiHxI4j1rfQarApr5leYvnFqIFqv3RGyBN3KU0fSRQ0+DrGPRbA9nHLF
	 JyBkFtQVoCyyl6b/8JR5iBSWDcxkX/moG365nZMm1LcsQghHecvWbdJFKLb+w7A49B
	 F8Mi1a1ImI9Vu25fxcgtv2X2BCpjNqX9MiGYRrAxaChQj0hwD1s8S1PsY/HF+8J3wZ
	 lVU55M9x/HoLBi/+Rmwsz4iwEu95eocyjhJkAQPsxj1GB/+IwxkK7IfqWpP4CJGlZq
	 vOwva7Q3i8DHA==
Date: Wed, 10 Jun 2026 13:18:00 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Kerin Millar <kfm@plushkava.net>
Cc: Jan Kasprzak <kas@fi.muni.cz>, netfilter@vger.kernel.org
Subject: Re: Logging SNAT'ed connections
Message-ID: <ailH6MomrFCvxH8Q@chamomile>
References: <aibwHhKDBOgr2p7M@fi.muni.cz>
 <90d53169-3ae6-40a6-a01d-7fae27d24c8f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <90d53169-3ae6-40a6-a01d-7fae27d24c8f@app.fastmail.com>

On Mon, Jun 08, 2026 at 06:53:30PM +0100, Kerin Millar wrote:
> On Mon, 8 Jun 2026, at 5:38 PM, Jan Kasprzak wrote:
> > Hi all,
> >
> > how do you log SNAT'ed connections for further forensic purposes,
> > when somebody complains about your public IP address and you want to be
> > able to find a local user behind NAT?
> >
> > I used to run something like
> >
> > conntrack --event --buffer-size 1600000 -o id,timestamp --src-nat >> $LOGFILE
> >
> > which did what I want. But now I tried to run the same on AlmaLinux9 host,
> > and it seems that --src-nat filter does not get applied - it shows
> > even connections which are not SNAT'ed at all, because they are for my
> > own IP address:
> >
> > [1780936563.343940]	    [NEW] icmp     1 30 src=128.1.227.61 
> > dst=xx.yy.zz.13 type=8 code=0 id=8724 [UNREPLIED] src=xx.yy.zz.13 
> > dst=128.1.227.61 type=0 code=0 id=8724 id=2525400839
> > [1780936563.343994]	 [UPDATE] icmp     1 30 src=128.1.227.61 
> > dst=xx.yy.zz.13 type=8 code=0 id=8724 src=xx.yy.zz.13 dst=128.1.227.61 
> > type=0 code=0 id=8724 id=2525400839
> > [1780936565.281121]	    [NEW] icmp     1 30 src=128.1.227.61 
> > dst=xx.yy.zz.11 type=8 code=0 id=8724 [UNREPLIED] src=xx.yy.zz.11 
> > dst=128.1.227.61 type=0 code=0 id=8724 id=2574615308
> > [1780936565.281167]	 [UPDATE] icmp     1 30 src=128.1.227.61 
> > dst=xx.yy.zz.11 type=8 code=0 id=8724 src=xx.yy.zz.11 dst=128.1.227.61 
> > type=0 code=0 id=8724 id=2574615308
> >
> > Here xx.yy.zz.11 and .13 are my public IP addresses. Why do these connections
> > show up in the conntrack --event --src-nat output? Thanks!
> 
> Unfortunately, it appears to be a bug affecting ICMP. Possibly here:
> 
> https://git.netfilter.org/libnetfilter_conntrack/tree/src/conntrack/objopt.c?id=7e5397b9167bdd7597be809b8f088ff333e1ad31#n189

Maybe then this helps?

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20260610103039.167819-1-pablo@netfilter.org/
