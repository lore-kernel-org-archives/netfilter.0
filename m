From: Andreas Kretschmer <andreas_kretschmer@despammed.com>
Subject: Re: [despammed] port translation
Date: Sun, 11 Jan 2004 11:46:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040111104602.GA2551@kaufbach.delug.de>
References: <4001239D.7010904@yahoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4001239D.7010904@yahoo.fr>
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

am  Sun, dem 11.01.2004, um 11:21:17 +0100 mailte Romain Moyne folgendes:
> Hello,
>=20
> I'm French and my english is bad ;)

I'm German and my english is bad, too ;-)

> I have a http server (debian 3.0) behind a router (debian 3.0). I have a =

> problem when I want to log the visitor's IP of my website with PHP or=20
> Perl or all language. I have always the IP of my router ! Somebody tell=20
> me that I must do port translation but I have searched and I haven't=20
> fand anything.
> Can you help me ?
> This is the rules of my router :
>=20
> iptables -t nat -A PREROUTING -d MyIP -p tcp --dport 80 -j DNAT=20
> --to-destination 192.168.0.3:80

With this rule you make a 'DNAT', the WebServer can only see the
Source-IP from your router.

You can install a WebServer or an Proxy for your Webserver on the
router, than you can see the visitor's IP and you can log this.

A other way is to analyse the logged packets on the router.


Andreas
--=20
Diese Message wurde erstellt mit freundlicher Unterst=FCtzung eines freilau-
fenden Pinguins aus artgerechter Freilandhaltung.   Er ist garantiert frei
von Micro$oft'schen Viren. (#97922 http://counter.li.org)     GPG 7F4584DA
Was, Sie wissen nicht, wo Kaufbach ist? Hier: N 51.05082=B0, E 13.56889=B0 =
;-)

