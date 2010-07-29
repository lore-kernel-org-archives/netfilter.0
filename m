From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Synflood filtering and Conntrack
Date: Thu, 29 Jul 2010 19:52:50 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1007291929100.32470@blackhole.kfki.hu>
References: <4C4F5DCE.2060304@conversis.de> <4C4FBF16.50203@chello.at> <alpine.LSU.2.01.1007280756510.26636@obet.zrqbmnf.qr> <4C5161E2.8020407@chello.at> <alpine.LSU.2.01.1007291315440.2646@obet.zrqbmnf.qr> <4C516687.6060602@chello.at> <4C517559.2030702@plouf.fr.eu.org>
 <alpine.LSU.2.01.1007291448450.15281@obet.zrqbmnf.qr> <alpine.DEB.2.00.1007291723040.32027@blackhole.kfki.hu> <4C51B6E7.4010502@freemail.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C51B6E7.4010502@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?ISO-8859-15?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: Jan Engelhardt <jengelh@medozas.de>, Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org, "Dennis J." <dennisml@conversis.de>, pablo@netfilter.org

On Thu, 29 Jul 2010, G?sp?r Lajos wrote:

> 2010-07-29 17:50 keltez?ssel, Jozsef Kadlecsik ?rta:
> > I don't see why it looks soo complicated: of course, a ct entry is created
> > by conntrack whenever a new connection is detected. And of course the
> > entry is destroyed if the packet, which triggered to create the new entry,
> > is dropped by a rule. Why should the conntrack entry be kept, if the
> > connection is not allowed by the rules?
> > 
> >    
> Correct me if I am wrong.
> 
> You can only destroy the entry (CONNECTION) if the PACKET which "created" the
> entry is DROPped.
>
> But you can NOT destroy the entry (just wait for timeout) if:
> - the DROPped packet is not the first (SYN),
> - there is no LOCAL reply,
> - packets are FORWARDed.

Yes, if the conntrack entry is confirmed, i.e the packet which created the 
entry isn't dropped by a rule, then you cannot easily get the entry 
destroyed: either you wait for the timeout, or you can destroy the entry 
manually by the conntrack tool, or by forging an acceptable RST segment 
(former is easier).
 
> I think that 99% of the conntrack entries are kept this way until timeout.
> 
> It it is true then there is no "standard" real help against a SYN flood.
> (CHAOSTABLES?)

You can use the standard limit matchings (limit, connlimit, hashlimit) to 
protect conntrack against SYN flooding. Of course, the already created 
entries remain there and will time out.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
