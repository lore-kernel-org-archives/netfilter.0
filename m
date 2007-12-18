From: "=?ISO-8859-1?Q?Gwenha=EBl_Pasquiers?=" <gegefr@gmail.com>
Subject: Re: Captive portal and DNAT
Date: Tue, 18 Dec 2007 14:41:37 +0100
Message-ID: <47050bf90712180541y1e41214dj698fd320a59b18f0@mail.gmail.com>
References: <47050bf90712170641h7cdcf7f5kfe352a999a60beb3@mail.gmail.com>
	 <1197905123.19486.231.camel@grateful.d.umn.edu>
	 <47050bf90712170825j5ba29561oba08f023de7f6dd4@mail.gmail.com>
	 <47050bf90712170844p2b4057ckaf97c5974c2bd617@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=nWJ1IFUYk4K6OP6Vu+6toK8VFsars+E1DJZallFeb1s=;
        b=tFBKrELKaxut1kHCya1t0Dv35hh+CkqZuF08sX+pAAZ7OXT2mypLbNh8/ts3LJCWY8hOuhud3/gkpSwATORN8LaR2takXO2rJgsnfAw+UOvARShyqvCxKq1rSa7byRul+EMAjooz1Va492jCf9KeArLzQAVb0GnZ0uOmmCljntQ=
In-Reply-To: <47050bf90712170844p2b4057ckaf97c5974c2bd617@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Zagrabelny <mzagrabe@d.umn.edu>
Cc: netfilter@vger.kernel.org

After investigating i found out that the NAT connection is probably
monitoring the underlying TCP connection, so setting the Keepalive to
0 should do the trick.

However, I think the same problem occurs when a client goes from
authorized to unauthorized state.

Wouldn't the currently active TCP connection pass throught their NAT
connection as long as they are not closed (from a TCP point of view)?
