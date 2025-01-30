Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750DB1EB9E1
	for <netfilter@vger.kernel.org>; Thu, 30 Jan 2025 17:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738259577; cv=none; b=WrfONVZodmZuGcSvCTNTqJgrqRZKk0rA4jmstwr7ES2QljDcyJ5n5Elbe2oV1nCOlcTQUPvHNI+ErydKGQY0joQ2l3nCbfmngyJRTQ2k5qrKLTNBghIpFnuGnb1FbnRpBka16gAQy+ATBSOqdfC0/z21yXDSzGK5St+aOzu5y5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738259577; c=relaxed/simple;
	bh=fXSUMFUajllvveaxoSktEwH0+I7z5t6JshCZBjE7H/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZoXhYnHMCI9/zCSyiVw0G10MF6Cp27co03IYKRMxhd2RfJGuq8OUoeWXcGrj7EqzIu2FoVbnkbTuVcF8PgaRaRpfVg8YflHX1YBaUCrJB9vSjGU1ELkSzY0dq8HUBbWqWpxdaARHTa2wGe8e2BESx3IPV1H95jm2VqqYBJci5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=uw6qMtDc; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=cCoVclC9; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="uw6qMtDc";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="cCoVclC9"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 5078F602CF; Thu, 30 Jan 2025 18:52:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1738259572;
	bh=xJGqRyZ0/mSdFpiVhfZMDYbX3A882KL5sFAPCgRG7Tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uw6qMtDcgbr2Oed6LFrueB/pvf0kIKdqSdecbApKyOBfUkithrE51HStFpXDGDInf
	 Hga/xIHCeCZq0X2Y45IX0eSdxe4QXAlNGmA1jKg/iQA0JKSzkKyu+PRXBgONTmOKf8
	 85XCiuKTfe3ZbmrdFTD6HeV1XJ4h7BAq6s70o1RYSn/c1foBLAdJOr6eQH7vFa7gXS
	 wlAiP2bpClAhaQ79JsuI2kmLaGNzQriNa8YwxiRZZoOCnGEw6tXQ7ow+A3sKf2zeGL
	 Vtr3WnvDpKKdev5sgM0pLnlv1Iqnr3K9Vr0FX9y4yTwl7S5bK7gaDLPEY7wMuBqOhm
	 fAFIFZ+tNna7w==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id B5334602CF;
	Thu, 30 Jan 2025 18:52:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1738259571;
	bh=xJGqRyZ0/mSdFpiVhfZMDYbX3A882KL5sFAPCgRG7Tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cCoVclC9s8djoZq9P8hNYeVoPlmdB60/hNK1eRnz4y7kz0Lx5OcP2Y5VTVyGoifqP
	 42uUeGdXudwfCOMtmv3v1M3Rk+pcWKDv8kJHEIxMAZCV5xnzx/uOyOo5IU1jnnvdvZ
	 qvZjoal4T4YywRxj8RhgGGeoazXDZ/vwuvRGTsY5MYwxiq80+lO5JIChMdMZnqnVEx
	 xLfGQCMo6jAOP4x7kB7xmVmvgZUsEkIGm4v7fcOihB4/WVVTqgKoU8LiJImhIWnK98
	 iT5+jnXt66nATG2XIbNyOJu4qcfxxVQC3Oa4RyfVOO2b+S9uSJZ0y9l5tsGL0XN1qb
	 Gnk8zG9aboE3Q==
Date: Thu, 30 Jan 2025 18:52:48 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Alexey Kashavkin <akashavkin@gmail.com>
Cc: netfilter@vger.kernel.org, ssuryaextr@gmail.com
Subject: Re: Clarification of the procedure for filtering IP option fields
Message-ID: <Z5u8cNsrlEn5JH5g@calendula>
References: <8647C646-1BE2-4956-9598-27CCADD44315@gmail.com>
 <123C96BD-BF4E-4EE5-8330-35B35E5A37CE@gmail.com>
 <Z5u7sji0GX4Hfjci@calendula>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z5u7sji0GX4Hfjci@calendula>

On Thu, Jan 30, 2025 at 06:49:41PM +0100, Pablo Neira Ayuso wrote:
> Hi,
> 
> On Thu, Jan 30, 2025 at 04:52:29PM +0300, Alexey Kashavkin wrote:
> > Hello, 
> > 
> > I am still figuring out the syntax for adding rules to filter IP
> > options. Please, if anyone has an understanding of how this works
> > give at least a short reply.
> 
> This 'type' field is redundant.
> 
> > I understand how the exthdr expression works in the kernel code. But
> > so far there is still a question about specifying the type field,
> > what is the purpose of this field here? There is also a question
> > about other fields, let's take for example the IP option LSRR, it
> > has an addr field. I assume, knowing this option from RFC791 it
> > specifies IP addresses, but in the case of nft it is not so, this
> > field has datatype intereger.
> 
> Yes, this should be at least 32-bits.

Actually, this is 32-bits already:

# nft describe ip option lsrr addr
exthdr expression, datatype integer (integer), 32 bits
