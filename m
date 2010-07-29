From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Synflood filtering and Conntrack
Date: Thu, 29 Jul 2010 17:50:09 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1007291723040.32027@blackhole.kfki.hu>
References: <4C4F5DCE.2060304@conversis.de> <4C4FBF16.50203@chello.at> <alpine.LSU.2.01.1007280756510.26636@obet.zrqbmnf.qr> <4C5161E2.8020407@chello.at> <alpine.LSU.2.01.1007291315440.2646@obet.zrqbmnf.qr> <4C516687.6060602@chello.at> <4C517559.2030702@plouf.fr.eu.org>
 <alpine.LSU.2.01.1007291448450.15281@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1007291448450.15281@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org, "Dennis J." <dennisml@conversis.de>, pablo@netfilter.org

On Thu, 29 Jul 2010, Jan Engelhardt wrote:

> On Thursday 2010-07-29 14:34, Pascal Hambourg wrote:
> >>> Trying 127.0.0.1...
> >>>      [NEW] tcp      6 120 SYN_SENT src=127.0.0.1 dst=127.0.0.1
> >>> sport=59734 dport=23 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=23
> >>> dport=59734
> >>>
> >>> ...seconds later...
> >>> # conntrack -L | grep =23
> >>> conntrack v0.9.14 (conntrack-tools): 12 flow entries have been shown.
> >>> tcp      6 97 SYN_SENT src=127.0.0.1 dst=127.0.0.1 sport=59734
> >>> dport=23 packets=1 bytes=60 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1
> >>> sport=23 dport=59734 packets=0 bytes=0 mark=0 secmark=0 use=2
> >>>
> >>> 2 minutes it is.
> >
> >That's because it is a locally generated connection, so the conntrack
> >confirm takes place after POSTROUTING. Even though the packet is dropped
> >in INPUT after it is looped back, the conntrack entry is already
> >confirmed. Now try again with the DROP rule in OUTPUT, or from a remote
> >host.
> 
> But the ct entry must undoubtly exist to be able to match -m conntrack 
> --ctstate NEW. 

I don't see why it looks soo complicated: of course, a ct entry is created 
by conntrack whenever a new connection is detected. And of course the 
entry is destroyed if the packet, which triggered to create the new entry,
is dropped by a rule. Why should the conntrack entry be kept, if the 
connection is not allowed by the rules?

The new ct entries are kept in the unconfirmed list and only added to the 
conntrack hash iff the entry will be confirmed, that is the entry-creating 
packet won't be dropped by a rule.

> Perhaps it's just that conntrack(8) won't show it?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
