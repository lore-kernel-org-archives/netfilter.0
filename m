From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Status of iptables target support in ipset
Date: Mon, 12 Nov 2012 16:18:02 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1211121606220.18137@blackhole.kfki.hu>
References: <CABpXQ7aX_LtYxP5UCo454-V9yu07kc8BpUBesCWy-4V_2ZqRvw@mail.gmail.com> <50A0EB42.20806@wildgooses.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50A0EB42.20806@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ed W <lists@wildgooses.com>
Cc: =?ISO-8859-15?Q?=22Csord=E1s_Csaba_Ifj=2E=22?= <cscsordas@gmail.com>, netfilter@vger.kernel.org

On Mon, 12 Nov 2012, Ed W wrote:

> On 26/10/2012 14:58, Csord?s Csaba Ifj. wrote:
> > Dear Reader,
> > 
> > I would like to ask when will it possible writing such rules as
> > mentioned in $SUBJECT.
> > 
> > For example:
> > 
> > ipset new foo hash:ip
> > ipset add foo 192.168.1.1 -t filter -A FORWARD -j LOG ... -t nat -A
> > POSTROUTING -j SNAT ... -t mangle -A PREROUTING -j MARK ...
> >  
> At this point haven't you re-implemented almost the whole of netfilter 
> inside ipset? (Or is that the point?).

No, not at all. The user part of ipset should be linked with libxtables 
and use the parser, structures from there. And the kernel part would call 
the corresponding netfilter target modules directly.

ipset is great for mass-matching. The functionality would just add the 
support of individual actions for the elements.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
