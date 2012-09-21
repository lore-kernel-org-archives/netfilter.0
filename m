From: Andrew Beverley <andy@andybev.com>
Subject: Re: nfq_set_verdict
Date: Fri, 21 Sep 2012 21:00:55 +0100
Message-ID: <1348257655.4663.97.camel@andrew-desktop>
References: <CA+JxU+5mE7cYFR53HZwwOMLhB9Ho1C4+eTrs81Z2r0yy6Yh=4A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+JxU+5mE7cYFR53HZwwOMLhB9Ho1C4+eTrs81Z2r0yy6Yh=4A@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1348257658;
	bh=6VQ2qZArxVJAdVJOf7jjoAyQBtH8euIEk4PJSM9z3r4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=NWl30/reiD9R7P0559ro+uGYwN/KDhIosvon4PBpJg4r6lnzx6wZnC5ygkaKv6Dr3
	 swU7WwT0q3QChgiQaGDzdO+vdpiEQInaOjFbLp/ZEdy/LaSogdpMwSBfy+CswEPUDg
	 okbQ87VzlKBDlZGSCj0oSWZuodJGDWap+oXH4+DU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bradley Kite <bradley.kite@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, 2012-09-21 at 14:38 +0100, Bradley Kite wrote:
> Any clarification would be appreciated - or perhaps someone can point
> me in the direction of the right way to introduce delays to specific
> packets in this way?

Could you use the netem qdisc instead, and filter only the required
packets into it?

Andy


