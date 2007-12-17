From: "=?ISO-8859-1?Q?Gwenha=EBl_Pasquiers?=" <gegefr@gmail.com>
Subject: Re: Captive portal and DNAT
Date: Mon, 17 Dec 2007 17:25:19 +0100
Message-ID: <47050bf90712170825j5ba29561oba08f023de7f6dd4@mail.gmail.com>
References: <47050bf90712170641h7cdcf7f5kfe352a999a60beb3@mail.gmail.com>
	 <1197905123.19486.231.camel@grateful.d.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=REVkG0p0Ql9fSDFIXemB9capxossje+3Q5tG4varmLs=;
        b=MRHxnhCT5zcbaLw1evJwsgB54Hy63A34p30cv4mHYgy88tysRpyHvAJ+iScEDSV9lpsDf94vXqlyE7zCBthS76IwNZaIU/n3mulQPRHiyT/2k+LJYv/pTlzV09Lgjcny7lagBYGwFL6QWxVHk3iLIQ1/3aMI9Oqw0PVNhe5rxP8=
In-Reply-To: <1197905123.19486.231.camel@grateful.d.umn.edu>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Zagrabelny <mzagrabe@d.umn.edu>
Cc: netfilter@vger.kernel.org

Well in fact there is a TCP keep alive

And setting KeepAlive to false would resolve the problem.

However I think that's because the browser, when the TCP connection is
closed, uses a new source port to open the next TCP connection. (at
least firefox uses port+1).

That way it does not go through the same DNAT connection , goes into
the nat table again and is routed to the internet.

But there is no reason for the browser not to use the same source for
the next connection (I don't know at all how opera, IE etc etc would
behave).

But i admit i did not test opening a new connection using the same source port.

I'll try using REDIRECT (my http server is on localhost), I hope it
does not need to keep a context as DNAT does, but I'm afraid it's the
case.
