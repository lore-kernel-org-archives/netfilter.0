From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: IPS - iptables
Date: 26 Aug 2004 02:25:54 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093479855.32580.47.camel@nostromo.bgsecm.com>
References: <20040825164626.6334110FC31@firewall.gateway10.homeip.net>
	<1093452728.2391.12.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1093452728.2391.12.camel@anduril.intranet.cartel-securite.net>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El mié, 25 de 08 de 2004 a las 18:52, Cedric Blancher escribió:
> Le mer 25/08/2004 à 18:47, stu a écrit :
> > Does anyone know of any Intrusion Presion Systems for iptables / linux.
> > Deep packet inspection.
> > I need to interigate traffic for specific's, such as worms, viruses, etc.
> 
> See Snort Inline at http://snort-inline.sourceforge.net/.
> 
> All packets are sent to Snort for ruleset based analysis filtering.

And it works better if you only send to snort-inline the packets you
are going to accept, using the QUEUE target with iptables.

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


