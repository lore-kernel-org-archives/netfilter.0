Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201F4381D3
	for <netfilter@vger.kernel.org>; Thu,  8 Feb 2024 20:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707423139; cv=none; b=gczJQEHNDgeAFibmF+DJ1ybGbrqcVSdOEAN1VXBZYcuL64e0x/bLT5ByKpkamR4ro9tlbaAhPwZCcgdaiTeTWQNR8z9p4UpEa6il5kZWRXtHL5YHulAHGsqNPSDhHmJh3qt6HMdQQK71VVqRl3Q+LjTy3bd8piNWt8P+sbg1UEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707423139; c=relaxed/simple;
	bh=03HrJ6d3EQsa5C7SaEYH+AJI/9YtiEm8TPT/m2t3chU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ezSKDgDRmf14h7RLTzB7bOeP590Q6SwGPYsxJfM302Ku5xJdT5C0mrjP6gb4/bTho5ItujxKdwHavospi7zJ4+0LcYHtp08Dv7TkYm4urmb4uAfVUlHJGdT1HziEetDpTtpK+sLHy/11pGrqyrsoPVujifGvkkJi7gpQKMZ1DwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=YawO5I8o; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="YawO5I8o"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id E0AB5240029
	for <netfilter@vger.kernel.org>; Thu,  8 Feb 2024 21:12:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1707423134; bh=03HrJ6d3EQsa5C7SaEYH+AJI/9YtiEm8TPT/m2t3chU=;
	h=Date:From:To:Cc:Subject:Message-Id:Mime-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=YawO5I8olJQ/5CMNv2xCWVuM3SMFtZNYXDTMbGmrKpoYi6UePR5NKnDMAhV4BNFAD
	 j91HgMBHd2O4s+hmMcZ2EYO1V+uZbLvP2/QfV34Grw4z6W0w+ZC+jqBzzmPPS7ILg4
	 OqPVpY0q9dkmkGRAku6HFu7mj8anyZKAHDn4l0xjePpT/okqKgZOlyuDlNdtk/HWL5
	 WndAUu2MF+oOUEsAuON4c9/W/wnSQU7h3FBx9fEl+DO1Svhruq5LocwYanDdA07LU4
	 CPbcQ5rWclnumPhsYhRZm7SLZMWUd+NElfPiMn7JRgnjs43cgNd4fwoM0Aqo+9AP+D
	 vDvLHnMdSMdiA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TW7SG2tjdz6twG;
	Thu,  8 Feb 2024 21:12:14 +0100 (CET)
Date: Thu,  8 Feb 2024 20:12:13 +0000
From: "Xavier B." <somenxavier@posteo.net>
To: Anton <anton.khazan@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Are there nft set limits?
Message-Id: <20240208211213.07b5375888629f9aa50d53f4@posteo.net>
In-Reply-To: <CAJE3=wmZAELgnQQne+tAY+5UTiOpPFO9sJ+GBbpYB=8nkUChRw@mail.gmail.com>
References: <20240208162047.0a4c7007c908cbc38d5357a2@posteo.net>
	<CAJE3=wmZAELgnQQne+tAY+5UTiOpPFO9sJ+GBbpYB=8nkUChRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks a lot, Anton. It is included, indeed.

Regards,
Xavier

On Thu, 8 Feb 2024 17:59:43 +0200
Anton <anton.khazan@gmail.com> ha escrit:

> It might be included in one of the intervals, which is why grep doesn't see it.
> Try this:
> 
> nft get element inet my_table badips { 198.199.104.80 }
> 
> 
> On Thu, Feb 8, 2024 at 5:22 PM Xavier B. <somenxavier@posteo.net> wrote:
> >
> > Hi,
> >
> > I have an artix instance with nfttables there. I have several rules (attached file) but mainly I have a set of ip addresses I want to ban:
> >
> > table inet my_table {
> >
> >    set badips {
> >        type ipv4_addr
> >        flags interval
> >        auto-merge
> >        elements = {1.0.147.18 }
> >    }
> >
> > chain my_input {
> >                 ...
> >                 ip saddr @badips drop comment "[nftables] Block ban IP"
> >                 ...
> >         }
> > ...
> > }
> >
> > Until now, when I add some new IP to my badips set, everything is fine, but today is not:
> >
> > # nft add element inet my_table badips { 198.199.104.80 }
> > # nft list ruleset | grep 198.199.104.80
> > #
> >
> > As you can see "nft list ruleset | grep 198.199.104.80" produces no output, which means that this IP is not added in badips set.
> >
> > So, I suspect nft has a theoric limit size of number of elements of a set. Is it true? Or not? If it is, what limit is that?
> >
> > Thanks in advance,
> > Xavier
> 
