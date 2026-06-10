Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E047033FE15
	for <netfilter@vger.kernel.org>; Wed, 10 Jun 2026 15:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781105512; cv=none; b=XAxpDDCMMRJLFlTXXwAvgmj6GzqwujAUTZFSkR/yMCQgRlDEelHag3Npp972eqlGENXSTwf79mSRJurkzPg9lKOAHlkqPGEL3MKbdhq6oKF0ytQ4BTcOg9+FkffLI80i4cI48d+Cj2dYRlzf33XYkEpf7AJZ74ftavuQdG68s4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781105512; c=relaxed/simple;
	bh=yVyXaDYYiheUYuQd7qBun0lc2c2KmNxWB2l+QKpR7TU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tke/XZtlUyX5hM7l5kFn0O9BQk0XxwQH2xHa7/0Hm10gaZF7Ks+cniLkB6rapC43qvbKNHqgOUJHPpSXlBlRxE5h3x42wRiVEGHtjUCEHNbJdl9MXcB59ivTvwg8b2BT/VfJoUVJZTlT6TyEG4LeVH4lYG4NsBfZ+0d7OT5QTWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=O2qnXxLi; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="O2qnXxLi"
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 09B9A601BF;
	Wed, 10 Jun 2026 17:31:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1781105509;
	bh=MlRPSF7XbO5I1yMb9ELym2pphWtLaauhmn1YdNWi1Fs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O2qnXxLiivCFiqNJHLOHC7d0wSFoYc+KWONfAFHC7b+bJ9XPjWRbE0jv03wjuqaeY
	 /JS3VHiHazVIwwIUCtal/j0WRGdpklQfyeaPAowpR29NgaGeIKch/WsIDYazGGMw2q
	 YaW/ZpKsoGpUCYYecF4PS+3ulVE0AxaKOkn3SZbU06p0h2ehU6IES63cPxA8jsA5HB
	 dQg+juSW/rregHlwyyunaSBOfrOd/vy9WEX8fPWcOU6Z10gVXtSJ0PQgRVUMO0F44P
	 W4SGniS5lBWiAgDtk15E1bbxuyus5oMI6xlBmXiDtx93vOxmeBZTBEM4TJXnk9joow
	 ewIxkhO+D9u2A==
Date: Wed, 10 Jun 2026 17:31:46 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Kerin Millar <kfm@plushkava.net>
Cc: Jan Kasprzak <kas@fi.muni.cz>, netfilter@vger.kernel.org
Subject: Re: Logging SNAT'ed connections
Message-ID: <aimDYp2y_oxSIIzi@chamomile>
References: <aibwHhKDBOgr2p7M@fi.muni.cz>
 <90d53169-3ae6-40a6-a01d-7fae27d24c8f@app.fastmail.com>
 <ailH6MomrFCvxH8Q@chamomile>
 <74dd050a-3587-4fdc-b06f-c82a9fd398e4@app.fastmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <74dd050a-3587-4fdc-b06f-c82a9fd398e4@app.fastmail.com>

On Wed, Jun 10, 2026 at 01:04:54PM +0100, Kerin Millar wrote:
> On Wed, 10 Jun 2026, at 12:18 PM, Pablo Neira Ayuso wrote:
> > On Mon, Jun 08, 2026 at 06:53:30PM +0100, Kerin Millar wrote:
> >> On Mon, 8 Jun 2026, at 5:38 PM, Jan Kasprzak wrote:
> >> > Hi all,
> >> >
> >> > how do you log SNAT'ed connections for further forensic purposes,
> >> > when somebody complains about your public IP address and you want to be
> >> > able to find a local user behind NAT?
> >> >
> >> > I used to run something like
> >> >
> >> > conntrack --event --buffer-size 1600000 -o id,timestamp --src-nat >> $LOGFILE
> >> >
> >> > which did what I want. But now I tried to run the same on AlmaLinux9 host,
> >> > and it seems that --src-nat filter does not get applied - it shows
> >> > even connections which are not SNAT'ed at all, because they are for my
> >> > own IP address:
> >> >
> >> > [1780936563.343940]	    [NEW] icmp     1 30 src=128.1.227.61 
> >> > dst=xx.yy.zz.13 type=8 code=0 id=8724 [UNREPLIED] src=xx.yy.zz.13 
> >> > dst=128.1.227.61 type=0 code=0 id=8724 id=2525400839
> >> > [1780936563.343994]	 [UPDATE] icmp     1 30 src=128.1.227.61 
> >> > dst=xx.yy.zz.13 type=8 code=0 id=8724 src=xx.yy.zz.13 dst=128.1.227.61 
> >> > type=0 code=0 id=8724 id=2525400839
> >> > [1780936565.281121]	    [NEW] icmp     1 30 src=128.1.227.61 
> >> > dst=xx.yy.zz.11 type=8 code=0 id=8724 [UNREPLIED] src=xx.yy.zz.11 
> >> > dst=128.1.227.61 type=0 code=0 id=8724 id=2574615308
> >> > [1780936565.281167]	 [UPDATE] icmp     1 30 src=128.1.227.61 
> >> > dst=xx.yy.zz.11 type=8 code=0 id=8724 src=xx.yy.zz.11 dst=128.1.227.61 
> >> > type=0 code=0 id=8724 id=2574615308
> >> >
> >> > Here xx.yy.zz.11 and .13 are my public IP addresses. Why do these connections
> >> > show up in the conntrack --event --src-nat output? Thanks!
> >> 
> >> Unfortunately, it appears to be a bug affecting ICMP. Possibly here:
> >> 
> >> https://git.netfilter.org/libnetfilter_conntrack/tree/src/conntrack/objopt.c?id=7e5397b9167bdd7597be809b8f088ff333e1ad31#n189
> >
> > Maybe then this helps?
> >
> > https://patchwork.ozlabs.org/project/netfilter-devel/patch/20260610103039.167819-1-pablo@netfilter.org/
> 
> I have not yet tried it but shouldn't the helper function be checking against the protonum field? Also, the referenced commit appears unrelated to the fix. I think it should refer to b4c3a23c884c.

Thanks for reviewing, v2 is here:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20260610151735.192168-1-pablo@netfilter.org/
