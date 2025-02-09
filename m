Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0A914B092
	for <netfilter@vger.kernel.org>; Sun,  9 Feb 2025 22:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739139840; cv=none; b=amQwu+h/OY6T8mmZ1LB25sm4Q7tIz5C++D3bS7nNZmb+NxqJPZt799b7JoqxmTGcHK7Odft5BQRmj2As4FwjDcGgMeSz3KKN77iLAWzDGOB9GmxB1XJs2MK3sa0B1fa48sjR6mb4HDp0V6OMnDOR2ov8/0of2wlehVhg1t1jxxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739139840; c=relaxed/simple;
	bh=n1QGFnsbZdybnWu+GQe0JR6tW8M6FfLOUjc+oi38TUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtpOpigvtz8N5rFAIjytqp9wQLDxt513iKK6nR+WnGJmJkqvzL8ME5TNDcqndO7HsvinLhl2gyfUR0w0ifGL8Kayh1BygwOEVrmYYMZLJlgoxGcQvhKmro0CS6Glb1SXhd4bKgVtM9TY1OAvBGeyiYR1jH36T4WkNKUINoDeRFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=kefojdqx; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=kefojdqx; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="kefojdqx";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="kefojdqx"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id A24636034D; Sun,  9 Feb 2025 23:23:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1739139827;
	bh=mQZwCIWBQgnqn50aPPhOzq8nQxjnUZwFsN+aoOiElGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kefojdqxhOzq0wapkScmHUABF/SBAArHwMorHnN7UH+naarCNX5/HVJiebHGWkVEF
	 N1zpfpcQgyYxdkx1TGQe+oFmxLe4EsM0CTGxPE75H52UuE9+d6WPQmvCb4XslZg3+u
	 6V3O8Q+xDDND1YK3QomwC93CH4OROj2DJIE5Ixd2s9H6IUZb/7bK+C/4VcXAYVL8qJ
	 A7oerp14vEnBGdY8nN61qB5/V1yvIN/tfQcoKPRo+bFWkRWxj2DtRYR/QB4TU6MLSN
	 qF9820QyFcwSFoz0Oexfk5dAFkBGPOs8/7MxfQMzYfFmumir6C3qQ9Ub0iisCDgeJ4
	 1J9aWwBurJcDg==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 1397360305;
	Sun,  9 Feb 2025 23:23:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1739139827;
	bh=mQZwCIWBQgnqn50aPPhOzq8nQxjnUZwFsN+aoOiElGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kefojdqxhOzq0wapkScmHUABF/SBAArHwMorHnN7UH+naarCNX5/HVJiebHGWkVEF
	 N1zpfpcQgyYxdkx1TGQe+oFmxLe4EsM0CTGxPE75H52UuE9+d6WPQmvCb4XslZg3+u
	 6V3O8Q+xDDND1YK3QomwC93CH4OROj2DJIE5Ixd2s9H6IUZb/7bK+C/4VcXAYVL8qJ
	 A7oerp14vEnBGdY8nN61qB5/V1yvIN/tfQcoKPRo+bFWkRWxj2DtRYR/QB4TU6MLSN
	 qF9820QyFcwSFoz0Oexfk5dAFkBGPOs8/7MxfQMzYfFmumir6C3qQ9Ub0iisCDgeJ4
	 1J9aWwBurJcDg==
Date: Sun, 9 Feb 2025 23:23:44 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: Florian Westphal <fw@strlen.de>,
	"netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Raw Payload Expressions - out of bounds write?
Message-ID: <Z6kq8I6WG96GkNsI@calendula>
References: <Bp_PH3aO9-d7-Av1SaQGtAgrvHaPwr0l5r_aR31_U8l5IvbSFaLJ1lXI3vFBV46Xb4IxK-tP-HkcSFS-2KCLyYfRibcIkioxjdem46U0IB8=@protonmail.com>
 <20250126135021.GB3073@breakpoint.cc>
 <R5drxaQptK9DK89Lt1TmFpDxo86ctD3Pu2WS4wEhXcOZq7yuVqJDxNIc2tZVIx1PJpF15g1AOJCW3gxNIPqlVH6ubbppDWQlzErAa4UP3UI=@protonmail.com>
 <20250128003706.GB29891@breakpoint.cc>
 <Z5jQgcbCXiLyPwV-@calendula>
 <PVrkUQp56-Jj22U0UNcuDB2ECbRGvxlQdpV9wqJEScEZCv87qu5FdvjBKhhAzXkGv71nnXYmPI2TlxCo-dz_Mz-2Y52rrOVQLWvmPYm7cIA=@protonmail.com>
 <omRiDfO4yHw_nf-Xsk390UcpY_66yoc_oOELR6Fwu94Nr4QtjOT_1tcjVT_wOaaVW5QwqNRBvQonQbXXayhp1CFTAKEF3Qz0ToC7HenQBpk=@protonmail.com>
 <20250209014753.GA1766@breakpoint.cc>
 <WBhjrc0cnQh1u_11--tRibauTRslpdAmnTsjeE4tfNg85IDiO5euCk3pLgdnqOZEhq5mbDD2IRo_XykzL7V0UeSisrebbDrIjGon0qifnag=@protonmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <WBhjrc0cnQh1u_11--tRibauTRslpdAmnTsjeE4tfNg85IDiO5euCk3pLgdnqOZEhq5mbDD2IRo_XykzL7V0UeSisrebbDrIjGon0qifnag=@protonmail.com>

On Sun, Feb 09, 2025 at 03:12:48AM +0000, Sunny73Cr wrote:
> Hi,
> 
> Still confusing, my bad. Here's what I'm looking for.
> 
> Input:
> @ih,56,6 set 0
         ^
this is in bits.

> Expected output:
> [ payload load 1 byte @ inner header + 6 bytes => reg 1 ]
> [ bitwise reg 1 = ( reg 1 & 0xc0 ) ]
> [ payload write reg 1 => 1 byte @ inner header + 6 bytes ... ]

and you use 6 bytes in this bytecode.

This makes no sense at all.
