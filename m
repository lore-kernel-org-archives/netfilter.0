From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: routing VPN users through transparent Squid using iptables
Date: Sun, 22 Aug 2010 18:11:47 +0200
Message-ID: <4C714C43.2050203@plouf.fr.eu.org>
References: <4C70FE76.1060204@andrewsmail.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C70FE76.1060204@andrewsmail.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Jack Andrews a =E9crit :
>=20
> Now, I was hoping another simple rule would redirect all http traffic=
=20
> through squid:
> [CODE]iptables -t nat -A PREROUTING -i ppp+ -p tcp --dport 80 -j=20
> REDIRECT --to-port 3128[/CODE]
>=20
> But this doesn't seem to work (I'm also hoping ppp+ is the correct=20
> formatting for a wildcard?).  Http traffic is never redirected and=20
> bypasses the proxy.

The rule looks good to me. It should do the job.
No other rules in the PREROUTING chain before ?
