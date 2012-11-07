From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Status of iptables target support in ipset
Date: Wed, 7 Nov 2012 22:42:15 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1211072238330.3863@blackhole.kfki.hu>
References: <CABpXQ7aX_LtYxP5UCo454-V9yu07kc8BpUBesCWy-4V_2ZqRvw@mail.gmail.com> <509A31E1.8030703@ngtech.co.il> <alpine.DEB.2.00.1211072149480.3544@blackhole.kfki.hu> <509ACD9D.4060102@ngtech.co.il>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <509ACD9D.4060102@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eliezer Croitoru <eliezer@ngtech.co.il>
Cc: =?ISO-8859-15?Q?=22Csord=E1s_Csaba_Ifj=2E=22?= <cscsordas@gmail.com>, netfilter@vger.kernel.org

On Wed, 7 Nov 2012, Eliezer Croitoru wrote:

> On 11/7/2012 10:51 PM, Jozsef Kadlecsik wrote:
> > No, the idea is to add targets per set entry. I.e.
> > 
> > ipset add foo 192.168.1.1 -t filter -A FORWARD -j LOG --log-prefix foo
> > ipset add foo 192.168.1.2 -t filter -A FORWARD -j LOG --log-prefix bar
> > 
> hoo now I understand.
> but ipset was meant to be a "set match", no?
> In iptables it's a module that match a rule if it matches a set...
> it's kind of confusing from iptables idea point of view for me.

The SET target then would be extended as a "match and return the result of 
the target(s) belonging to the element":

iptables -A FORWARD -j SET --match-set foo dst

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
