Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AEE13F43B
	for <netfilter@vger.kernel.org>; Wed, 20 Nov 2024 21:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732139381; cv=none; b=k5rVV8K5Z0ZsovtEfCAz/hQJkeA7kabLzLgyPWtx0oT4afUPl2eAkm209YuWi9qE2BGyU0+LhMzSpZnTF7Up468sjb5Tjgr/NBFaAD01PjmKCUFDG2+cCmZGOLhCH6gsosMm+lHNyCPkf/UoLIEttpIBhx5OxMaAqCixEn5Y3iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732139381; c=relaxed/simple;
	bh=h3EQMayllG73lJC9XTOVeZo7BIl0ILxpr3PVmSbdh4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uh+LZKrxcpb1oRcStFP/T2Xi2zrbyNh4AxmzSHnRlGENqyErCDRMQ8rOg8qHLEIT/ZNTpAycwKJ3p8zDSOQ25OQHBYet7aL67H6LKlykS2W3dKM5GjhF7kT+SJjmCBlY4KWQmvKQk6LSQvWxQ6pqZ2hwjy5dV6UF9ZGmwye0YfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.39.247] (port=57626 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1tDsZp-006343-0n; Wed, 20 Nov 2024 22:49:35 +0100
Date: Wed, 20 Nov 2024 22:49:31 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Slavko <linux@slavino.sk>
Cc: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: set with limit
Message-ID: <Zz5Za-zEmfGg942e@calendula>
References: <756a9507-5ecf-4ba4-a8d3-d364f13dbfd5@slavino.sk>
 <20241119160617.GA21970@breakpoint.cc>
 <A49323C1-3811-4863-B527-57738F247231@slavino.sk>
 <fd59a4c5-0063-4b32-93e5-e078a44270e8@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd59a4c5-0063-4b32-93e5-e078a44270e8@slavino.sk>
X-Spam-Score: -1.9 (-)

On Wed, Nov 20, 2024 at 09:17:13AM +0100, Slavko wrote:
> Dňa 19. 11. o 19:00 Slavko napísal(a):
> > On 19. novembra 2024 16:06:17 UTC, Florian Westphal <fw@strlen.de> wrote:
> > 
> > > Looks like 5.10 is too old, listing should show limit expression was
> > > attached, i.e.:
> > 
> > Thanks, i will try with meter tomorrow...
> 
> Yes, with meter it works:
> 
>     nft list meter inet filter base_log4
>     table inet filter {
>         meter base_log4 {
>                 type ipv4_addr
>                 size 65535
>                 flags dynamic,timeout
>                 elements = { 10.60.65.78 limit rate 1/minute burst 2
>                              packets timeout 1h expires 59m58s208ms }
>         }
>     }

According to your original example, you could use:

     set log_base4 {
         typeof ip saddr
         size 1000
         flags dynamic,timeout
         limit rate 1/minute burst 2 packets
         timeout 1h
         comment "IPv4 base log limit"
     }

     chain input {
         type filter hook input priority filter + 5; policy accept;
         ...
         update @log_base4 { ip saddr limit rate 1/minute burst 2 packets } log group 0
     }

ie. replace

       update @log_base4 { ip saddr } log group 0

by:

       update @log_base4 { ip saddr limit rate 1/minute burst 2 packets } log group 0

5.10 is lacking this patch:

commit fca05d4d61e65fa573a3768f9019a42143c03349
Author: Pablo Neira Ayuso <pablo@netfilter.org>
Date:   Sat Jan 16 12:26:46 2021 +0100

    netfilter: nft_dynset: honor stateful expressions in set definition
