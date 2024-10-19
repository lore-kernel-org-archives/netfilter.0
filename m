Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80495149E00
	for <netfilter@vger.kernel.org>; Sat, 19 Oct 2024 20:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729370794; cv=none; b=NMlWuvxIyTsfcBrCMAibPw/n3L6nqTanl4HLDeutCnJs9iNMCsxTA2wel+IBA1t5gKy6gf4IOYCy3X3nxMVJr+bLKsxCR52GHjO9OTsrDSDz+tZikD7gp9c3CuMlzz+MTOPCCyCoo8Ggyqy/mACyAQi9T39DjZszUMsAAe3K+GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729370794; c=relaxed/simple;
	bh=z2rICKryCyMPnaAkE+swPWP8cZnIeO9i8nT63fk6GlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHMq1yCkCjzo9r8VZONPpPxF96yimdiuvCOmtAiqG/eA+U5pKjMl9hedcHVCE8VJgDNNCC1o5VtVaU7xF27DKS7XyA14fDoOSWe8wUFhThPMTTjgmI8XAj3bBjewFQ0F8SClx1ZDVpIx5Ws7O+ak+ZkhkZ0j3UEQD6h/D4sxuqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=46672 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1t2GLD-004gSy-5t; Sat, 19 Oct 2024 22:46:29 +0200
Date: Sat, 19 Oct 2024 22:46:26 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Kerin Millar <kfm@plushkava.net>
Cc: Telbat Diordna <diordnatelbat2@gmail.com>, netfilter@vger.kernel.org
Subject: Re: filesystem access to add/remove/view ip addresses
Message-ID: <ZxQaojMaai7dyB1T@calendula>
References: <CA+OqyoGkVcvgVYPBMc6v-JeRwncoJz1OyECma2-megULkvQ0xw@mail.gmail.com>
 <4916d96d-7fd3-4576-b574-b033be66c196@app.fastmail.com>
 <CA+OqyoGJhT75-FBdO1mLxaLpHpWck6wPe8hTwRLCmKWq6b679g@mail.gmail.com>
 <e4bd55b2-c6ce-402a-bc19-d50d7c626591@app.fastmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e4bd55b2-c6ce-402a-bc19-d50d7c626591@app.fastmail.com>
X-Spam-Score: -1.8 (-)

On Sat, Oct 19, 2024 at 08:35:36PM +0100, Kerin Millar wrote:
> On Sat, 19 Oct 2024, at 5:35 PM, Telbat Diordna wrote:
> > CAP_NET_ADMIN opens the door ways to wide, while the older iptables
> > method allowed access-limitations/permissions per directory (=ruleset)
> 
> If you cannot bring yourself to trust a homebrew BINFMT_ELF
> executable with the CAP_NET_ADMIN capability, another option would
> be to write a simple shell script to wrap nft(8) then compose a
> suitable policy for use with sudo(8). The paradox would be that sudo
> opens the door wider initially, on account of having the setuid bit
> be enabled.
> 
> > Can I read your answer in that way, that I still have to use iptables
> > and can't migrate to nftables, when I wish to use this feature?
> 
> Yes, for the following reasons.
> 
> - no procfs interface exists to modify a ruleset or its objects
> - nftables cannot integrate with xtables extensions unless using iptables-nft
> - the procfs interface you are using is implemented by an xtables extension (xt_recent)

For the record: We have absolutely **no** plans to provide a procfs
interface to populate sets.
