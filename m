From: SamLT <sam@sltosis.org>
Subject: Re: iptables udp 1195 MASQUERADE
Date: Sat, 11 Feb 2012 10:13:26 +0100
Message-ID: <20120211091326.GB6946@tosh.sltosis.org>
References: <22755605.2952.1328898963472.JavaMail.root@ixer.mx>
 <1328904347.18690.264.camel@andrew-desktop>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sltosis.org; s=mx;
	t=1328951609; bh=pA+YGEQwvv+XtGELGccsZwngmVI/CC5EOVhZE44h2qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=JwC/tXAuZiqEp7RcPoZqiu3UydMBzwYICaaIGGwk3j2M6k8/sPI3wungQOHvHUDDG
	 zN1ChYntPMOiXNnKZatFOTMP/9Lga4iv64WSGaAKt2GM+9A5gpyFYS++kQptPJ1Ies
	 tFFW9AIhjgnz1nhhgZP3YnBbJJcacAQuT7AgvUD8=
Content-Disposition: inline
In-Reply-To: <1328904347.18690.264.camel@andrew-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: ehuerta@ixer.mx, netfilter@vger.kernel.org

On Fri, Feb 10, 2012 at 08:05:47PM +0000, Andrew Beverley wrote:
> On Fri, 2012-02-10 at 12:36 -0600, Enrique Huerta de la Fuente wrote:
> > iptables -t nat -I POSTROUTING -o ppp0 -j MASQUERADE
> > 
> > but it does not work.
> 
> Are you *sure* it's not working?

Sorry to jump in here, but, I agree with Enrique, could you show some
tcpdump output or something?
   - Do the paquet go out from ppp0 without being MASQUERAD'ed?
   - Do they go out from an other interface?
   - Does it look like they are being filtered? or REDIRECT'ed?

> 
> > 
> > Any ideas?
> 
> Upgrade maybe? As said previously, it's always worked for me.
> 
> Andy
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
