Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41FB1AD41F
	for <netfilter@vger.kernel.org>; Tue, 15 Apr 2025 16:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744734491; cv=none; b=rmALOFvC5ZI/fxfU4b2dxc5bJkHgLKEi8Hm0UKtPyLWNvRHfKOxdw0jrXkWAbTQQVD2rK/fITzfFzvKJaEQhJZaa/pgKc3Zp2wmaQC0a4tRQA+qa4bOZBTRALRi8sEgwBAW2+gU78J0gq4eBd10gYP2lbhhyv4+EJd1Dh5pm+6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744734491; c=relaxed/simple;
	bh=aoD7ee+gB2gFEqRcHERHK1Hnb1pVtS/fqvxqKw5n5fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtcC9FpyOeQOmTET8NeV2OUYv7axRHwKEs1qCT6thb6lkWux/NA6lQKY25fxZi8VQtKuQgZJU3DlTI457sD8iAihXR9gMIeiOHZ3xSJ8PrF9IVcEf7Z0OkZeYmPIrIKcldT0WGNU1cfo9ABoNVHwerBHYEX2Zft+YKTq7JGQJM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=mwjbWcm4; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=U/MDBmOj; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="mwjbWcm4";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="U/MDBmOj"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 20CDC60B2C; Tue, 15 Apr 2025 18:28:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1744734487;
	bh=JOs9hG0N2zEwWkCj8CgI1MhIWrvKn9v0hzF93vZBG4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mwjbWcm4JIiFD/eeCFELBx1pGKnIpaPway9m2XSN6BKJrfvpPMRgXAaSScWWQSmjM
	 riQxZK8/5LVFR5iBjel9Nlw1ErWGBXtDQWKGuHOWovI0XlKU3uiLGFEHVlvV632x/Z
	 k+Z1R4qHSMigkkgx7IMnj5bIHWfCiy0pidnqPtzJ9cbkpMxR1EBwovst4vAcGL4DvG
	 GWvcNYdtCNh2XvoqHBXc6H5dXvq69PohOjJQhi9wOKtWV43aHsg4O4QbT2x8FQmaFm
	 QPhhCSv5sPNKa5T2kfmQWKze3FaGI62UKGZ1uADqEkisnKBPseqzB4nrnwc85KvM3n
	 Oo3ZvvRU5fm9Q==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 5EB0A60B29;
	Tue, 15 Apr 2025 18:28:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1744734486;
	bh=JOs9hG0N2zEwWkCj8CgI1MhIWrvKn9v0hzF93vZBG4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U/MDBmOj/X/IRYk44uF3A+MOHsLy13mXJP7UkYqgXNqL/TSV3klVLgui1+csRbxtO
	 1WgYTg8AX/FEr8OP3dXPlvwSe7mrOQHX+GztzEDCHAg4f8cXtJ0UtSiG5TcYbvuD0r
	 3//JAbvqmyr1E47OLmDrlu2Hw6yINoqthGlCK0QYu9SP7kw/QDfUgyj2l5cu/DgZ4Z
	 W90WlHrIAOybl8SQcrqNaG6xvx3EeHZRzX77/bJOj2/LnBsGl1Xfy01ZeSprYiAfdS
	 bPSnia14rbeZsPGUdp+YSbGmdUgH7zQL9sEKd5+qje3EBTLlIHMzSCM9hEdYEvR8ZR
	 Lft88NOM/yVFA==
Date: Tue, 15 Apr 2025 18:28:03 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Slavko <linux@slavino.sk>
Cc: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: [ANNOUNCE] nftables 1.1.2 release
Message-ID: <Z_6JE714_89IOzb3@calendula>
References: <Z_1KxMUDT0D8e6wH@calendula>
 <d110693b-efa3-4742-8d6e-f56c83ef66ff@slavino.sk>
 <Z_5vmAQdcUCOg86F@calendula>
 <01529A93-9DCA-4F48-8F80-C4CB32A11B43@slavino.sk>
 <Z_6BJ81Iw1uS7zuY@calendula>
 <111EC295-F2A7-4418-A913-8BA847B19666@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <111EC295-F2A7-4418-A913-8BA847B19666@slavino.sk>

On Tue, Apr 15, 2025 at 04:19:43PM +0000, Slavko wrote:
> On 15. apríla 2025 15:54:15 UTC, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> >On Tue, Apr 15, 2025 at 03:22:52PM +0000, Slavko wrote:
> 
> >> Now i add one network, and one or two seconds later second
> >> network::
> >> 
> >>     nft add element inet filter testset "{ 192.168.1.0/24 }"
> >>     sleep 1
> >>     nft add element inet filter testset "{ 192.168.2.0/24 }"
> >> 
> 
> >After this update, two different intervals with different timeouts are
> >added.
> 
> OK, that is good, and IMO expected.
> 
> >> Another example is to add subnet of existing element, currently
> >> the new subnet is not added (or is merged into existing without
> >> timeout change). How it will work with this new behavior? Will be
> >> both in set? Or error happens? Or something other?
> >
> >After this update, with subset, an error will be reported if the
> >interval overlaps.
> 
> That is not good, it will break my current use case -- set filled
> from BGP, as from time to time networks of different ASNs
> overlaps. In really, i use auto-merge in this set just due this...
> 
> I hope, that in one big atomic add, all timeouts will be the same
> (set is flushed in this atomic step), but one cannot do it in cycle
> (with separate add), as even ms are compared...

Scenario 1) 192.168.2.0/24 exists
            192.168.2.10 is added with timeout X.

then, refresh 192.168.2.0/24 with new timeout X.

Scenario 2) 192.168.2.0/24 exists
            192.168.3.0/24 is added

then, refresh 192.168.2.0-192.168.3.255 with new timeout X.

Otherwise, auto-merge becomes of limited use with timers.

Let me spin over this again and get back to you, thanks for you
feedback.
