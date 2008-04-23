From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: Re: Reject with tcp-reset on a bridge
Date: Wed, 23 Apr 2008 13:02:52 -0700
Message-ID: <d95317090804231302p3d405eao83b48c0a10da259b@mail.gmail.com>
References: <d95317090804231131j66d2f84fp20a548c7d0f4d0a3@mail.gmail.com>
	 <alpine.LNX.1.10.0804232050150.15791@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=iQOmtQEzsMIoiK+W++IZ9tKza5z6yPDaqOOdI6L6J9o=;
        b=xeyG2bQBE79WNncXE1A1wbhJ+sXVd+tm/jG7NZLtRK0deGDAZV6E8VDyaYUg5MZtPeyuHC7FPUlNfdNo2yL97twzENWHqHlp+n6HqeunD8C1llufxOCVCXdi/kOWPqEijj0Ect1rVrtUqy94bU7B1ZCA/MR/Wxa27sbazGWlpW4=
In-Reply-To: <alpine.LNX.1.10.0804232050150.15791@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: netfilter@vger.kernel.org, Netfilter Developer Mailing List <netfilter-devel@vger.kernel.org>

My scenario is slightly different.
tcpdump doesn't show ANY response, with the right or wrong MAC.

Ubuntu 7.10, kernel 2.6.22-14

2008/4/23, Jan Engelhardt <jengelh@computergmbh.de>:
> On Wednesday 2008-04-23 20:31, Gilad Benjamini wrote:
>
>  >I am using iptables to firewall connections on a bridge.
>  >
>  >The rule below (minimized to the sake of the example) works
>  >       iptables -A FORWARD -p tcp -j REJECT
>  >
>  >A TCP-reset variation doesn't work
>  >      iptables -A FORWARD -p tcp -j REJECT  --reject-with tcp-reset
>  >
>  >The TCP packets don't go through, but I don't see a RST, or any other
>  >packet, coming back.
>  >My options are:
>  >   a. Something is wrong in my configuration
>  >   b. This isn't suppose to work
>  >   c. This doesn't work because of a bug
>  >   d. None of the above
>  >
>  >Which is it ?
>
>
> Since missing features may be perceived as bugs but which of course
>  are not, it would be 0.5*c+0.5*d.
>
>  http://marc.info/?l=netfilter-devel&m=120716501006420&w=2
>
