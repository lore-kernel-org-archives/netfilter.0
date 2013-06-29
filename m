From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Dabase BAcked IPTables
Date: Sat, 29 Jun 2013 20:19:19 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1306292014350.26742@blackhole.kfki.hu>
References: <CAGWRaZYZnq3bneKNdisrRAfk=9PvKD=cXVWN_b0ySVRMaPw9Dw@mail.gmail.com> <CADuigkUCfERrvP3cM_nXPiP-27MP3FPRdf0rzPVNSqDEJ3YQMg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CADuigkUCfERrvP3cM_nXPiP-27MP3FPRdf0rzPVNSqDEJ3YQMg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ricardo Klein <klein.rfk@gmail.com>
Cc: Nick Khamis <symack@gmail.com>, netfilter <netfilter@vger.kernel.org>

On Fri, 28 Jun 2013, Ricardo Klein wrote:

> I think someone is already working in a ipset module for that.
> We need that here too...

I'd be fairly surprised at such a module...

> On Fri, Jun 28, 2013 at 12:01 PM, Nick Khamis <symack@gmail.com> wrote:
> >
> > Is it possible to have a MySQL backed IPTables? What we are trying to
> > accomplish is having our clients supply us with a mac address (or ip),
> > and we would let them through our core network. This would be done
> > automatically on our website i.e.:
> >
> > * User logs into the website, and provides mac address
> > * We insert the record in the database as an allow rule...
> > * Restart iptables?

That's pretty similar to a captive portal, which is quite simple to setup: 
you need a small webpage written say in PHP (IP and MAC can be gathered 
directly if the webserver is on the same LAN) and a bitmap:ip,mac type of 
set with timeout, and some static iptables rules. It's almost trivial if 
the things run on the gateway.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
