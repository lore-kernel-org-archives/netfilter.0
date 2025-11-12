Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD6C2FD667
	for <netfilter@vger.kernel.org>; Wed, 12 Nov 2025 09:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762940698; cv=none; b=MvQ8w4SyhlM5cKllMwL8Qo+g9bKwF79Gu2BVjjr8qSSLaeK884PRuQaUiRjvaUGQ1yap4pFpY+IXNCxQPieX3EeDK+ZBlMUcyk6+N2a2H8T8n2Q8LdtPkRNTfzlUWXkTjItzm06tsaYzykykuyRUHKQcCOxT3e80n+8IM4zEYdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762940698; c=relaxed/simple;
	bh=BRa4Jnpgfq1vM+CfY2dV9UzjjUHNdw3K56Url8d+p+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJuWNdSf7pCG4OPIibJXPdlBDbc62B5DYYx0FAVyQzGqb0MlkN7Tc6G9QSgWiebNfwKbmFTA2o1sPuD99NsZG2hj9b8GWW9De1avdfft15UjGy5a+Ohu/SO6X7NFUm+Lg5iThjiYJIwyPfdAo71h4Xusm4oNHwwKxJKqz36fHqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=tFX4+Bht; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="tFX4+Bht"
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 39A0960255;
	Wed, 12 Nov 2025 10:44:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1762940686;
	bh=0bEIYoWPYNNiBox2RAM4Q2Z/g76P28Kca++ed3+c3JA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tFX4+Bhtg8ekO7XM3wzpj4pJVXCijCBTFeCx2BPhBC2F+uGVQrJKBQEIvRl0HV4+0
	 0lgp30t6I0IAyMPNSaZLyv1MjEeCTy6v9sZsKGYJfFqbB18bi5fMDsIBVqdEGR8rrh
	 rGV0ov6jIT9W/c9hMRmcVxxV9SzHL0IPemnJQYm1DMzcuouj5yUwmP8GibjucYRFof
	 vUHqZhHVH8Bj0xXGcCtqS6hKAwy6wsMdSZK11ec5fXe7A2OgtLv+GowLh9TYWfPqHW
	 WpLc3TQ2PeK7vz0ZJiXJS6WiN4F327D1obGyJGQT9UZwSzHpLXMO0w+BTYw1mKJghs
	 7XREYlT2Kjnaw==
Date: Wed, 12 Nov 2025 10:44:44 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Joel Low <joel@joelsplace.sg>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: conntrackd user-space helpers for multicast/broadcast
Message-ID: <aRRXDBQBQ9vogZg2@calendula>
References: <TYSPR01MB67560AF00CC17680A5DF6175C8C0A@TYSPR01MB6756.apcprd01.prod.exchangelabs.com>
 <aRDbhC3rnP9Z7CbU@calendula>
 <TYSPR01MB6756856A560B3C1F95B24449C8C1A@TYSPR01MB6756.apcprd01.prod.exchangelabs.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TYSPR01MB6756856A560B3C1F95B24449C8C1A@TYSPR01MB6756.apcprd01.prod.exchangelabs.com>

On Sun, Nov 09, 2025 at 11:46:00PM +0000, Joel Low wrote:
> Hi Pablo,
> 
> > -----Original Message-----
> > From: Pablo Neira Ayuso <pablo@netfilter.org>
> > Sent: Monday, 10 November 2025 2:21 am
> > To: Joel Low <joel@joelsplace.sg>
> > Cc: netfilter@vger.kernel.org
> > Subject: Re: conntrackd user-space helpers for multicast/broadcast
> > 
> > Hi,
> > 
> > Are you using the br_netfilter module in your setup?
> 
> I don't think so; `lsmod | grep br_` returns nothing on that host.

And no built-in CONFIG_BRIDGE_NETFILTER=y?

It should be possible to fix this by dropping the conntrack in the
queue path, then nfqnl_ct_parse() performs a ct lookup from the
reinject path.
