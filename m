From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: new tcp connections, without SYN
Date: 09 Apr 2003 13:33:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049887993.22720.3.camel@elendil.intranet.cartel-securite.net>
References: <200304091216.28528.carlosble@terra.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304091216.28528.carlosble@terra.es>
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
To: carlosble@terra.es
Cc: netfilter@lists.netfilter.org

Le mer 09/04/2003 =E0 13:16, Carlos Ble a =E9crit :
> Hi all. Two days ago, i added the policy that drops all new tcp connect=
ions
> that starts without SYN to prevent port scaners and other attacks:
> iptables -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG =
\
> --log-prefix "NEW tcp try no SYN:"
> iptables -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

You can add RELATED state to this :

	iptables -A bad_tcp_packets -p tcp ! --syn -m state \
		--state NEW,RELATED -j DROP

> Another question: I had disabled the icmp answers :
> echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all
> echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
> to try to be "invisible" for some wicked programs .
> will i have problems with some other programas that makes ping=20
> before establish a connection?=20

If a program waits for a ping reply before attempting connection, sure
you'll have problems. You can mitigeate this issue dealing echo requests
with your ruleset, and so having some addresses that still can ping.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

