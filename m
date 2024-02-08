Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03677B3E8
	for <netfilter@vger.kernel.org>; Thu,  8 Feb 2024 15:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707406350; cv=none; b=hnL076Ujdelky7PjhRVMFT00GlSEl9+oSCBu0om49BC9q5Lmvf+k8HRLUuO0X2UtMcS1CQb1KYhXJRl66EHXeuFDwFWMQzt2OUPXLOxSj5aqlrGtaWfxWO1W7SPJT+Ue93HsGXaewSS7DhCbk7J52Dt/+xd9Q3H7H+K+g0I8KDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707406350; c=relaxed/simple;
	bh=rW8K2GtXjyZbgpm4gvshopjc0iI9so7ORN4VxzgHi7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hg5vBGnZ1EGsbUMYtL9MCXsiEExHLhe/bbkWxMIaZlvPdc9TSKEFZkL41GO3x3l76DD+HTz2qhaP8NBrSaFBcQwKIo3gxa225obfxyytj/ClHluLKvIeSFLkia76vVLn3cyQRTLOwmgrywbDaLMMERmcvrIzCU6IQtfUtv6rGm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1rY6Nv-00047d-VP; Thu, 08 Feb 2024 16:32:19 +0100
Date: Thu, 8 Feb 2024 16:32:19 +0100
From: Florian Westphal <fw@strlen.de>
To: "Xavier B." <somenxavier@posteo.net>
Cc: netfilter@vger.kernel.org
Subject: Re: Are there nft set limits?
Message-ID: <20240208153219.GN14600@breakpoint.cc>
References: <20240208162047.0a4c7007c908cbc38d5357a2@posteo.net>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208162047.0a4c7007c908cbc38d5357a2@posteo.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

Xavier B. <somenxavier@posteo.net> wrote:
> Hi,
> 
> I have an artix instance with nfttables there. I have several rules (attached file) but mainly I have a set of ip addresses I want to ban:
> 
> table inet my_table {
> 
>    set badips {
>        type ipv4_addr
>        flags interval
>        auto-merge
>        elements = {1.0.147.18 }
>    }
> 
> chain my_input {
>                 ...
>                 ip saddr @badips drop comment "[nftables] Block ban IP"
>                 ...
>         }
> ...
> }
> 
> Until now, when I add some new IP to my badips set, everything is fine, but today is not:
> 
> # nft add element inet my_table badips { 198.199.104.80 }
> # nft list ruleset | grep 198.199.104.80

automerge is on.  Please try

nft get element inet my_table badips { 198.199.104.80 }
It should give:
198.199.64.0/18

which includes this address.
