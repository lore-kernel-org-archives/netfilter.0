From: "Bradley Kite" <bradley.kite@gmail.com>
Subject: Re: DNAT, and finding out original destination IP?
Date: Fri, 25 Apr 2008 13:19:55 +0100
Message-ID: <e97f32c10804250519n417abbb0kc77691153856e443@mail.gmail.com>
References: <e97f32c10804250406ve0f4b5dx2d1ca01f5dae9f84@mail.gmail.com>
	 <alpine.LNX.1.10.0804251403280.11644@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=75luVj04Sf80C/Av8G2OWvtn/6pz7I9WfqcbjHTTHfg=;
        b=rNcn7LPty6bzbqKGMJgNJ99eCjLCJ69WKrERaRjJcOOUdKahVG0CQUObmwkgo1fTahVQCPVLbBsoHam1IhAuLsFqwsM7P9J4Zyj5CluTzZJfrus7+X2aDlXr9RUmRmTYR5iis/70iO3QGDLO+TSvOq3hn0qUIkcpIuxKxJQk3bE=
In-Reply-To: <alpine.LNX.1.10.0804251403280.11644@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: netfilter@vger.kernel.org

On 25/04/2008, Jan Engelhardt <jengelh@computergmbh.de> wrote:
>
>  On Friday 2008-04-25 13:06, Bradley Kite wrote:
>  >
>  >I'm using DNAT to transparently redirect TCP connections to a local
>  >application which is listening on a port for new connections.
>  >
>  >From within my application, I'd like to be able to find out the
>  >original destination IP address of the packet/connection, before it
>  >got DNAT'ed.
>
>
> getsockopt(... SO_ORIGINAL_DST ...) in endpoint programs or
>  alternatively, iptables -m conntrack --ctorigdst <xxx> can be used
>  in iptables.
>

Many thanks, thats so much simpler and will save me a lot of work.

Regards
--
Brad.
