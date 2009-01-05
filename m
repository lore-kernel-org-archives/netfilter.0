From: =?iso-8859-15?Q?Roland_H=E4der?= <r.haeder@web.de>
Subject: Re: Bastille/netfilter with Linux 2.6.28 blocks connections
Date: Mon, 05 Jan 2009 14:41:40 +0100
Message-ID: <664670418@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Cc: netfilter@vger.kernel.org

> Hi!
Hi,

> Why you said "now". It has never worked? When it's start to had probl=
ems?
It has worked on earlier days and with an older kernel, I cannot recall=
 the exact version number, so maybe it was 2.6.18 which I have also use=
d a long time. But once I have upgraded it to newer kernels, and double=
-checked the config, these routing problems starts.

Okay, anyway. As I have promised before I have uploaded some more detai=
ls:

=46irst here is the requested logfile (syslog) with the relevant ports:
http://www.mxchange.org/downloads/firebox/tor-drops_syslog.log

Okay, two thinks I was mentioning before where wrong, sorry about that.=
 :( First INPUT DROP 8 is dropping the packets and second they came fro=
m outside as you can see in the logs.

Here are some more files for inspection:

My actually used kernel config:                                        =
                                                                       =
              =20
http://www.mxchange.org/downloads/firebox/config-2.6.28-vanilla

Output of "route -n": (it should be fine, I suppose)
http://www.mxchange.org/downloads/firebox/route.txt

That x.x.x.x was me. It is the PPP partner IP of my ISP.

This directory contains my extra-scripts for the corresponding Bastille=
 "hooks":
http://www.mxchange.org/downloads/firebox/firewall.d/

That directory should be found in /etc/Bastille/.
>
> You have to say us what you want to leave pass from that firewall... =
tor
> from internet, from lan? tor on localhost wants to connect to your-se=
lf
> by 127 or 192 ?
192.168.1.1 is my router, 192.168.1.1x are my clients, both have a "def=
ault gateway" set to 192.168.1.1 and /etc/resolve.conf has a nameserver=
 entry pointing only to 192.168.1.1

I want to pass through from my LAN (eth1) to Internet (eth0/ppp0) regul=
ar things like Mail, Newsgroups and such things. So I need to masq my p=
rivate network 192.168.1.0 on eth1 to the Internet. And this is no long=
er working.
 =20
I want to route traffic from Internet on TCP/UDP port 31017 which is be=
ing used by Descent2-Rebirth to my client 192.168.1.17. I used PREROUTE=
 and FORWARD for this.
                                                                       =
                                                                       =
              =20
Like I wrote above it *has* worked, until I have upgraded the farly out=
dated kernel which should be done on regular basis. I guess you know wh=
y. :)

> Too short description and no logs.
Hope that helps a bit more? :)

Roland

__________________________________________________________________
Deutschlands gr=F6=DFte Online-Videothek schenkt Ihnen 12.000 Videos!*
http://entertainment.web.de/de/entertainment/maxdome/index.html

