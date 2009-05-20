From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: (DHCP) Ebtables ruleset isn't working, any ideas?
Date: Wed, 20 May 2009 22:22:47 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0905202211320.11627@blackhole.kfki.hu>
References: <594168.503.qm@web44807.mail.sp1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <594168.503.qm@web44807.mail.sp1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miguel Ghobangieno <mikeeusa@yahoo.com>
Cc: netfilter@vger.kernel.org

On Wed, 20 May 2009, Miguel Ghobangieno wrote:

> I did log, with tcpdump though

Makes no use when rules are not working.

> (ethertype file seems fine, shown below):

Just for a simple test, I cut&paste one of your rules:

ebtables -A FORWARD -p IPv4 --ip-sport 67:68 -j ACCEPT

Why don't you pay attention to the error message(s) reported by ebtables?

> > >       Why don't you log the packets??
> > 
> > Third times I write: why don't you log the packets?

Fourth times: why don't you log the packets (by >>ebtables<<): insert a 
just logging rule as the first one into the FORWARD chain and add logging
to every of your rules, with meaningful unique log prefixes everywhere.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
