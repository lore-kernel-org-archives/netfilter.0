From: Richard Horton <arimus.uk@gmail.com>
Subject: Re: NAT appears to be unaware of ports in use on router
Date: Tue, 20 Jul 2010 19:56:50 +0100
Message-ID: <AANLkTinlUW3jecWLPBdgK4GPu2PUlLvZ9FxzdNyjkJlB@mail.gmail.com>
References: <AANLkTin_lR3j4I9IYcrAlcAXAV_PDt6aDsrTXX9IHtAS@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=BZqYXSUbXtmq3cBfjMd8RjtxVEZmmdqXbUNVvmti/Pk=;
        b=kpW3khGSADc7r8NGS+5tjOatz2ek7Gy/jqkv1zARpLxlXFqhx7m/hysa6q/lOMxv8c
         OW7w8AOKn6valsgjyhWf+f9+gRo3kd7p2tbxZa5I/M/vU4zkoj2P3XSdXbsdaxzqdgQ5
         O/xFrKMIvE2sV2xDH9ydH9f5xw3oOnyo/WLFA=
In-Reply-To: <AANLkTin_lR3j4I9IYcrAlcAXAV_PDt6aDsrTXX9IHtAS@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Ditner <sditner@gmail.com>
Cc: netfilter@vger.kernel.org

On 20 July 2010 18:00, Simon Ditner <sditner@gmail.com> wrote:
>
> I have asterisk running SIP on a router using UDP port 5060 that's
> also handling NAT for a network. I'm often doing testing behind NAT
> with other SIP devices using UDP port 5060 talking to the internet,
> and have run into a problem where NAT is able to claim 5060. I have
> witnessed this occurring both when the asterisk service is stopped
> (the obvious case), but I have also run into it when asterisk was up
> and running fine.

You can use the --to-ports option to restrict the port range masq uses...

>
>

> *nat
> -A POSTROUTING -o eth0 -j MASQUERADE

-A POSTROUTING -o eth0 -j MASQUERADE --to-ports 6000-50000

The rule above would restrict MASQUERADE to using ports from 6000 to 50000.
(From memory doesn't postrouting and masq need a portocol when used
with ports... inwhich case...

-A POSTROUTING -p udp -o eth0 -j MASQUERADE --to-ports 6000-50000
-A POSTROUTING -p tcp -o eth0 -j MASQUERADE --to-ports 6000-50000
-A POSTROUTING ! -p tcp ! -p udp -o eth0 -j MASQUERADE

Should provide port mapping for the udp and tcp and normal masq for
non-tcp/udp - might need to split the not tcp / udp line into two -
not sure if you can combine two negative matches and currently don't
have a linux box in reach :( )

R.

Note:
Reading some more info on the masq target:-
"It is still possible to use the MASQUERADE target instead of SNAT
even though you do have a static IP, however, it is not favorable
since it will add extra overhead, and there may be inconsistencies in
the future which will thwart your existing scripts and render them
"unusable". "






--
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.pbase.com/arimus - My online photogallery
http://uk.linkedin.com/in/richardhorton1972 - My linkedin profile
http://www.solstans.co.uk/richard - Online CV
