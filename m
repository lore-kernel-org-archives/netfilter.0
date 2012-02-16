From: Andrew Beverley <andy@andybev.com>
Subject: Re: How to restrict torrent download  ?
Date: Thu, 16 Feb 2012 17:03:04 +0000
Message-ID: <1329411784.18690.463.camel@andrew-desktop>
References: <20120216160904.2ea59e26@shiva.selfip.org>
	 <1329389715.3296.12.camel@ns014530.dcyb.net>
	 <4F3CE276.4010500@cloudways.com> <20120216171502.78212a3e@shiva.selfip.org>
	 <20120216171909.3a3cd4c1@shiva.selfip.org>
	 <1329393715.3296.18.camel@ns014530.dcyb.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1329393715.3296.18.camel@ns014530.dcyb.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1329411788;
	bh=D4RDpG7X2Z4wisXE108tgGXLFXVEn9a15ZbeeggCoWM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=QCi1/Dal6+HM9NIMJmTMXmJDUh9WU05rwcbsH9dYLDpXDIQGZizyTraDpb0GknPcZ
	 nmGWjInDM9ucHVWak7XdKnFstBqBagCNSVBFNlZwIyAQQR/41xd7djkoaukjflV+MO
	 sK2eM1RnotwEQr1G+cJc0fptXKWiVR0NiI4FXe1Q=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Rob Sterenborg (lists)" <lists@sterenborg.info>, "J. Bakshi" <joydeep@infoservices.in>
Cc: netfilter@vger.kernel.org

On Thu, 2012-02-16 at 13:01 +0100, Rob Sterenborg (lists) wrote:
> I think
> 
> # man xtables-addons, Section ipp2p

I believe that ipp2p is no longer maintained; their website recommends
openDPI instead. I've never tried it myself, but it looks promising.

Personally I use the rather brutal technique of looking for several
connections to high port numbers from a single client. I dare say there
are false positives, but it works for me.

The details for that are here:

http://andybev.com/index.php/Fair_traffic_shaping_an_ADSL_line_for_a_local_network_using_Linux

Andy


