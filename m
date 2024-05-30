Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48758176AD2
	for <netfilter@vger.kernel.org>; Thu, 30 May 2024 08:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717056207; cv=none; b=i7w+jqX/N+j8otRnoZflceL6qwVL1r9ooKAVyMaFgelIb7hcDP5+QukchuSir/uY6BtoeD5RsHYkSNOUmylZGogYe4Z1aphMtZlLHk7Hbk1toxCOvaocUWZL+HuWZfJXP8zBhfC7/Lz5ozJ1yy6U4RfIlSR8gc8/t+q4VqEKMN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717056207; c=relaxed/simple;
	bh=taCg0hOVEnCwBNJcNXyd+DYJV5Ym9uaa9NBAfO9O0X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SuG4sLoG39Cf2edST3PykOv9bSj5PR14LmHVevmJYeKmftL/LTk6kpHUBZQSAPqS5355ww4MWaVHo2yiMP0F7ssGVaku7LUUI8oMbadQkXhpAR3IS+sDHGHhs8Ay0eVf5ZxNM5FsdVlzxnB/9kjwMJ8pbwgVZ9JUE6zOYyq1i/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1sCakt-0000WZ-Q0; Thu, 30 May 2024 10:03:23 +0200
Date: Thu, 30 May 2024 10:03:23 +0200
From: Florian Westphal <fw@strlen.de>
To: Pascal Ernster <netfilter@hardfalcon.net>
Cc: netfilter@vger.kernel.org
Subject: Re: Cant get "tcp dport 22 @ih,0,32 0x5353482d" to work/match
Message-ID: <20240530080323.GB19949@breakpoint.cc>
References: <c2c52fe9-5ff1-4eb9-96e5-81e645e77b50@hardfalcon.net>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2c52fe9-5ff1-4eb9-96e5-81e645e77b50@hardfalcon.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

Pascal Ernster <netfilter@hardfalcon.net> wrote:
> Hi,
> 
> 
> I'm trying to write an nftables rule set that should eventually allow
> multiplexing SSH and TLS on TLS port 443. The idea is to match the "SSH-"
> string in the TCP payload of the SSH client's first packet of the
> connection/handshake to port 443, and then redirect/forward that TCP
> connection to port 22, where the actual SSH server is running.

You cannot redirect once the first packet has been processed.

> However, I seem unable to get "@ih" expressions to work/match at all - even
> when I write two "@ih" expressions that should match the exact complement of
> each other, none of them match anything. Here's the full output of "nft list
> ruleset" after one SSH connection to port 22:
> 
> > # nft list ruleset
> > table inet filter {
> > 	chain input {
> > 		type filter hook input priority filter; policy drop;
> > 		ct state invalid drop comment "early drop of invalid connections"
> > 		ct state { established, related } accept comment "allow tracked connections"

Rule above accepts the packet with SSH string in the payload.

> > 		tcp dport 22 counter packets 1 bytes 80 log prefix "##### SSH DEBUG 3 ##### " flags all accept comment "allow SSH- via SSH port"

... and this matches the initial SYN packet.
