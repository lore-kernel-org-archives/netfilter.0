From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Trouble shooting for port forwarding ,	Want to make sure port
 is forwarded
Date: Tue, 01 Aug 2006 12:23:36 +0200
Message-ID: <44CF2BA8.50106@plouf.fr.eu.org>
References: <20060801094234.35522.qmail@web55506.mail.re4.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060801094234.35522.qmail@web55506.mail.re4.yahoo.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>

Hello,

John Joseph a =E9crit :
> Hi=20
>     For the purpose of trouble shooting  , one  setup
> which I had done  for redirecting port 110 to port
> 8110 ( same machine)  . For this purpose   I gave the
> command as=20
>=20
> iptables -t nat -A PREROUTING  -p tcp --dport 110 -j
> REDIRECT --to-port  8110
>=20
>    Now after this . When I do a tcpdump for port 8110
> , I do not get any results , when I  access port 110=20

This is normal. Tcpdump sees the incoming original packets when they=20
arrive at the interface, before they are DNATed or REDIRECTed by=20
iptables in the PREROUTING chain.

