From: Andrew Beverley <andy@andybev.com>
Subject: Re: any way to reset all marked connections when using CONNMARK?
Date: Sat, 12 Feb 2011 11:42:15 +0000
Message-ID: <1297510935.1770.38.camel@andybev>
References: <4D55A927.7060703@genband.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1297510937; bh=Il3wftW8MoHLsBQp4GiLT/csBF7rPo/BXX9qr
	m8aCKc=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=MJo9vH/i
	QWpwtzP21yvc4PZgPq7+pCtM8YTEmCJhDWwQuxTSvTRvyXc9UzXbY6QTRTy3R0aCnGB
	PbqojqAmTjWwGutGw3hg93qHrPVfge6nBkb82efhgENvDRFf5AcYUZxfxwSAenHhB4p
	zxFFNig/78N3372a47Ov43Lkn8ArU=
In-Reply-To: <4D55A927.7060703@genband.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Friesen <chris.friesen@genband.com>
Cc: netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, netfilter <netfilter@vger.kernel.org>

On Fri, 2011-02-11 at 15:24 -0600, Chris Friesen wrote:
> It has been proposed to add a custom patch to clear the mark for all
> marked connections--is there a better way of doing this?
> 

How about using the conntrack userspace command-line interface?

conntrack -U -m 0

looks like it should do what you want.

Andy


