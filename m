Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE681244671
	for <netfilter@vger.kernel.org>; Wed,  8 Oct 2025 11:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759924226; cv=none; b=USXEGZAZGk6TtLdz+8Y/OGY0+nWqUWM7Fszm3+c4dd/a2bg0g6dJ9pNTs1EVdE5J+1S+7cKnvCn/5rR3CrOj6HMfHKm62uTnu5UK2ZtRKNdSll7QncpEKLbzQkobfAZ4mX/ff00tT8yNtbxz+LdBoRVHHTNcGkb0er9tltjaAiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759924226; c=relaxed/simple;
	bh=lAxcHGnxJnpjx4hKjHMOLephjrX9F+i3A+heYJ4Gc6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOFkzXNYyvKyXaHH1/LDm2P9Itouc8GOMrKSPjgJFKVFwjt/Y9DDzTTlsERzBTiENoTncdsLhYbjAGZjEvOsogUYzWgWezJr67hzF35xHLMOrYjAE58PiaxhGlk/a33FUA+CpvsNBu7sVd4Fa8VBtYVVyh56GH8POwiI9Cz6jDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=YfV1rCV8; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=uoC6UBo3; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="YfV1rCV8";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="uoC6UBo3"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 18FE760264; Wed,  8 Oct 2025 13:50:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1759924222;
	bh=xVVUHgdNr6c9p5/aYn52M1aZGhlYpaF7nZGokWLW/oI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YfV1rCV809fqxuhnFlj4ldXwSZaqyoaiOwrzQW52+gPio9fNuoBso36BpeVkxGtyJ
	 Z4ara5iCqaQjZic9F88Yxn02MkA9kPaAqXFsOUQgTYeUbHysed3viGk3r9aeIXYKYV
	 c8tMntGaB8P0d7+qME56TRZzLUWh1EJwbNSXsQ+n/AyHF4/3vXAZhs9ijPJwgGrmXY
	 uSIQNZkR1r9vnSq7UDyxVqzbDNpZ7drbWNA1x/kPijuhrcUhh8Zf4zR3H8X/q2MyIK
	 ZobrQr/1MuxDmG4HW4z/HX5n+LJnxKrAxtcdbEdYlDTHXx0n1yBdwt/pflUTcsWAA+
	 foE2VcT6K/XWQ==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 8A69960251;
	Wed,  8 Oct 2025 13:50:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1759924221;
	bh=xVVUHgdNr6c9p5/aYn52M1aZGhlYpaF7nZGokWLW/oI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uoC6UBo3TM1vrk/zgpnFtstjbqZsdW+tr+hGasPxPpEXiwz7OaBsaHFQf7L/34xAJ
	 M37PlHxmwTSWqlBk6lCpAydZFCtBg+6aY5WVGmcdfm/2JWCYdDZYXtUfyswuDoZpTr
	 xjKM+UpL2hqdrdoSMijHFxMxHbScAae+Y2/D01sYXTMvgz0Cs0UXlvJQaE5awjpQHB
	 S1NjQM3wWiR3GqVOfjaor5yUPCVbKqbsmA1aksxXcFuJFIlqrjVmkZPLEwaqHSX3NM
	 nwy5LnsPkeygCjtulWxhh2/dA4MI8JfrZeK57e2VbCeuAOGhrk2+bHn01lLl2Hslmf
	 HDgOnEYTZQRzw==
Date: Wed, 8 Oct 2025 13:50:18 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: imnozi@gmail.com
Cc: netfilter@vger.kernel.org
Subject: Re: nf-ct-list and nf-exp-delete
Message-ID: <aOZP-v75f5yMTdrk@calendula>
References: <20251007051508.049e8821@playground>
 <aOT1NhYSS65KwwJD@calendula>
 <20251007184531.73f3404d@playground>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251007184531.73f3404d@playground>

On Tue, Oct 07, 2025 at 06:45:31PM -0400, imnozi@gmail.com wrote:
> On Tue, 7 Oct 2025 13:10:46 +0200
> Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> 
> > On Tue, Oct 07, 2025 at 05:15:08AM -0400, imnozi@gmail.com wrote:
> > > [iptables v1.8.7; old, but it's what I have.]
> > > 
> > > Why does 'nf-exp-delete -i [id]' *not* remove remove some conntrack entries even after being told to remove them multiple times? It deletes most entries for my purposes (if condition is met, delete conntrack entry and block the IP using ipset). Blocked IPs are DROPped on internet side, and RESET and REJECTed on the internal side. But from time to time, I see ESTABLISHED conns that don't get (can't be) deleted.
> > 
> > nf-exp-delete -i [id] ????
> 
> Given:
> ----
> # nf-ct-list --tcp-state=ESTABLISHED --reply-src=10.X.X.2 -f details
> tcp ESTABLISHED 188.132.249.148:57992 -> 204.111.X.X:443 10.X.X.2:443 <- 188.132.249.148:57992 mark 17488 
>     id 0xf016f3da family inet refcnt 1 timeout 10m 17s <ASSURED,DNAT>
> ----
> 
> then:
> ----
> nf-exp-delete -i 0xf016f3da
> ----
> usually removes that entry from conntrack. In my experience, some entries are not, and cannot be, removed without drastic measures that would interrupt firewall operations.

Where are these tools in the git netfilter.org repository ?

And how does this relate to iptables v1.8.7 as you claim ?
