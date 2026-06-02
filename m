Received: from anxur.fi.muni.cz (anxur.fi.muni.cz [147.251.48.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD28339861
	for <netfilter@vger.kernel.org>; Tue,  2 Jun 2026 19:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.251.48.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780429472; cv=none; b=DggapyYjMUHve2++C6jNLpehtsuB0b1uEC75DbxmLoujW9AEloO/OUR83G5qZdymmUKKbLgiVtM2f0h3FALJLXcXT7Gt3cWudD7z20UnQ94Mb1RaKQbbQLNMPSzUuT04R0zZuhcC34GK43+w9eHqoc1MF43nkrZNLH0vQS6iss8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780429472; c=relaxed/simple;
	bh=8waKWAKHpvQbWxu2/hMSiuVDlkmRC+PyZy62CRq6W0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hf/vN3nyOXcq5huHB0B6lctyJYZz7ekJDP8tsER1TrcYYeZl8VTDAkAloPKqCAbr2JmCre0XtSEPRBpJK+5xPubzqmbZtohhhxF7v6iceUYmmfQLtWd9GEdv7eMRM2D4wv5mVetWw5jUVDw0oMLwsXrZPoimCQQuvyActyr2mz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fi.muni.cz; spf=pass smtp.mailfrom=fi.muni.cz; dkim=pass (2048-bit key) header.d=fi.muni.cz header.i=@fi.muni.cz header.b=Hk5YiLWr; arc=none smtp.client-ip=147.251.48.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fi.muni.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fi.muni.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fi.muni.cz header.i=@fi.muni.cz header.b="Hk5YiLWr"
Received: by anxur.fi.muni.cz (Postfix, from userid 11561)
	id A0F1D208DD1F; Tue,  2 Jun 2026 21:44:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fi.muni.cz;
	s=20230215; t=1780429464;
	bh=nRRuqwsW7ulolD99lM3W4ddpG7nPlCCTp+ZlycRo7sU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hk5YiLWrqXJCklMpt6uIupAngOdaC2I2ek1buP3iVxZFhi73wa6AAVPGJpi9n0pQi
	 YqkiS4cdQTdQV839Oveuv7u6zPVGKP6YfbKxdmdttzq0V9h5H+okQTr0qo+XmIXQKv
	 RxZG3uorHl5QjfB6G9iT7ukPVC+EaJEOY3Kr/FHJJYdn2uR4kI0qz9HXogorTnQQRH
	 IChxuICy+DU4DNOjgfQpGtKZdBKgJB1Qh6e5Pa7huKsOAjqMQXMk8sz+6nWS+T0TQU
	 N+fLGC1MI0a5F2M5zt4aAFsH6Lzt3mUzyY4iHWimEsJVoey8TbyrcRP4TufQrk5Rm1
	 eyZDi9vROy6YA==
Date: Tue, 2 Jun 2026 21:44:24 +0200
From: Jan Kasprzak <kas@fi.muni.cz>
To: Kerin Millar <kfm@plushkava.net>
Cc: netfilter@vger.kernel.org
Subject: Re: conntrackd master-master IPv4/IPv6 configuration order
Message-ID: <ah8ymM00JGqUZZYW@fi.muni.cz>
References: <ah7ylcA705Ai0HQi@fi.muni.cz>
 <93605739-24d5-4402-9212-b06ffefe9b46@app.fastmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93605739-24d5-4402-9212-b06ffefe9b46@app.fastmail.com>
X-Clacks-Overhead: GNU Terry Pratchett

	Hi Kerin,

thanks for your insights. Some follow-up question:

Kerin Millar wrote:
> # To be run by the script that commits the IPv4 states into the kernel
> conntrackd -C /etc/conntrackd/conntrackd-v4.conf -c
>
> # To be run by the script that commits the IPv6 states into the kernel
> conntrackd -C /etc/conntrackd/conntrackd-v6.conf -c
>
> The same goes for the -f (flush) and -R (resync) options.

I have been thinking about going without takeover actions altogether.
What could possibly go wrong if I commit the state from an external
table to the standby node kernel periodically? For example, to run
conntrackd-v[46].timer systemd unit on the standby node[s] all the time,
committing the data to the standby node every few (tens of) seconds,
and should the master node go down, use the data from the last commit.

Of course I will use a dedicated socket and port (I use UDP, not mcast)
for each instance.

Possible package enhancement:
provide a conntrackd@.service unit template, which would use
/etc/conntrackd/%I.conf configuration file. Also, the control socket
should probaly live in /run/conntrackd instead of
/var/lib/conntrackd.

-Yenya

> > Or maybe I should run two instances of conntrackd on each node,
> one for
> > synchronizing IPv4 by default in one direction, and other one for IPv6
> > by default in the opposite direction, and having dedicated scripts
> > for promoting to master/demoting to standby/starting up for IPv4
> and IPv6.
>
> The idea of running two instances is sensible. That way, there can
> be a distinct failover procedure for both address families. If you
> do this, remember to give each instance its own UNIX socket path,
> lock file and multicast group/port so that they don't clash.
>
> Also, note that conntrack states are not synchronised in
> one direction. Rather, they are replicated in both directions
> continuously. A receiving node holds the replicated states in a
> so-called external cache until such time as they are committed. The
> commit operation injects them into the kernel conntrack table that
> Netfilter actually consults. The internal cache acts as a mirror of
> the kernel conntrack table (the commit operation does not touch that
> particular cache).
>
> >
> > And two separate conntrackd configs filtering out the unwanted
> L3 protocol
> > by universal prefix address:
> >
> >         Filter From Kernelspace {
> >		Address Ignore { IPv4_address 0.0.0.0/0 }
> >		    # or Address Ignore { IPv6_address ::/0 }
> >		...
> >	}
> >
>
> Yes, this should work exactly as you expect. The first directive should
> result in state changes pertaining to IPv4 being ignored. Likewise
> for the second, only pertaining to IPv6.
>
> --
> Kerin Millar

-- 
| Jan "Yenya" Kasprzak <kas at {fi.muni.cz - work | yenya.net - private}> |
| https://www.fi.muni.cz/~kas/                        GPG: 4096R/A45477D5 |
    I don't like Python; its lack of inline, anonymous, multi-statement
    functions makes me sad.                                --Eric Wastl
