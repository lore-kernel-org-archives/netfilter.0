Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF2781732
	for <netfilter@vger.kernel.org>; Fri,  2 Feb 2024 19:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706900753; cv=pass; b=rsUVK3Iut0mkt24W12E3aHS+BAKLcrpoY7e+KfT1e13G1BSR1k3XvW0WSAlbjtb0572pnLlh9yH/6TbbOmjaY+sqU/jbhutZzVytEiZOsmbdpjiRNkXXIB9UxstVVERmJk2juDvx5nLpyaKlFxA49zF8rK7NEn9eE/2axKBMgpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706900753; c=relaxed/simple;
	bh=rG4wgySE0yJobMVyG6xhxyvV29kW/T6bqgmDs4AI7AY=;
	h=Date:From:To:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gO6bsLfy1OgNtSyH9vI/gFLIvLts+yVIv4Lu/if0mP4TAcyyRbAV25fBRMJcJLiNentMVJzZ+sURyePnUINaRat7ad7JavsSN1vewFDx5UmY8mV7ieKf0BoFr9+H/rtdr7K5FB3UEef5QICqV3g8behGjHMaoRkdVp+/+gKWtBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=vlmjaZvi; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="vlmjaZvi"
Received: from mail.home (82-181-196-180.bb.dnainternet.fi [82.181.196.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: timo.lindfors)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4TRQGC47ltz49Q3W
	for <netfilter@vger.kernel.org>; Fri,  2 Feb 2024 21:05:39 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1706900739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qFakPj1Kr1VVSMEBx3fQLi1+aQZtQ9nrWAvKkB3S1fc=;
	b=vlmjaZviRMrVtKZ8bg/fqzfOfTyA+qZVtK/Czi5rwqgTg9iYGQkHdcJjfnn76oOB0lW0GA
	QzlV4ZG0Iu+D8ZIXdWh4nKaJF/pPDB8bbVDnm0zUVq7j12GQiruRoTUaNWaV+KysLG6IjN
	b86Z7Px+HE6PSq+Q6o7tcopNIsLXKXA5mvlITWxVoFPnH60O1Uu4LgJPWcLuWTwFoZRl8c
	+NQK5sWEkBf0Q/hR33b3opYjhNTy+BZ0kfrmwBxK48QOmII6kzIgOsSJ5fW5dM07m4WJK6
	4qF34iMZ1J07RKoGxOkZCGxiWOzobqDgyrKsBj1+IFUinxs5xp3d8HNi+Su2SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1706900739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qFakPj1Kr1VVSMEBx3fQLi1+aQZtQ9nrWAvKkB3S1fc=;
	b=ZRy70e1v6dkwXkHhM449fp6NGT+vPlqaCwyOIo1D3JzKk7gT45kWr6tmt70AdI/4EFpE+u
	w9JTzyQivLDISYoIocu/ECaUzHJfzhbiDMwnaWKztBivdjgCDEFkLl9Wzqh6rvapiB8ZoW
	Jhd4mzePnT6mtJYRO4gJql5h5hN8xdywNAYujUoxWZzvxRoBsBwgI6CF4SQZulfjEo66/y
	OyH5lOXjba0ZzlBS9Z/oqGeuhdG+IGRE7ZA4Xd5LANBAKYyfyhJ+4EVPjKdWcID/L7QAwX
	9nmfbp9jCvKo9a1uPW4wc2jh5YegOW1MYy9jtiGs7Hs4s/u/mfap/qO5nfaZ2Q==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1706900739; a=rsa-sha256;
	cv=none;
	b=VX5zxCXkkYUI8LHksfPF2jA8c3s7wW3NebW9G4z4sk5nQfk49q8XOLUPJYTH/3Xb/VXjuO
	CyNEC9DixW1dzrySC1SgdaJXs6sseIyUaAruzYPHuXyb/AhUxbkNx+ruUHNc/TYnz1JGLs
	ePC1UDjKmWBmIFHTrElAm/eBoV8FbofAGJ+inYkmejBcz15msj5iv28Is03jlfH55w1MMg
	LyY5EAQn4YvmTnSORz/emRk2oeegz5zaLDRvHXoN8R/+eBE3u2jGWYxhjAdjRycLOek8Tz
	371xh/jYtPs9shMv8sOk9WdyYA5AW483mx2OxhbgtXzY/yjaUuC48qVD0RHXqg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=timo.lindfors smtp.mailfrom=timo.lindfors@iki.fi
Received: from localhost ([127.0.0.1])
	by mail.home with esmtp (Exim 4.89)
	(envelope-from <timo.lindfors@iki.fi>)
	id 1rVyr5-0000bB-5K
	for netfilter@vger.kernel.org; Fri, 02 Feb 2024 21:05:39 +0200
Date: Fri, 2 Feb 2024 21:05:39 +0200 (EET)
From: Timo Lindfors <timo.lindfors@iki.fi>
To: Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Analyzing firewall rules programmatically
In-Reply-To: <20240201203448.a7b1957192995e4553be546c@plushkava.net>
Message-ID: <alpine.DEB.2.20.2402022057110.2274@mail.home>
References: <alpine.DEB.2.20.2401302150460.27550@mail.home> <20240201203448.a7b1957192995e4553be546c@plushkava.net>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed



On Thu, 1 Feb 2024, Kerin Millar wrote:
> Given that the rule is supposed to have been created with iptables-nft, I am surprised that it is presented in that way at all (the line you are showing doesn't match "handle 247" either).

ah, I might have made an error while trying to format the lines for 80 
characters. Here's a fresh new situation:

$ sudo nft -a list ruleset | grep "handle 125"
# Warning: table ip filter is managed by iptables-nft, do not touch!
 		fib daddr type broadcast counter packets 33859 bytes 6322835 jump ufw-skip-to-policy-input # handle 125
# Warning: table ip6 filter is managed by iptables-nft, do not touch!
 	chain ufw6-user-logging-output { # handle 125
# Warning: table ip nat is managed by iptables-nft, do not touch!
# Warning: table ip mangle is managed by iptables-nft, do not touch!

$ sudo nft -a --json list ruleset | jq . | grep -B5 -A19 '"handle": 125'
     {
       "rule": {
         "family": "ip",
         "table": "filter",
         "chain": "ufw-after-input",
         "handle": 125,
         "expr": [
           {
             "xt": {
               "type": "match",
               "name": "addrtype"
             }
           },
           {
             "counter": {
               "packets": 33859,
               "bytes": 6322835
             }
           },
           {
             "jump": {
               "target": "ufw-skip-to-policy-input"
             }
           }
         ]



$ sudo iptables -nvL | grep 33859
33859 6323K ufw-skip-to-policy-input  0    --  *      *       0.0.0.0/0            0.0.0.0/0            ADDRTYPE match dst-type BROADCAST



> # uname -r; nft -V | head -n1
> 6.7.2-arch1-2
> nftables v1.0.9 (Old Doc Yak #3)
> # nft flush ruleset
> # iptables-nft -A INPUT -m addrtype --dst-type LOCAL
> # nft list ruleset 2>/dev/null | sed -n 4p
> 		xt match "addrtype" counter packets 8 bytes 778

I get different output on Debian 12:

# uname -r; nft -V | head -n1
6.1.0-17-amd64
nftables v1.0.6 (Lester Gooch #5)
# nft flush ruleset
# iptables-nft -A INPUT -m addrtype --dst-type LOCAL
# nft list ruleset 2>/dev/null | sed -n 4p
 		fib daddr type local counter packets 24 bytes 16144

Is this perhaps a regression?

>> 4) Create separate tools for parsing iptables and netfilter rules and
>> hope that no system mixes these two.
>
> As things stand, this seems more realistic to me. Perhaps one of the developers would have a better idea, though.

Ok, thanks for the insights. If I built the tool for netfilter first, 
which of the three formats should I try to analyze? netlink, text or json?

-Timo
