Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E4B1400E
	for <netfilter@vger.kernel.org>; Sun,  5 Oct 2025 11:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759664743; cv=none; b=gvi5ZJ+bM36oZunGSTzeUYv9uV8NGYtiBgIInNENI4hS7ue5VOouqSgaGZ8ahYL70DwgHfTv5iXuS+nrqSC2KR8HFJqq8bk3I052AfxzZw3cp1BG6pp7dvWuKZ4Xi5ZKyPXtpEYLmxQKvq8WTKVNFJZimWHQEjxQLhsKrWwJH2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759664743; c=relaxed/simple;
	bh=AMoC9ErjGbfOS4P48prXt4RS3p1MkHzUXIViBYeGvMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PvM8j+SwavUkA7/saf1+a1vmql8UlIDZE2pjCrtabTqe2pg197zuObry5/5OHl7kZKrAlMR/+sxelJz1LRLecHXfQO5JJv04Blvj9+HDBFTtfl0Vr2Ug6Ea4/s/h+Xrtj34fa3lcEaIwN8HDjk+nzjgX5pPmOxr/cygTLimlBKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id D79B3604FB; Sun,  5 Oct 2025 13:45:39 +0200 (CEST)
Date: Sun, 5 Oct 2025 13:45:39 +0200
From: Florian Westphal <fw@strlen.de>
To: ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Netfilter mailing list <netfilter@vger.kernel.org>
Subject: Re: nft for bridge.
Message-ID: <aOJaY6oQnYPTcVAn@strlen.de>
References: <CAGZFCEGKWfnuXdXvSBQEJFfHeKsDKLx0E+SLorBs6HWRUs1kFg@mail.gmail.com>
 <aKM2sOMlivuUJHOJ@calendula>
 <CAGZFCEHxw0VkH0JJYjxNHevJ69BMZQ9zbhT=YbYS6ti2j8DAwg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGZFCEHxw0VkH0JJYjxNHevJ69BMZQ9zbhT=YbYS6ti2j8DAwg@mail.gmail.com>

ratheesh kannoth <ratheesh.ksz@gmail.com> wrote:
> On Mon, Aug 18, 2025 at 7:50 PM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> > No flowtable support for the bridge family yet, sorry.
> Thanks. For routed flow, Openvswitch case, it pushes Original and
> reply direction with the same cookie. But nft case, it pushes Original
> direction tuple twice. Is this expected ? or is this issue fixed with
> the latest kernel or nft ?

You will need to figure that out yourself.  Most of us a volunteers.

> MY nft version : nftables v1.1.5 (Commodore Bullmoose #6)
> My kernel :   kernel 6.6
> 
> ADD cookie=18446462603462596360 (00:00:00:00:00:00,
> 192.168.11.200:30443) to (00:00:00:00:00:00, 192.168.9.100:35091) IPv4
> TCP
> ADD cookie=18446462603462596360 (00:00:00:00:00:00,
> 192.168.11.200:30443) to (00:00:00:00:00:00, 192.168.9.100:35091) IPv4
> TCP

I don't even know where these messages come from.
