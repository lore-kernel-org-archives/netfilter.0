From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Block MAC Address
Date: 16 Mar 2003 12:34:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1047814492.5013.7.camel@elendil.intranet.cartel-securite.net>
References: <20030316100606.98881.qmail@web40703.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030316100606.98881.qmail@web40703.mail.yahoo.com>
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
To: Mohammad Shakir <shakirz1@yahoo.com>
Cc: netfilter@lists.netfilter.org

Le dim 16/03/2003 =E0 11:06, Mohammad Shakir a =E9crit :
> #  Flush all Rules
> /sbin/iptables --flush
> /sbin/iptables --table nat --flush
> /sbin/iptables --delete-chain
> /sbin/iptables --table nat --delete-cha
> /sbin/iptables -N MACtest=20
>=20
> #  to block this MAC Address
> /sbin/iptables -A MACtest -m mac --mac-source 00:11:22:33:44:55 -j
> DROP
>=20
> #  for transprent proxy
> /sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
> REDIRECT --to-port 3128
>=20
> #  for MASQUREADE
> /sbin/iptables --table nat --append POSTROUTING -s 192.168.0.0/24
> --out-interface ppp0 -j MASQUERADE
>=20
> echo "1" > /proc/sys/net/ipv4/ip_forward
>
> I want to block a mac address, but this script is not blocking for it,
> any idea?

As far as I can see, you do not have any rule that sends packets to
MACtest chain. as a consequence, if your packets are not sent into it,
there's no chance for them to get dropped.

You should have a look to MACtest counters to see if packets do go
through :

	iptables -L MACtest -v

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE


