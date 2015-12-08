From: Scott Bronson <bronson@rinspin.com>
Subject: Re: Why isn't DNAT happening for host-originated packets?
Date: Mon, 7 Dec 2015 16:53:54 -0800
Message-ID: <CAKmUPx63JOfQ2Qv7JBu+b70c_oCWJF=cbnfxJfD7qs=tsEok1Q@mail.gmail.com>
References: <CAKmUPx5kE+v03OGAjF32rOGyVQfOLbSmyTEOOK9uApANeWbU1A@mail.gmail.com>
	<5660CCD1.60807@familie-kuntze.de>
	<CAKmUPx44yvsz21jRE9BoxK0D4R+gGjJdk9De5QQHUBzj6o9r6Q@mail.gmail.com>
	<5660D6D3.8040205@familie-kuntze.de>
	<CAKmUPx4jX4wyK10jR9Qr0DEPveRG5kOoLnuScpLgWE78DRXtyw@mail.gmail.com>
	<CAKmUPx6yaQdb1OE6CSf0TQ=eZYV=eX7Kmdzg-x6nVPtxtMpLEA@mail.gmail.com>
	<5660DFC7.9040206@familie-kuntze.de>
	<CAKmUPx5751FXOkBBhcxUKPBwq2cQrBSkoYX4JGJfy-UZE9+Vmw@mail.gmail.com>
	<5662B8BD.1040908@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rinspin-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=cB11LXTZenQvSUL0znDz5L5dtsnVvoQ0L1DEG1SThF4=;
        b=U/FLvTmQ7gIrGHoO+RcYeH2CaAc5tHqF4eI0ub+1CziPZJfNclUuy9RJNOCnnK4QAr
         ygGSjWw96vQ2CnMa5pp9MwSvChin39Wi71XhgPgjMF3nbt63pihWVAUWKSO1UovJlu5d
         +rdo1I2/gMgRUWsjJYqS/LK/Z/pLqGIxXfdtUZbhqwusuf380jyWvqVvP9/qMaVZMfqs
         Q6Cj62G8zTWKGrsIovsDX8mxYknEsmRX6uxFbyo5nQgI6QidDmiMEXczHRuo6ly9JHIa
         kEEo2Perxawzixuncl3lI5xM1UJfPpr4V2QbnoznpCsJnpy32ffP52MEF1qr+zTrleKY
         ecHw==
In-Reply-To: <5662B8BD.1040908@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: Noel Kuntze <noel@familie-kuntze.de>, netfilter@vger.kernel.org

On Sat, Dec 5, 2015 at 2:13 AM, Pascal Hambourg <pascal@plouf.fr.eu.org> wrote:
> It's not handled specially /per se/.
> It's a side effect of how conntrack and NAT work. The conntrack confirm
> takes place at the end of POSTROUTING, and no new NAT rule can be
> applied on a confirmed connection.
>
> The same applies to packets belonging to an established connection :
> they all skip the nat chains.

That makes sense (assuming PREROUTING above).  Thanks, this seems
way less arbitrary.


> The special thing in the loopback path is that there is no need for an
> input routing decision after PREROUTING. So, what would happen if you
> could actually DNAT the packet ?

I would like to change its destination, then have the routing decision after
PREROUTING send the packet somewhere else.

Just because it arrived local doesn't mean I want it to stay local!

But that's no big deal.  I'm making the PREROUTING+OUTPUT
chain modifications now, everything looks OK to me.
