From: Andrew Beverley <andy@andybev.com>
Subject: Re: Order of match extensions
Date: Thu, 06 Oct 2011 23:34:44 +0100
Message-ID: <1317940484.26402.2462.camel@andybev-desktop>
References: <1317934544.26402.2370.camel@andybev-desktop>
	 <alpine.LNX.2.01.1110062258400.26555@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1317940485;
	bh=R77VAqIZ5kdYMjW4d+m+GRK1R06e9nNv38ju34w052I=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=kkO8olLNj0mwRj5o+2rYG6Gkij64Pf2dzez73R1VdAI+DbDLs61hB5JJ59qHXoX4h
	 9+sXlVwbjycgd2wN6wZSgQ0aKbLbHkmshaI5C3Cq4eeNY4mqyqQ9Q2U2sxHXAtC1t9
	 DYiR8l94xI9SnWCHfWXsh+skaiZEWOvSxHGmiiWY=
In-Reply-To: <alpine.LNX.2.01.1110062258400.26555@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Thu, 2011-10-06 at 22:59 +0200, Jan Engelhardt wrote:
> On Thursday 2011-10-06 22:55, Andrew Beverley wrote:
> 
> >Hi,
> >
> >Does the order of match extensions matter for iptables rules?
> 
> Clearly.

Okay... so why does this rule appear to not match anything?

iptables -t mangle -A FORWARD -i eth0 -m state --state NEW \
        -m statistic --mode nth --every 1 -m mark ! --mark 99 -j LOG

Is the importance of the order documented anywhere?

Thanks,

Andy


