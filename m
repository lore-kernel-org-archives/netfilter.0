From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: iptables script file
Date: 30 Oct 2004 23:00:26 +0200
Message-ID: <1099081340.12253.24.camel@nostromo.bgsecm.com>
References: <B069AFB1CBDE6F6A01A304D9@[10.169.6.246]>
	<200410281351.i9SDpdoL058208@jkcpub.iserver.net>
	<20041028150535.GA4228@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041028150535.GA4228@bender.817west.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El jue, 28 de 10 de 2004 a las 17:05, Jason Opperisano escribi=C3=B3:
> so, the upshot is this--if your ruleset is sufficiently large to make
> the inefficiency of scripted "iptables" commands a problem--you'll need
> to use "iptables-restore" to load your rules.  once you get the hang of
> it, it really isn't that hard to just edit the "iptables-restore" file
> format (even though this isn't "recommended").

Don't know why everybody talks about the problem of editing the
iptables-save file. You don't need to do it. You just save the script
that generates the iptables-save rules and you edit it when you need
it, then you generate the rules and do a new iptables-save. No problem
here.

--=20
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


