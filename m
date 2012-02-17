From: Andrew Beverley <andy@andybev.com>
Subject: Re: How to restrict torrent download  ?
Date: Fri, 17 Feb 2012 18:27:19 +0000
Message-ID: <1329503239.30413.33.camel@andrew-desktop>
References: <20120216160904.2ea59e26@shiva.selfip.org>
	  <1329389715.3296.12.camel@ns014530.dcyb.net>
	  <4F3CE276.4010500@cloudways.com>
	 <20120216171502.78212a3e@shiva.selfip.org>
	  <20120216171909.3a3cd4c1@shiva.selfip.org>
	  <1329393715.3296.18.camel@ns014530.dcyb.net>
	 <1329411784.18690.463.camel@andrew-desktop> <4F3D60A6.2040803@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F3D60A6.2040803@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1329503241;
	bh=lJZHjbij0YDxND8C/p9hguSYgb4FGye4GkAIDJE9sDU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=chbUoERuQ5yycTtPiUt5vhqC1yf6fwmP9yJ8LXxUqg+X95cu/rhQqDMTkLaYV0kdC
	 1dZrMsb1ItWzp4ZxsfsLJfDPy/AC/6Ot1v3zZhAtaZ4YczCX8xgP6vnn6TRaikOoJP
	 w2+3RVRYCsO9aHMCa0h0xbdachjWDTXcfQotLsDE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: J Webster <jw.jwebster@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, 2012-02-16 at 20:01 +0000, J Webster wrote:
> > Personally I use the rather brutal technique of looking for several
> > connections to high port numbers from a single client. I dare say there
> > are false positives, but it works for me.
> >
> > The details for that are here:
> >
> > http://andybev.com/index.php/Fair_traffic_shaping_an_ADSL_line_for_a_local_network_using_Linux

[Top-posting fixed]

> Will this work on CentOS 5?
>

No, according to this post:

http://lists.centos.org/pipermail/centos/2008-June/059656.html

> How important are the kernal and iptables versions to implement it?
> 

You'll need connlimit and ipset. Connlimit became part of the stable
kernel in 2.6.23 (thanks Jan). I can't remember whether ipset has made
it into the stable kernel yet, but it certainly won't be in the kernel
of CentOS 5 (unless it's available as a separate package).

Andy


