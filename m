From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: iptables ERROR
Date: Thu, 25 Jun 2009 20:08:32 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0906252007200.19928@blackhole.kfki.hu>
References: <1245934611.4518.58.camel@ripper.synapse.com> <1245938452.4518.63.camel@ripper.synapse.com> <alpine.LSU.2.00.0906251710030.20659@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.00.0906251710030.20659@fbirervta.pbzchgretzou.qr>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Ritesh Majumdar <r.majumdar@globallogic.com>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On Thu, 25 Jun 2009, Jan Engelhardt wrote:

> On Thursday 2009-06-25 16:00, Ritesh Majumdar wrote:
> 
> >As per my earlier mail.
> >
> >Here is error I get on my /var/log/messages.
> >
> >kernel: ip_tables: set match: invalid size 96 != 32
> 
> This could be related to http://markmail.org/message/dijxb6i6325t6hge
> So be sure to use ipset 3.0 (it's out now) with iptables 1.4.4.

Yes, exactly: with ipset 3.0 you need iptables 1.4.4.

I'm sorry for breaking backward compatibility.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
