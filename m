From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: tracking usage by mac address
Date: 31 Aug 2004 21:52:29 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093975858.9232.61.camel@nostromo.bgsecm.com>
References: <41329413.3080407@shaw.ca>
	<1093887545.23659.47.camel@nostromo.bgsecm.com>
	<3063e504083013374bd2a909@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3063e504083013374bd2a909@mail.gmail.com>
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

El lun, 30 de 08 de 2004 a las 22:37, George Alexandru Dragoi escribió:
> Well, i don't know if you want to log EVERYTHING.
> Remember ip_conntrackworkson streams, so you can log only NEW packets.
> I have like 90 rules with -m mac like those i said before + several
> port forwarding, on a P2 450Mhz, 100mbit internet connections, used a
> lot, almoust all the time at 11MB/s at upload (exactly where those
> rules aremostly hitted), and top says the sys load is arround 40% at
> most when i have full bandwith in use, but i think it is not because
> of the netfilter, but the PCI usage. Traffic at 50% usually needs much
> less CPU, like 5-10%. I also have many other rules for SYN scan
> limiting, bandwith counting, and so on.
> 

Obviously our system it's useful for a not huge set of
rules, we use it for a per service basis, not per IP or MAC.
We have been using it with a big number of rules (services)
and it works like a charm, without slowing the system, but
if you have a lot of MACs our system can be surely a bad
idea.

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


