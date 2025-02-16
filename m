Received: from sphereful.sorra.shikadi.net (sphereful.sorra.shikadi.net [52.63.116.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4428D1401C
	for <netfilter@vger.kernel.org>; Sun, 16 Feb 2025 03:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.63.116.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739675827; cv=none; b=KscgHh015M1MJ94nKJa4UXBF1+7MDNLbXMYmNrcOc5ovaYY0Bd2b1tf5LwhV2HBFYbq/u/1rFAagWFVkzvnd/7VZgjraDoEpyEMIITR0B8fiUMbiC/7bRRb6TrMTKlg74hTuVR4DWuFXoqHnod2994Xw7/hoTpZt6IMqtFj3EtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739675827; c=relaxed/simple;
	bh=ijP2NbzvggH/aH4jr/kSJXu2Wc4nbU5x4BPrT97N4eE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rfrdE8EdCaa+spGMuLrqID0K5zD2CFKIl23u+Ye03E5sOxo6INNaH8oUaN8k1+YRN66/bZduIfFlHTB6gQsqFp3X1znhFkGV3QSKnkYsUyvtdOjw5Ot0QpXp75UN3MYC33OLVwSgWYrH0URWYJJro+1jPmRu+XL9foMnVTFSkQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=shikadi.net; spf=pass smtp.mailfrom=shikadi.net; dkim=pass (2048-bit key) header.d=shikadi.net header.i=@shikadi.net header.b=LDm0FiMS; arc=none smtp.client-ip=52.63.116.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=shikadi.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shikadi.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shikadi.net header.i=@shikadi.net header.b="LDm0FiMS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=shikadi.net
	; s=since20200425; h=MIME-Version:References:In-Reply-To:Message-ID:Subject:
	Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ePdt/uWRLhCVo141m14KgUwrGZGRkNo4TCpEUDNl9+Y=; b=LDm0FiMSFKT5EObRhlXJOhajpO
	SVODm1nR+8wM/vufLY51R2mWHEMazZX/zbMqqhaRugRzPo4lSRUxpbX/MBGnhpsw/VGccSX2gQZMy
	N3HeaEJ3+5jd9moxjx/t3Dr2bo9cjEX28jFgjcocmC4Yt4sYoED2nP5OLjurZQlnksFFgoCnZ8E0g
	X/gkYm7AEPWT9pxvjCT/OH/9PoO3yYGFqZykUbqjSslyzzEPhCL2a9PMDpcz+77UpUOqOyFP7FVig
	W/EK7tSpR7VAvwNUz2tlNgl6MvTIMjVAEb4OHUXxzNUju5RCUGdmuGREuGwe7V7XVPzf8plv8HsUw
	Pp+CgitA==;
Received: by sphereful.sorra.shikadi.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <a.nielsen@shikadi.net>)
	id 1tjUa1-0007gt-1L;
	Sun, 16 Feb 2025 12:40:25 +1000
Date: Sun, 16 Feb 2025 12:40:22 +1000
From: Adam Nielsen <a.nielsen@shikadi.net>
To: Alon Bar-Lev <alon.barlev@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Static bidirectional static NAT for duplicate IP devices using
 iptables
Message-ID: <20250216124022.127f90f3@gnosticus>
In-Reply-To: <CAOazyz3dGP+QJ_BOvXQ7gnQzTvOhGcxwA9y-RRJx=CjmMNmWhw@mail.gmail.com>
References: <CAOazyz1wYSHCYt+nk7hu2fmiW+GRRMMX0sejAa-31xH_VeWvXA@mail.gmail.com>
	<CAOazyz2H52h0unuTEadOFP3cWD7CfHUMG+HUGwVnnZQjtWRJ9g@mail.gmail.com>
	<CAOazyz3dGP+QJ_BOvXQ7gnQzTvOhGcxwA9y-RRJx=CjmMNmWhw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> Summary: I am trying to access two devices with the same IP address
> connected locally to a Linux computer, each resides in its own VLAN.
> 
> I made yet another progress, I use arptables to mangle the ARP request
> of the host side, but I am still missing ARP response to the device.

Isn't arptables the wrong approach here?  If you're using NAT then by
definition you're mapping IPs to the target subnet, so then there
should be no need to mess with ARP as the packets leaving the machine
are already on the right IP for the subnet?

I am by no means an expert but I would've thought that all you're
trying to do is to convert a 192.x address into the same target IP, and
just control which interface the packet goes out on based on whatever
the original IP address was.

Is ARP mangling needed at all for this?

Cheers,
Adam.
