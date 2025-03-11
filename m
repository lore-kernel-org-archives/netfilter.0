Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA0425CC71
	for <netfilter@vger.kernel.org>; Tue, 11 Mar 2025 14:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741704499; cv=none; b=IxnBdOTc7OekKfWkq0UTI3ag0hCoRz0bYuKU6wJMxTX9/k+NIZ7YAPam+BxKQpU3+pEDbMo54v13M16K56XQ7E+e/Mgw36P8H3lmFNAb8UPWzZSRWgx94X+W4D+qFTMsX5qZ+kUlUK6faVV1LEjXzp+ltv/o8oz94Bxa77jtDog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741704499; c=relaxed/simple;
	bh=a4niWyETtmrjgeA/mrIx9VQOrThLoLjgEhKk5XIVfB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZNDithnBNqGeiU/qyg5iWshtXBIyxIYlSmWZglSTIyZD7l7lW0PqPnAe1IUqxlakDPpYmzFMuV7FCjE3+Lt1foyfdKiSMDbP9rlLFyjfHYUCi1tXwu+As0SFc6yzoSgQBbY74Xkq5a/xjgXSZMu3EP7g9LzslhDpyFyQrA1hn1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1ts0tw-0003P7-Hg; Tue, 11 Mar 2025 15:48:12 +0100
Date: Tue, 11 Mar 2025 15:48:12 +0100
From: Florian Westphal <fw@strlen.de>
To: Eray Bilgin <bilgin@eray.ca>
Cc: netfilter <netfilter@vger.kernel.org>
Subject: Re: connection tracking fails to update udp timer
Message-ID: <20250311144812.GA12767@breakpoint.cc>
References: <1958568e9a1.be49b3ad53051.1702359735061948725@eray.ca>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1958568e9a1.be49b3ad53051.1702359735061948725@eray.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)

Eray Bilgin <bilgin@eray.ca> wrote:
> i noticed this when my voip phone mysteriously stopped ringing. i use
> a tp-link router as a gateway which i'm certain is running
> linux/netfilters, though i don't know what version. i've observed the
> same problem on my raspberry pi running iptables v1.8.2.
> 
> usually the first thing a sip client does is register with the provider's
> server. this has the effect of punching a hole through any firewalls in
> its path. after that initial registration, my provider keeps the
> connection alive by sending messages every 60 seconds.
> 
> when netfilters sees traffic moving back and forth, the connection should
> transition to the assured state and set the expiration timer to
> nf_conntrack_udp_timeout_stream, which by default is 120 seconds. but in
> this case the timer is reset to nf_conntrack_udp_timeout, which is 30
> seconds. the connection does not appear as "assured".

Replies during first 2 seconds are ignored in order to prevent
DNS requests from triggering assured state + 2m timeout.
