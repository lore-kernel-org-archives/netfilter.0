Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219844594D
	for <netfilter@vger.kernel.org>; Mon,  5 Feb 2024 17:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707152944; cv=none; b=h3Y1Q3UZDBCCfMtR7z7NkLc/+RpQvSzRhHBitGAq8Y8gLPExdrjmkp3LrqS+GZLwXXHVRpY/4k2XukiTiH/thunY1nFjyo0wL2xg1KDd/OmSH1KxDq9riCoILGx5GshbHlFpaMV9hj69or6MCGEmYJGCF1c83H/xINcOerAC3fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707152944; c=relaxed/simple;
	bh=qLhwA3Aj0+Kf6QPfR3JhaYPA5/QmBudPY5vLeiy9wwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tixNycsqxCeGWQt9cWAvvOp3FWl5dhCtBskdmyKt5M815j52svJAIwWND62mQpIOlEWJuXwQrXzNOMFRob5DtNamWUJVgtzEqCUfEIiv5p+T7/swkRFuNkYEyE1JD5pAziuKGlWf6lCUOCD3FbLbxq/XwaEFjD0RVRrN+rB0GEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.41.52] (port=58538 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1rX2Sl-006HzU-Sf; Mon, 05 Feb 2024 18:08:57 +0100
Date: Mon, 5 Feb 2024 18:08:55 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Eric <evil.function@proton.me>
Cc: Slavko <linux@slavino.sk>, Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-ID: <ZcEWJ8U08NuqxHgc@calendula>
References: <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
 <Zbom4bTPnkTMbLNE@torres.zugschlus.de>
 <5f76a328-4018-43c7-9f4a-86a1e2a4a94c@app.fastmail.com>
 <83255444-F0BF-4340-B721-976AC8E5B6AC@slavino.sk>
 <ZbrLg8luc8tbZALr@calendula>
 <exUZ0UdNDgp0QYgSrJwO6Mii6zqR8O6_g4DXCCBpUSaXsMKzVsfIu3VCaA2wclVn_TdAK96h6kue-LSw4vazUBY8srLkCQP9GiuObeJgYY0=@proton.me>
 <Zby0eB9G4Qi2DJbT@calendula>
 <2_5uNX_sumsVU038csU_coYap0tNQR6gTiA1GDY4Onp16EhEPGkvRE80rAwirPIiGCn9eVKjFNzc8D_zQG98pDys1uxfCIeYh6k3KG6jGXU=@proton.me>
 <ZcCutfqrH/SHlaRw@calendula>
 <clHlpumTk0UKqy_54SFkWToltmb6w40b0TQh2_xQ9h0WwoGFYXvEWUCiXhSvBV5h8elVzIlVTkYSMInXDLfaYt9QP9tVeqfoQxXTyXR0Yk4=@proton.me>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <clHlpumTk0UKqy_54SFkWToltmb6w40b0TQh2_xQ9h0WwoGFYXvEWUCiXhSvBV5h8elVzIlVTkYSMInXDLfaYt9QP9tVeqfoQxXTyXR0Yk4=@proton.me>
X-Spam-Score: -1.9 (-)

On Mon, Feb 05, 2024 at 05:02:16PM +0000, Eric wrote:
> On Monday, February 5th, 2024 at 01:47, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> 
> > Strange that userspace crashes depending on the kernel version.
> > 
> > What is your userspace nft version there?
> 
> This is on the current release of OpenWrt so previous release of nft.  Same behavior on x86, aarch64 and mips.  All other commands from my monkey testing just return silently, only this one fails.
> 
> $ uname -a
> Linux rtr00 5.15.137 #0 SMP Tue Nov 14 13:38:11 2023 x86_64 GNU/Linux
> 
> $ nft -V
> nftables v1.0.8 (Old Doc Yak #2)
>   cli:          no
>   json:         yes
>   minigmp:      yes
>   libxtables:   no
> 
> $ nft list ct expectation table inet fw4
> Segmentation fault

Fix is already available in v1.0.9:

commit a8ff324dc64fd76f7d218d3d94c5885250951258
Author: Florian Westphal <fw@strlen.de>
Date:   Fri Jul 28 21:04:13 2023 +0200

    ct expectation: fix 'list object x' vs. 'list objects in table' confusion
    
    Just like "ct timeout", "ct expectation" is in need of the same fix,
    we get segfault on "nft list ct expectation table t", if table t exists.
    
    This is the exact same pattern as resolved for "ct timeout" in commit
    1d2e22fc0521 ("ct timeout: fix 'list object x' vs. 'list objects in table' confusion").
    
    Signed-off-by: Florian Westphal <fw@strlen.de>
