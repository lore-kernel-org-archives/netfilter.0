From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: conntrack-tools 0.9.14 can not block the connection
Date: Sat, 8 May 2010 22:33:45 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1005082227270.30449@blackhole.kfki.hu>
References: <201005061651.40203.rfeng@wurldtech.com> <alpine.LSU.2.01.1005070954230.32277@obet.zrqbmnf.qr> <201005070917.27301.rfeng@wurldtech.com> <alpine.LSU.2.01.1005071823100.23210@obet.zrqbmnf.qr> <4BE46649.1040703@netfilter.org> <4BE4669B.4030904@netfilter.org>
 <alpine.LSU.2.01.1005072144530.31492@obet.zrqbmnf.qr> <4BE4747D.9010705@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BE4747D.9010705@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: Jan Engelhardt <jengelh@medozas.de>, Pablo Neira Ayuso <pablo@netfilter.org>, Richard Feng <rfeng@wurldtech.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Fri, 7 May 2010, Pascal Hambourg wrote:

> > I think what was really meant was tcp_loose, not tcp_be_liberal.
> 
> In my understanding, tcp_loose only allows conntrack to pick up
> connections from the middle, but packets are still INVALID until the
> required number of packets is seen and accepted. Am I wrong ?

No, the packets are set to the usual states, there's no packet counting.

With tcp_loose enabled (default) conntrack accepts non-SYN packets as 
"NEW" ones, i.e. attempts to pick up connections from the middle.

With tcp_be_liberal enabled (default is disabled) out of window packets 
are not marked as INVALID.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
