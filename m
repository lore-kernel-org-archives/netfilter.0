Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A851CF7D6
	for <netfilter@vger.kernel.org>; Tue, 19 Nov 2024 16:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732032389; cv=none; b=easX5Pnel3n5kkU7SBIf8tOtHG4VRzXscaVEEQnKiK/aNoufF+zESM05C6IW6m6r5ipCTw9fNFSBuETsKR7Wlc8bU8iNgqJuV+lfqKdIqsd1fLXOfVBQc9ZD1m7abBzJbrWdWgQJt5QnRE73rfueb+FOA3abtn0DqF/0V5MF3j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732032389; c=relaxed/simple;
	bh=CKAliH4LG9t6GS8OFQHI3bKbZwN9w7t6R4HPBEAQsSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8qH4eo2BxOs3pxcNSp/gEU5P8UGcNKi9to2hdv8Lgnn3ybmuE2K+2bQKvoKoCyF39eULFAPFKhuKQWxS8V3edIl574rkyaH2UIeJ7Qj6JzCD8hNxwZJ6MO8IV0YViuOx3A8i23PK3siirGRoFqc4b9cmM109AlVht7dfBKA1FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1tDQk5-00064o-4E; Tue, 19 Nov 2024 17:06:17 +0100
Date: Tue, 19 Nov 2024 17:06:17 +0100
From: Florian Westphal <fw@strlen.de>
To: Slavko <linux@slavino.sk>
Cc: netfilter@vger.kernel.org
Subject: Re: set with limit
Message-ID: <20241119160617.GA21970@breakpoint.cc>
References: <756a9507-5ecf-4ba4-a8d3-d364f13dbfd5@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <756a9507-5ecf-4ba4-a8d3-d364f13dbfd5@slavino.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)

Slavko <linux@slavino.sk> wrote:
> with nft v1.0.6 and kernel 5.10.226 i want to limit logging count
> by IP. I setup set:
> 
>     set log_base4 {
>         typeof ip saddr
>         size 1000
>         flags dynamic,timeout
>         limit rate 1/minute burst 2 packets
>         timeout 1h
>         comment "IPv4 base log limit"
>     }
> 
> It is then used in chain:
> 
>     chain input {
>         type filter hook input priority filter + 5; policy accept;
>         ...
>         update @log_base4 { ip saddr } log group 0
>     }
> 
> I see, that set is filled/updated by particular IP:
> 
>     elements = { X.Y.Z.W timeout 1h expires 59m59s360ms }
> 
> But i see 15 lines per minute (it sends packet every 4 sec) for that
> IP. I expect max 2 lines per minute...
> 
> Please what i did wrong?

Looks like 5.10 is too old, listing should show limit expression was
attached, i.e.:

 elements = { x.y.z.w limit rate 1/minute burst 2 packets timeout 1h expires 59m55s504ms, ...

... (this is with 6.11.5 and your rules above).
