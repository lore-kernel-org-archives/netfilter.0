From: Borislav Petkov <bp@alien8.de>
Subject: Re: v3.10-rc7 oops soon after boot
Date: Mon, 24 Jun 2013 18:13:05 +0200
Message-ID: <20130624161305.GC26766@pd.tnic>
References: <20130624094145.2576.qmail@science.horizon.com>
 <51C816C8.4080709@cn.fujitsu.com>
 <20130624113441.GA2583@localhost>
 <20130624151031.GB3917@localhost>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1372090388; bh=tZy0+db4JqPZXYcWnqNEzqKljYRN4nLu1x5K79nd60g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=sfbQiB36+pJGfe/r7Ic5pCmvPscXsxfgIoTCBh
	V/vJDCLjNXYiVUExd8jh/EX/uoDVNX4CyIrnvzoRR7kdLzBxYlYz+s6EKN8sqxznUBH
	STxkP+1rA5PfggMv7rKjLlW5735C7zfg6G7nZINF93EYDT6JO5D7d4gOQ6QBshi45c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1372090388; bh=tZy0+db4JqPZXYcWnqNEzqKljYRN4nLu1x5K79nd60g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=sfbQiB36+pJGfe/r7Ic5pCmvPscXsxfgIoTCBh
	V/vJDCLjNXYiVUExd8jh/EX/uoDVNX4CyIrnvzoRR7kdLzBxYlYz+s6EKN8sqxznUBH
	STxkP+1rA5PfggMv7rKjLlW5735C7zfg6G7nZINF93EYDT6JO5D7d4gOQ6QBshi45c=
Content-Disposition: inline
In-Reply-To: <20130624151031.GB3917@localhost>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Gao feng <gaofeng@cn.fujitsu.com>, George Spelvin <linux@horizon.com>, kaber@trash.net, linux-kernel@vger.kernel.org, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On Mon, Jun 24, 2013 at 05:10:31PM +0200, Pablo Neira Ayuso wrote:
> > I have mangled your patch, find it attached.
> 
> > From 79da8ea854c06ca9320decbb2f9d2e8d25b2f7e5 Mon Sep 17 00:00:00 2001
> > From: Gao feng <gaofeng@cn.fujitsu.com>
> > Date: Mon, 24 Jun 2013 17:04:02 +0800
> > Subject: [PATCH] netfilter: ipt_ULOG: fix incorrect setting of ulog timer
> > 
> > The parameter of setup_timer should be &ulog->nlgroup[i].
> > the incorrect parameter will cause kernel panic in
> > ulog_timer.
> > 
> > Bug introducted in commit 355430671ad93546b34b4e91bdf720f3a704efa4
> > "netfilter: ipt_ULOG: add net namespace support for ipt_ULOG"
> > 
> > ebt_ULOG doesn't have this problem.
> > 
> > Reported-by: Borislav Petkov <bp@alien8.de>

This should be:

Reported-by: George Spelvin <linux@horizon.com>

I only connected the dots...

:-)

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
