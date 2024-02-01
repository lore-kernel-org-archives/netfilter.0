Received: from smtp2-kfki.kfki.hu (smtp2-kfki.kfki.hu [148.6.0.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2275F15B969
	for <netfilter@vger.kernel.org>; Thu,  1 Feb 2024 10:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.6.0.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706783087; cv=none; b=o1ux78cHSmVQKkQU/wtyRnlG2tG4c+Kac7nmw5MxzOSADslSQCrxu0QJI5IgnilzRz6mlr8Bm4G6L7wR0+HdQliGUX7Mq8XxDDDOX61gFXeSG1h45wfYu7/o1C/5QFXVGMSz60Ynjv41mktnpY1r2S9GZX+VpU9NjewSwX4PlV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706783087; c=relaxed/simple;
	bh=gwBDzEXy0GiUpIgEpzno/m6DqTSZuriojZ773ZOrcMU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YD7dID43i1thk2vtpgHAcUbJWpofZHaKZZibMSDp4Twm8IVtKhTzVhXZIS8oxj7p3RlZZXAUF9KQHTJ3YwyvrDusvDSYgNck5E03YykRDnomxQmmJttXVTY5zwUnpsBDzEFSPePHmmIEE1t73hefa8Nb8a1/9S1lz67U+NCVNMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=blackhole.kfki.hu; spf=pass smtp.mailfrom=blackhole.kfki.hu; dkim=pass (1024-bit key) header.d=blackhole.kfki.hu header.i=@blackhole.kfki.hu header.b=lpBVJtlb; arc=none smtp.client-ip=148.6.0.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=blackhole.kfki.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blackhole.kfki.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=blackhole.kfki.hu header.i=@blackhole.kfki.hu header.b="lpBVJtlb"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.kfki.hu (Postfix) with ESMTP id B5320CC02C2;
	Thu,  1 Feb 2024 11:24:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	blackhole.kfki.hu; h=mime-version:references:message-id
	:in-reply-to:from:from:date:date:received:received:received
	:received; s=20151130; t=1706783079; x=1708597480; bh=tFeU7ACpsP
	5TduxGGq5iVPDI0CLTeNviEVp4769UCCA=; b=lpBVJtlb8qVWXX9UP4HtNqD+eF
	+W+tiDqbVT2mb9JyHEJ4Vb8WLYa1PXoWn2/0AsQX8apsds+W6o/JeUREr8oOjrCp
	yJCnNNzTNqLAHzmDrb8mQALk0E6S0WokZMM1aXYkSb3u9laSM5865oIetFblW5o2
	9rzh9mzP+zbPec05k=
X-Virus-Scanned: Debian amavisd-new at smtp2.kfki.hu
Received: from smtp2.kfki.hu ([127.0.0.1])
	by localhost (smtp2.kfki.hu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP; Thu,  1 Feb 2024 11:24:39 +0100 (CET)
Received: from blackhole.kfki.hu (blackhole.szhk.kfki.hu [148.6.240.2])
	by smtp2.kfki.hu (Postfix) with ESMTP id 7397FCC00FE;
	Thu,  1 Feb 2024 11:24:39 +0100 (CET)
Received: by blackhole.kfki.hu (Postfix, from userid 1000)
	id 4B614343167; Thu,  1 Feb 2024 11:24:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by blackhole.kfki.hu (Postfix) with ESMTP id 49557343166;
	Thu,  1 Feb 2024 11:24:39 +0100 (CET)
Date: Thu, 1 Feb 2024 11:24:39 +0100 (CET)
From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
To: Pablo Neira Ayuso <pablo@netfilter.org>
cc: Anton <anton.khazan@gmail.com>, f@calendula.smtp.subspace.kernel.org, 
    netfilter@vger.kernel.org
Subject: Re: Is there an efficient way to delete multiple elements from a
 set?
In-Reply-To: <Zbtno/1aJGClR6Kr@calendula>
Message-ID: <22d8a405-401d-6364-5eb9-8fd58a808ad0@blackhole.kfki.hu>
References: <CAJE3=wmAh5Ne9fWdrHOyZx9uuz+_g4+PhVXnfr+pS417mVWfhA@mail.gmail.com> <ZbtnQXFtUTkVRZ0C@calendula> <Zbtno/1aJGClR6Kr@calendula>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Feb 2024, Pablo Neira Ayuso wrote:

> On Thu, Feb 01, 2024 at 10:41:21AM +0100, Pablo Neira Ayuso wrote:
> > On Wed, Jan 31, 2024 at 10:14:41AM +0200, Anton wrote:
> > > Hello, I've been experimenting with nftables sets for the purpose of
> > > geoip blocking. Let's say I'd like to add ip blocks for multiple
> > > countries to a blacklist or to a whitelist. Perhaps the most efficient
> > > way to do that would be by combining all required ip blocks in one set
> > > (for each family). However since country ip blocks are a moving
> > > target, I would need to regularly refresh parts of that set. My idea
> > > was to delete all ip addresses corresponding to an ip block from the
> > > set and then add the updated ip block. The problem is, this is very
> > > slow. While adding an ip block takes (in my VM) 0.09s, deleting all
> > > ip's from that same block takes 14.5s.
> > > 
> > > This is how I'm doing the deletion and the time measurement:
> > > printf '%s\n' "delete element inet test testset { $(cat test.set) };"
> > > | /usr/bin/time -f %es nft -f -
> > > 
> > > (the test.set file stores a comma-separated list of subnets)
> > > 
> > > Is there a more efficient way to do this? I could of course flush the
> > > set and rebuild it every time I need to update some part of it, but I
> > > thought I'd ask before deciding to implement that.
> > 
> > It is possible to flush the set and fill up with content again:
> > 
> > flush set inet test testset
> > add element inet test testset { ...  }
> 
> I forgot to mention: Run this a batch .nft file, then:
> 
>         # nft -f update-set.nft

I'd like to add that the nft command above is atomic and either it 
succeeds and the set content is replaced with the new elements or it fails 
and the original set is kept intact. (It is important that the "flush" and 
"add" subcommands be executed by a single nft command invocation as in the 
example above.)

So it's roughly equivalent with

	ipset create temp-set ...
	ipset add temp-set ...
	ipset swap production-set temp-set
	ipset destroy temp-set

Best regards,
Jozsef
-- 
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
