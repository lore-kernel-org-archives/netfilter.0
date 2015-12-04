From: Scott Bronson <bronson@rinspin.com>
Subject: Re: Why isn't DNAT happening for host-originated packets?
Date: Thu, 3 Dec 2015 16:42:51 -0800
Message-ID: <CAKmUPx5751FXOkBBhcxUKPBwq2cQrBSkoYX4JGJfy-UZE9+Vmw@mail.gmail.com>
References: <CAKmUPx5kE+v03OGAjF32rOGyVQfOLbSmyTEOOK9uApANeWbU1A@mail.gmail.com>
	<5660CCD1.60807@familie-kuntze.de>
	<CAKmUPx44yvsz21jRE9BoxK0D4R+gGjJdk9De5QQHUBzj6o9r6Q@mail.gmail.com>
	<5660D6D3.8040205@familie-kuntze.de>
	<CAKmUPx4jX4wyK10jR9Qr0DEPveRG5kOoLnuScpLgWE78DRXtyw@mail.gmail.com>
	<CAKmUPx6yaQdb1OE6CSf0TQ=eZYV=eX7Kmdzg-x6nVPtxtMpLEA@mail.gmail.com>
	<5660DFC7.9040206@familie-kuntze.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rinspin-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=EPTweWauUlV0TSyXH62VguoklRszJXVDAhhMlvRwUZw=;
        b=QMMaUm3PNaa2CBr3poMZlyO1UNXAFgHXCJKBhulwoau2osHTAarXI2Yz466ZCMWo+g
         GUVlvn1+4SNjU7jMmlXO1amoSLOkkXfrk8oSxeVh89EN6UfimV0C1qp4YFCPk4OFL72M
         BDyMAst5bzOxkiPMBOb460yiWLjdHw8/9v2lzqWLi0nMHd3N1Toiwmu3qBHZ4gyLT+tK
         KRxYx4+j/+l6zpYtE6NLEHS0iW2C4NH/V/+uYrwvV0lx/D/73028WwLvjohlwY89Nd4M
         aV8LRBUg8LU62Vh52+h80sRroyLk23/IPSkH6Rr3KjIu8OcYayZWljF6NarUKmQEgrZK
         7N3A==
In-Reply-To: <5660DFC7.9040206@familie-kuntze.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Noel Kuntze <noel@familie-kuntze.de>
Cc: netfilter@vger.kernel.org

> Traffic going over loopback seems to be handled in a special way
> with the TRACE target.

It's considered looped back even though there's never any 127.0.0.1 addresses?

Ah well, I was afraid it would be something like that.  Your suggested
workaround sounds fine.

This behavior feels weird though.  Should I update the diagram with a
dotted line conditionally skipping nat:PREROUTING?
