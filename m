From: Andrew Beverley <andy@andybev.com>
Subject: Re: conn association query
Date: Thu, 13 Dec 2012 20:11:57 +0000
Message-ID: <1355429517.26190.193.camel@andrew-desktop>
References: <201212130102.02617.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201212130102.02617.neal.p.murphy@alum.wpi.edu>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1355429525;
	bh=gjZP1klFo6C479qPswtxNn7Qd3X/y/a+YyjN25OqeZ4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=Yp1A5x+ie4QRIHiNkRYRCooLZUQ2v/XpTGpS7vC5dJqNKKCnumzOcfhLWTy1UP1pc
	 TQ2ckEHDammr3wmtTo96xm9bRbp2OmyeYVzeykF1t3naUVvgvV342FBzUDO1gf7bBO
	 VTeejcbV1tErnyUbz3AiIQQbMWANQPnxlj7BrPrI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: neal.p.murphy@alum.wpi.edu
Cc: netfilter@vger.kernel.org

On Thu, 2012-12-13 at 01:02 -0500, Neal Murphy wrote:
> Brief summary
> -------------
>   I want to be certain that my firewall stops all communication on a conn and
>   its related conns when that 'master' conn becomes prohibited or is
>   disconnected.

I've not tried recently, but I seem to recall from past experience that
it doesn't. Why not just try? Use your FTP example, start an FTP
connection, prohibit the "master" FTP connection and see what happens to
the related connections?

It may not be the answer you want, but one way around this might be to
flush the conntrack table (conntrack -F) at the relevant point in time.

Andy


