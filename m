From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: iptables support in 2.2 kernel
Date: Wed, 26 Oct 2005 19:30:23 +0200
Message-ID: <1130347823.5771.12.camel@anduril.intranet.cartel-securite.net>
References: <BAY103-F404DA4544B76C919CE72A8B2690@phx.gbl>
	<435F511A.8030204@india.tejasnetworks.com>
	<Pine.LNX.4.61.0510261911160.27341@filer.marasystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510261911160.27341@filer.marasystems.com>
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
To: Aseem Rastogi <aseem@india.tejasnetworks.com>
Cc: Netfilter Users <netfilter@lists.netfilter.org>

Le mercredi 26 octobre 2005 =E0 19:13 +0200, Henrik Nordstrom a =E9crit :
> NAT in Linux-2.2 ipchains is somewhat limited.. but you have Masquerading=
,=20
> Redirection for transparent proxying and Port-forwarding.

Masquerading:     ipchains [...] -j MASQ
Redirection:      ipchains [...] -j REDIRECT
Port-forwarding:  ipmasqadm portfw [...]

That's all I can remember about this. Man pages for ipchains and
ipmasqadm can be googled too.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

