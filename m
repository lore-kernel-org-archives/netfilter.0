From: "Gary Smith" <gary@primeexalia.com>
Subject: RE: iptables script file
Date: Sat, 30 Oct 2004 18:52:34 -0700
Message-ID: <21245695958BF041875A6C39D08F9EBA0232CC@vjo-mails-03.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="iso-8859-1"
To: Jose Maria Lopez <jkerouac@bgsec.com>, netfilter@lists.netfilter.org

I love and have iptables-save.  We have a bunch of rules governing our =
LAN to DMZ, DMZ to INET and LAN to INET.  For simplicity we also have =
comments referring to what each rule is for.  We have certain one of =
exceptions and a mess of complicated ptp holes.

Iptables-save and restores failure is that it doesn't retain the =
additional comment information that we insert.  Though it's trivial it =
would be nice.

Gary Wayne Smith

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org =
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jose Maria =
Lopez
Sent: Saturday, October 30, 2004 2:00 PM
To: netfilter@lists.netfilter.org
Subject: Re: iptables script file

El jue, 28 de 10 de 2004 a las 17:05, Jason Opperisano escribi=F3:
> so, the upshot is this--if your ruleset is sufficiently large to make
> the inefficiency of scripted "iptables" commands a problem--you'll =
need
> to use "iptables-restore" to load your rules.  once you get the hang =
of
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
ESPA=D1A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"




