From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: iptables -t nat -A OUTPUT - j DNAT
Date: 23 May 2003 17:05:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053702346.654.87.camel@elendil.intranet.cartel-securite.net>
References: <MCBBLLHIIODBDKIGDHGAMEJHCCAA.lzur@record.com.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <MCBBLLHIIODBDKIGDHGAMEJHCCAA.lzur@record.com.pl>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: Leszek =?iso-8859-2?Q?=AFur?= <lzur@record.com.pl>
Cc: netfilter@lists.netfilter.org

Le ven 23/05/2003 =C3=A0 16:41, Leszek =C5=BBur a =C3=A9crit :
> Slackware 9.0
> kernel 2.4.20
> iptables 1.2.7a
> iptables -t nat -A OUTPUT -d 1.1.1.1 -j DNAT --to-destination 2.2.2.2
> iptables: Invalid argument

Strange, works fine for me :

cbr@elendil:~$ sudo iptables --version
iptables v1.2.7a
cbr@elendil:~$ sudo iptables -t nat -A OUTPUT -d 1.1.1.1 -j DNAT
	--to-destination 2.2.2.2
cbr@elendil:~$ sudo iptables -t nat -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
=20
Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
=20
Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
DNAT       all  --  anywhere             1.1.1.1            to:2.2.2.2

Are both kernel and iptables Slackware packages ? Are they built from
sources ? If so, does patch-o-matic have been applied (pending and
submitted) ?

I got problems like this when I was used to build my own kernel and use
an iptables package from distro.

--=20
C=C3=A9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=C3=A9curit=C3=A9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

