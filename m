From: Andreas Kretschmer <andreas_kretschmer@despammed.com>
Subject: Re: [despammed] port translation
Date: Sun, 11 Jan 2004 12:28:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040111112818.GA3148@kaufbach.delug.de>
References: <4001239D.7010904@yahoo.fr> <20040111104602.GA2551@kaufbach.delug.de> <40012D9D.3000201@yahoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <40012D9D.3000201@yahoo.fr>
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
To: netfilter@lists.netfilter.org

am  Sun, dem 11.01.2004, um 12:03:57 +0100 mailte Romain Moyne folgendes:
> Andreas Kretschmer a =E9crit :
> >>iptables -t nat -A PREROUTING -d MyIP -p tcp --dport 80 -j DNAT=20
> >>--to-destination 192.168.0.3:80
> >>  =20
> >>
> >
> >With this rule you make a 'DNAT', the WebServer can only see the
> >Source-IP from your router.
> >
> >You can install a WebServer or an Proxy for your Webserver on the
> >router, than you can see the visitor's IP and you can log this.
> >
> >A other way is to analyse the logged packets on the router.
> >
> >
> >Andreas
> >=20
> >
> There isn't another possibility ? I must install a proxy ? (a proxy with =

> a pentium 133Mhz will run bad ?)

You can use "... -j ULOG" bevor the PREROUTING-Rule to an
userspace-program for logging and analyze the packets.

If you have enougt memory, you can also use a proxy without caching.


Sorry, but I have no experience with ULOG-target, and I can't say more
about the average through a Proxy like Squid, but I think, with 64 MByte
RAM this is no problem.


Andreas
--=20
Diese Message wurde erstellt mit freundlicher Unterst=FCtzung eines freilau-
fenden Pinguins aus artgerechter Freilandhaltung.   Er ist garantiert frei
von Micro$oft'schen Viren. (#97922 http://counter.li.org)     GPG 7F4584DA
Was, Sie wissen nicht, wo Kaufbach ist? Hier: N 51.05082=B0, E 13.56889=B0 =
;-)

