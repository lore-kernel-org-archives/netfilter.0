From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: Hogwash Vs snort-inline Vs Iptables
Date: 31 Aug 2004 21:52:23 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093974928.9232.47.camel@nostromo.bgsecm.com>
References: <a05ad87504083106581832c864@mail.gmail.com>
	<1093961312.2281.105.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1093961312.2281.105.camel@anduril.intranet.cartel-securite.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>, Murugavel Thiruvengadam <tmurugavel@gmail.com>

El mar, 31 de 08 de 2004 a las 16:08, Cedric Blancher escribió:
> Le mar 31/08/2004 à 15:58, Murugavel Thiruvengadam a écrit :
> > Iptables will work in kernel level . What about the others. 
> 
> Snort Inline relies on Netfilter as it gets packets using iptables QUEUE
> target. This means you have total control of traffic being filtered by
> Netfilter and traffic being filtered by Snort Inline. That's why I do
> prefer Snort Inline to Hogwash.
> 
> Speaking of string match in iptables, forget it. One basic  able thing
> an IPS/IPS has to implement is fragmentation resistance. String match
> will not work against TCP fragmentation, as it is a per packet match, so
> it will not detect an attack payload split on two TCP packets.

And besides this snort-inline is actively being developed and I have
read in the snort.org web site that it will be integrated in the
plain snort, in the other side you have an almost dead project like
hogwash that it's still alpha code and not being so actively developed.
Hogwash it's also too heavy at using resources like memory.

First option should be snort-inline. It's my opinion.

-- 
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPAÑA

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


