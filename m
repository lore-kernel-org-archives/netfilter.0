From: Andrew Beverley <andy@andybev.com>
Subject: Re: problem with multi-level SNAT? (multiple uplinks/providers)
Date: Mon, 02 Jan 2012 18:25:33 +0000
Message-ID: <1325528733.2270.32.camel@andybev-desktop>
References: <op.v7e0qja7x1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1325528745;
	bh=BaYgsZlLtUeSB8B2pWt2ATjycuEt+iQQ980mJuOQuhQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=E7dxXaxkOHGSSFoFmAfhRNd9nljWiASqU+TjiPTNfzYUah1yU23ZoWLilvnj5xSZJ
	 pLOxF/q00vVz+b4IEfeHydfQPlQYHK/+490XfybB+ui3jYBDTDzt0g9/HAIxGpaOh6
	 gebnriaNHiicofj+yMeOR3/8aqtZ75Mfxno+FCE4=
In-Reply-To: <op.v7e0qja7x1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

On Sun, 2012-01-01 at 11:12 -0600, Lloyd Standish wrote:
> I would like to know why SNAT without packet marking drops the
>  connections for interfaces that have "upstream NAT," while the fwmark
>  method succeeds.

I can't answer this, but on your other comment...

> As a related aside, I'd appreciate comments on whether or not the "-p
>  tcp" in the following example rule is advisable (I omitted "-p tcp"
>  from my SNAT rules.): iptables -t nat -A POSTROUTING -p tcp -o eth0 -j
>  SNAT --to-source 194.236.50.155

Well, I never put a -p tcp in SNAT for any of my configurations. I'm not
sure why you would want to limit SNAT to just TCP?

Andy


