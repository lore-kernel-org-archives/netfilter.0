From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: iptables + MRTG
Date: 28 Aug 2004 18:59:11 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093705929.29254.30.camel@nostromo.bgsecm.com>
References: <a0f69e5040828042815b5e61e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e5040828042815b5e61e@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

El sáb, 28 de 08 de 2004 a las 13:28, Askar escribió:
> hi,
> 
> Anyone here using MRTG with iptables? for example to check iptables -L
> -nvx things graphical using mrtg... or any other statistics
> any possibility ?
> 
> looking forward.
> regards
> AskaR

The module bastion-firewall-stats from our GPL firewall named
bastion-firewall does something similar to what you want, it
has a daemon that collects the data from the counters in the
chains you mark in the config files and then puts the data in
a rrdtool database and a bash script generates graphical stats
each hour.

You probably can't do what you want with MRTG but you can do it
with something like Cacti, that it's more flexible. You can create
a script that collects the data (I advice you it's really slow if
you want to collect data from a lot of chains, that's why we use
a C program that uses libiptc to do this) and then use it in
Cacti to generate the graphics like MRTG does.

Or you can simply create the script and use another script to enter
the data in the rrdtool database and then graph the data with another
one using also rrdtool.

If you want code to extract the counters from the chains using C
code you should have in mind that the Querying libiptc HOWTO has
an error in it, it allocates memory but it does not free it, so
the memory used grows and grows and grows. We sent an email to the
author of the HOWTO but we have received no response yet. You can
look at the code in the bastion-firewall-stats daemon to see where
the memory have to be freed. You can download it at:
http://www.bgsec.com

Hope it helps.

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


