Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAA618D
	for <netfilter@vger.kernel.org>; Tue, 22 Apr 2025 14:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745331365; cv=none; b=Kn88M0F46P5s+2NQeaufpkR4p5Per/D9svYFODqvy5DD2BV7cWx+82fzggzCbLiKStsew6Ze46OZlg6+UcFnOqHxVkwSfVfWbZ74YUzMHxmgOFwAHUCDl+DSqDA9lBpdfepzW8fsq6kUgb8yS4adCkZWQ3lG1HAb21iiUFGidxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745331365; c=relaxed/simple;
	bh=1h5cwZsU6nzIXDaD6vTzS+CI7r42jRRpH0sx6lGnICs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5j5IWJfJbSg3M2XirbCY2AcK9irCwhZL1jQgx4fJ22xGOCVicjNBANPNDCZGDqNSS4UNOo3NqKhbIZDkRXDHZRbI/NFSjsTp8IlDIEuQ5yrKp4suWsvsYoEZZFsdj0FsOWMw1u7s5ontIXdtUBrLr+/xfUZru51OMaUVMG3Yog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=pzRT48xf; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=UDPkTrrw; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="pzRT48xf";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="UDPkTrrw"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 2D3FA6034B; Tue, 22 Apr 2025 16:16:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1745331360;
	bh=skL495oGY81SunktWUAWUFRleAXQOtocbYpWP6Lf964=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzRT48xfnmFzCHUtUziBsnZT6uXZrvh7g1gZHJAP+l6d408n7hpAUVNQ15Mx5YvJa
	 lVHyYchk1t0OXh3c1mZAhzrdUCFvO24h2C4prt+uon82ontLQ0WoDN6RsdGETrPHOD
	 fQT8hsW4lMcJGVmqIACUTMXacwOjcHX0NXvsComx0IS0Tess9HlIAgya9kdUJIJ9ak
	 XCORvuTzPJm9QK+AcbNdiOzIyovkBg7Ssw/XWF/17uccUFN2W/rR7ToLcS3DlYOJZ9
	 ubfk5h32wv5FcFNUtKL3N8TPhGRSU78cEpRHTasr3fB6OwlbxpoewMBW1caC79A1df
	 cgILDY1Wn0vWg==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 4C720602DD;
	Tue, 22 Apr 2025 16:15:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1745331359;
	bh=skL495oGY81SunktWUAWUFRleAXQOtocbYpWP6Lf964=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UDPkTrrw2ppC2A9lxXVJxTJ8J7tEw6/jjpj1gI7LHBTkMVig1DsLU/gz69eSe2wyp
	 cr5JuGLK0wVqr80lNo+RmvYrEZyJWpahnWrp0D6ioJabnh5y6lnYhOKCkqUetwEv0l
	 4u1hFBZdYZrWxcyX0MTovaBVj/d+GqRzIDJGZW7MjhcDItCl15S0XCfpFf8PpKwVtq
	 l/EFoQRa3HxLAxMzV1svQJFTs0D6px9kWX1ZL1lD+xmPR6VHmCihsPmwutsaieSH2P
	 wFq0cDbE2iHwj/K97KXJbS0Pw1C4Y36Y0beGwuB1KsnzW4FNXVEb3YzxaNeeZ9vB0u
	 HvSCPtOItd/wQ==
Date: Tue, 22 Apr 2025 16:15:56 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Florian Westphal <fw@strlen.de>
Cc: Slavko <linux@slavino.sk>, netfilter ML <netfilter@vger.kernel.org>
Subject: Re: nftables RP filter and loopback
Message-ID: <aAeknJtZBVycJKCm@calendula>
References: <905173BB-6745-4B59-8795-F9AC1E063A38@slavino.sk>
 <20250422114352.GA2092@breakpoint.cc>
 <622E44D0-8F02-4663-ABAD-01497C7D6692@slavino.sk>
 <20250422125351.GC2092@breakpoint.cc>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250422125351.GC2092@breakpoint.cc>

On Tue, Apr 22, 2025 at 02:53:51PM +0200, Florian Westphal wrote:
> Slavko <linux@slavino.sk> wrote:
> > + from 6.15 it will work even in input hook and lo as expected
> 
> Yes.
> 
> > + before 6.15 it doesn't work (properly) outside of prerouting
> >   hook only with lo traffic (other ifaces works)
> 
> Yes.  fib works fine but not for loopback traffic.

Florian, is it worth to request to include this update to -stable
kernels? Or you prefer the manpage note as it has been suggested?

Thanks.
