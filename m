From: Eric Constantineau <mekanik@nerim.net>
Subject: Re: newbie problem
Date: Thu, 20 Feb 2003 12:39:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E54BE60.FB42C787@nerim.net>
References: <1045467799.20801.22.camel@billybob.back2front.homelinux.org> <1045470311.2231.62.camel@kermit.spenneberg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Ralf Spenneberg <spenneb@spenneberg.de>
Cc: netfilter@lists.netfilter.org

Is the web server on the same machine that is firewalling or is it behind=
 ?
If it is behind, set it on FORWARD instead of INPUT...

The INPUT chain is for traffic entering the firewall machine itself, OUTP=
UT
chain is for the packets coming from the firewall machine and FORWARD is =
for
all other packets passing throught firewall...

Eric


Ralf Spenneberg wrote:

> Am Mon, 2003-02-17 um 08.43 schrieb Chris Barnes:
> > hi people i'm new to the list.
> >
> > anyway, I have a very simple firewall on a web server. I want to deny
> > access to everything except the web server (port 80)
> >
> > i have set the poilcy on all chains to drop and i have added a rule t=
o
> > the input chain which says
> >
> > iptables -A INPUT -p tcp --sport 80 -j ACCEPT
> >
> It is --dport 80 if you want to allow packet with the destination port
> 80 to reach your webserver.
>
> By the way, i hope you have not set PREROUTING and POSTROUTING to DROP,
> do you?
>
> Cheers,
>
> Ralf
>
> --
> Ralf Spenneberg
> UNIX/Linux Trainer and Consultant, RHCE, RHCX
> Waldring 34                             48565 Steinfurt         Germany
> Fon: +49(0)2552 638 755                 Fax: +49(0)2552 638 757
> Mobil: +49(0)177 567 27 40
>
> Markt+Technik Buch:                     Intrusion Detection f=FCr Linux
> Server
> IPsec/PPTP Kernels for Red Hat Linux:
> http://www.spenneberg.com/.net/.org/.de
> Honeynet Project Mirror:                http://honeynet.spenneberg.org
> Snort Mirror:                           http://snort.spenneberg.org



