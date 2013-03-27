From: Andrew Beverley <andy@andybev.com>
Subject: Re: Question about xt_ipp2p module
Date: Wed, 27 Mar 2013 17:52:21 +0000
Message-ID: <1364406741.1819.23.camel@andrew-desktop>
References: <5151FCD4.8020901@stidia.com>
	 <1364333332.1819.5.camel@andrew-desktop> <5152B9AE.4020901@stidia.com>
	 <alpine.LNX.2.01.1303271432150.12443@nerf07.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1303271432150.12443@nerf07.vanv.qr>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1364406750;
	bh=p3FKwcyjrWxgCGHlWyN3SzEkMe4mConpNHCQL+g2NmI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=Hmfyd/mlxGLWgK3eqglQ3sQqN3PkhrV/XkgpZmm5iyNlahjFafor/KPIYZt0pjRum
	 LhGFHTalOSEZik0wTJlyCmvf4xN7D4pIX/rujAiRgCIXQgUbv9MRIoOWVYY4++LrBm
	 Fihs9q+bTiGhfdEKQv5zZDW+tDeW/4m40QAhG+AE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dmitry Korzhevin <dmitry.korzhevin@stidia.com>
Cc: netfilter@vger.kernel.org, Jan Engelhardt <jengelh@inai.de>

On Wed, 2013-03-27 at 14:32 +0100, Jan Engelhardt wrote:
> On Wednesday 2013-03-27 10:19, Dmitry Korzhevin wrote:
> >
> > 1 33  2970 ACCEPT     all  --  eth0   *       10.2.0.2   0.0.0.0/0      policy
> > match dir in pol ipsec reqid 116 proto 50
> > 2       26 10983 ACCEPT     all  --  *      eth0    0.0.0.0/0
> >  10.2.0.2            policy match dir out pol ipsec reqid 116 proto 50
> >
> >
> > But, this rules is inserted automaticaly by strongswan ipsec daemon, after my
> > connection..
> 
> So turn it off in strongswan?

Or if you can't do that, then just delete the rules once they're in
there, or reinsert your own rules at a higher priority.

Andy


