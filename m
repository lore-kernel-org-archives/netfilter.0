From: Alberto Quattrini Li <alberto.quattrinili@gmail.com>
Subject: Re: NAT with forwarding to multiple destinations
Date: Thu, 2 Dec 2010 16:17:32 +0100
Message-ID: <AANLkTikqRS-eDLB2Ep=kDVok9FLOpqnDfg45MuFL7sBh@mail.gmail.com>
References: <AANLkTinoWt8qNJKYhyjHbM5oOb-V6_aNAqTm=EJmU1Gn@mail.gmail.com>
	<alpine.LNX.2.01.1012021430220.5361@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=02zAAWSAkgzbgq1Tic0GXWm9CTmcCgzbMIFSFBhC2aY=;
        b=iL/9YhY/AeRlSND3a4L9KZ99LOknv/D3znaYmAZGwOT6rpF1sw+ec8QQDxcW5Pv6aT
         2w0tX/r3Yho3jSRETB8IPnTlMPQq0bxAXuOPkV2Ks5VO+9HPklBD+1Won9qWv9btqFUu
         vt1X/d13HoAciFBCEOcEMuHA282d9DSVPSDWQ=
In-Reply-To: <alpine.LNX.2.01.1012021430220.5361@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

> NAT does not do forwarding, and neither does Netfilter - routing will.
I know that, but it works with just IP addresses, and not port.

> The multiplexing you want is probably best done with a program that does
> just that - think of sprucing up rinetd.
As far as I know, all of the programs like that are programs that run
as a process in the middle, so it introduces an overhead (because they
are in userspace and have to receive the packet and then process it
and finally forward it), whereas if it was processed by netfilter it
would be quicker and more efficient (actually some testing and
comparisons should be done, but in principle it ought to be so).

However it seems that there doesn't exist any solution in netfilter.
Can you give me a reference (e.g. documentation and guides) to patch
netfilter with such functionality?

Alberto
