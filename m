Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E2F15886D
	for <netfilter@vger.kernel.org>; Wed, 23 Oct 2024 09:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.254.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729674220; cv=none; b=I5QcYMKOyPaA/XkNG7lUpjvmLk8lOMUXJbZWoKdaNyhy1OmQbPNYgHMOmV5EVQpL1BMcDBDwNHUyRvsesUK6DkOecWwjLzwrUpp5E6XlqPKIoqUTft6zgz576ZCq+u215fLXHJRmGx2KCz8GKuQSmpqDt7Vv5Zj60BXX5BcyHnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729674220; c=relaxed/simple;
	bh=3y4NG5uuMnKC4LJDgzzaeVfiNEZ6FZC9s8GA0ViFFcs=;
	h=To:From:Subject:Date:Message-ID:References:Mime-Version:
	 Content-Type; b=PZ3JyU6nCNOL0EWeGi+kqS4kcOKv0RViDuuTaDEZRgP0BwzKkq7AQUWbFCJUHeZx1JJpdNFZtugcK5HNVTOXACqFggYmXlM41FmVFISQ6gY359D5d/XMKQjV4/eUzcoFbyHUnZsSVKFlxvMuTVWmU7BqbfHgsxXNAJWybge/BHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=amorsen.dk; spf=pass smtp.mailfrom=m.gmane-mx.org; arc=none smtp.client-ip=116.202.254.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=amorsen.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.gmane-mx.org
Received: from list by ciao.gmane.io with local (Exim 4.92)
	(envelope-from <gnng-netfilter@m.gmane-mx.org>)
	id 1t3XH8-0006H7-2m
	for netfilter@vger.kernel.org; Wed, 23 Oct 2024 11:03:30 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: netfilter@vger.kernel.org
From: Benny Lyne Amorsen <benny+usenet@amorsen.dk>
Subject: Re: Most optimal method to dump UDP conntrack entries
Date: Wed, 23 Oct 2024 11:03:22 +0200
Message-ID: <knyuyazfmvcht1.fsf@amorsen.dk>
References: <CABhP=tZe2MDYJWqmyhb=we2g_v11wuDb6yBp878vt7qQYrvUiA@mail.gmail.com>
	<20241017124632.GC12005@breakpoint.cc> <ZxE8-pDn9Alzm50K@calendula>
	<CABhP=ta5FesHP+xnPq7UaiNvvorfGgPJZV9Xxdvk_-SLk7ZxEg@mail.gmail.com>
	<20241017233031.GA3675@breakpoint.cc>
	<CABhP=tY=YnMPSMH0-T2oxHyE2Uzoy=RnHQmO4DRQ_Go8xzMGeg@mail.gmail.com>
	<20241018113318.GA28324@breakpoint.cc>
	<CABhP=tZronr5azSE9mrr+hTKWFVb41jYQ2FzoWDahwVf1Zt4zQ@mail.gmail.com>
	<20241021135342.GB15761@breakpoint.cc>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain
User-Agent: Gnus/5.13 (Gnus v5.13)
Cancel-Lock: sha1:nx2HtpAigUYSMh4gOKFBhUXIsfU=

Florian Westphal <fw@strlen.de> writes:

> Here is a better patch, renew only when responses are seen.
> This means that once either initiator or responder ceases to send
> packets entry will time out.

It is common to syslog using UDP without having a response. It seems like this
will allocate a new NAT entry every so often, changing the source port
of any SNATted syslog. This in turn will mean extra sessions on any
other firewalls the traffic might go through.


