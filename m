Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C290383A2
	for <netfilter@vger.kernel.org>; Thu,  8 Feb 2024 20:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707423070; cv=none; b=PoE0deSGmUSEoliB7LqVEig5y3d25RAqZQtlyHmRfr6HeO17fqH1tgR+Tjf1eKRUE3Q+z2dCcxP7/1bbSJsbYy9ModKAaNgxWbzLU7fADL8Lq6JYmLXbWun4e5+1yVF1wwreQf1ZHh9k+ve3OhR2u2x8MuA3b7hNBBy717Org8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707423070; c=relaxed/simple;
	bh=AU80fMdbwm7fV6dsbnVWH7dtpz1qQSoO0RCh9A1QV78=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=SuwUFTXgq9N9A6S/4XhFjqacirdIBXoFLCp62eMmfwXy9dsXXFb03NN1a+/DZxsQu2CbuaHnBjG0y7VMEidUaFnrJYUen26QsmeZz8NtwiB9bqu3YaQlx7gTnYuWbiEXnPlFJ4eJ4xQdSZV95i1gT1HCvf+Jh+fDh31fT/g+KJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=dt3l8YY+; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="dt3l8YY+"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 1FC95240103
	for <netfilter@vger.kernel.org>; Thu,  8 Feb 2024 21:11:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1707423065; bh=AU80fMdbwm7fV6dsbnVWH7dtpz1qQSoO0RCh9A1QV78=;
	h=Date:From:To:Cc:Subject:Message-Id:Mime-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=dt3l8YY+5dk2H9+na1dfGbS6Tkfnk/akNwh/cHI0etXiQgc7i7KigKVlnPqtHV+DE
	 2GzhchnzcMLTq86ZL+QMCuI/76duVj8UgLws3PUn1AvZfKbm/ZLHJyI5cVdS3uv9MH
	 tF9dAqQLF6WRnYpYh5C0xuua8FiM5gUFU0tlfw4cPtBzfbmLV6cXpMVsZol+s6L0ZZ
	 9VxIw1GCgLOKq4ITtPJx04MLUQKL8xK22SZ4W2SOx1zFc3M5Xc+Wl7jLxQGPP3ijKK
	 K6EEEzdfW2Nwu/lD4uo1/L8TIoqhvt2QkaltsCwqqvyWnVgIWb3GjO4y/aKOA6YjsZ
	 Hjkx1ex8PRKrg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TW7Qw36Nnz9rxD;
	Thu,  8 Feb 2024 21:11:04 +0100 (CET)
Date: Thu,  8 Feb 2024 20:11:03 +0000
From: "Xavier B." <somenxavier@posteo.net>
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Subject: Re: Are there nft set limits?
Message-Id: <20240208211103.78d7973d821ab2cf31b3443d@posteo.net>
In-Reply-To: <20240208153219.GN14600@breakpoint.cc>
References: <20240208162047.0a4c7007c908cbc38d5357a2@posteo.net>
	<20240208153219.GN14600@breakpoint.cc>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Yes. It is. Thanks a lot for let me understand better nfttables.

Xavier

On Thu, 8 Feb 2024 16:32:19 +0100
Florian Westphal <fw@strlen.de> ha escrit:

> Xavier B. <somenxavier@posteo.net> wrote:
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
> 
> automerge is on.  Please try
> 
> nft get element inet my_table badips { 198.199.104.80 }
> It should give:
> 198.199.64.0/18
> 
> which includes this address.
