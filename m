From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ipset] Match both on source AND destination
Date: Thu, 11 Apr 2013 20:07:05 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1304112006200.32023@blackhole.kfki.hu>
References: <1365691926.25705.48.camel@BEWS005.euractiv.com>   <alpine.DEB.2.00.1304111701570.32023@blackhole.kfki.hu>  <1365693831.25705.50.camel@BEWS005.euractiv.com>  <alpine.DEB.2.00.1304111726560.32023@blackhole.kfki.hu>
 <1365699488.5674.3.camel@draco>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1365699488.5674.3.camel@draco>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jimmy Thrasibule <thrasibule.jimmy@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, 11 Apr 2013, Jimmy Thrasibule wrote:

> > On Thu, 11 Apr 2013, Jimmy Thrasibule wrote:
> > 
> > > > Apply two matches:
> > > > 
> > > > -A FORWARD -m set --match-set mynets src -m set --match-set mynets dst ...
> > > 
> > > Ah,
> > > 
> > > That's the first thing I tried but as I didn't load the module twice it
> > > wouldn't work.
> > 
> > Sorry, I don't understand. Why would you need to load the module twice?
> > There's no need to load the module at all.
> 
> I just mean that I tried something like:
> 
> -m set --match-set mynets src --match-set mynets dst
> 
> And I got an error saying that --match-set can only be used once. And by
> module I was more talking about the match option -m until now I was
> thinking that calling it only once would be enough for the whole rule.

Then your *iptables* version is too old.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
