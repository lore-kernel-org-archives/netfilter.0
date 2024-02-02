Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D8778689
	for <netfilter@vger.kernel.org>; Fri,  2 Feb 2024 09:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706866998; cv=none; b=dmr35nJtZNj7MEkRphk+7HP2dmOasGJyS3O9xyD4b/C51aBbY2VlMITjm61Jpo/QNoAVJGu9/Md5aj8odG8qWg+cRgdaKsbt3ua5H1C4+j2IYVJnZFQt8xGSOSeyULfM1cpnr6M7xIfOAgd4hMR9Itnta5eCOAos5CW6v7Mhilw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706866998; c=relaxed/simple;
	bh=XtUsUkg427pyM/Pzz+3AIKUmiyhpyfjZTggaow1Plaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZ1sXE+1YWOur3yBYa4XcjuTege4QV5xwMi/ilitGHUG0PBYfOP65QNpuLN2c18kSWKvYBzIy3qmgi+KdkAHj71tUZtgvi+RQnOgMkk3ziVPEoIo1yypq39fb8+XaY+0iYu+/zdDiZzyEQVJ2BHJ7LuFso+mNmulFUbz+8DUBO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.41.52] (port=54066 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1rVplJ-001fVO-3L; Fri, 02 Feb 2024 10:23:07 +0100
Date: Fri, 2 Feb 2024 10:23:04 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Eric <evil.function@proton.me>
Cc: Slavko <linux@slavino.sk>, Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-ID: <Zby0eB9G4Qi2DJbT@calendula>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
 <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
 <Zbj04V-90zpQwEzl@torres.zugschlus.de>
 <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
 <Zbom4bTPnkTMbLNE@torres.zugschlus.de>
 <5f76a328-4018-43c7-9f4a-86a1e2a4a94c@app.fastmail.com>
 <83255444-F0BF-4340-B721-976AC8E5B6AC@slavino.sk>
 <ZbrLg8luc8tbZALr@calendula>
 <exUZ0UdNDgp0QYgSrJwO6Mii6zqR8O6_g4DXCCBpUSaXsMKzVsfIu3VCaA2wclVn_TdAK96h6kue-LSw4vazUBY8srLkCQP9GiuObeJgYY0=@proton.me>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <exUZ0UdNDgp0QYgSrJwO6Mii6zqR8O6_g4DXCCBpUSaXsMKzVsfIu3VCaA2wclVn_TdAK96h6kue-LSw4vazUBY8srLkCQP9GiuObeJgYY0=@proton.me>
X-Spam-Score: -1.9 (-)

On Fri, Feb 02, 2024 at 01:38:46AM +0000, Eric wrote:
> On Wednesday, January 31st, 2024 at 14:36, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> 
> > On Wed, Jan 31, 2024 at 08:23:54PM +0000, Slavko wrote:
> > 
> > > Dňa 31. januára 2024 13:02:57 UTC používateľ Kerin Millar kfm@plushkava.net napísal:
> > 
> > [...]
> > 
> > > I check manpage now, 1.0.6 (as is in debian bookworm) and from its
> > > ADDRESS FAMILY section is nor clean (at least for me) the order of
> > > inet and ip/ip6 tables processing. It is even not clearly stated here,
> > > that packet will be processed in both, the inet and the ip/ip6.
> > 
> > 
> > There is a command to display the datapath hook pipeline per device:
> > 
> > # nft list hooks device eth0
> > family ip {
> > hook ingress {
> > 0000000000 chain netdev x y [nf_tables]
> > }
> 
> Pablo,
> 
> Is there a minimum kernel version required to get these to work?  I've
> tried it on 5.15 and 6.1, both of which just spin for a second and
> produce nothing.

Works fine with -stable 5.15 and 6.1 here.

Does your kernel turn on this?

CONFIG_NETFILTER_NETLINK_HOOK=m

> I also tried a bunch of other 'list' commands and got 'list ct expectation'
> to seg fault on 5.15, but it's fine on 6.1.

I have just tested on 5.15 and 6.1 and this works fine.

Userspace nft version and reproducer?

> (And all of these other 'list <state>' commands produce nothing on my machines.)

If you did not define such objects in your ruleset, then it is normal
that this produces nothing.
