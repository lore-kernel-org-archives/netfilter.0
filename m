From: dhiraj.2.bhuyan@bt.com
Subject: RE: new tcp connections, without SYN
Date: Wed, 9 Apr 2003 14:00:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7497DCA1C240C042B28F6657ADFD8E09268776@i2km11-ukbr.domain1.systemhost.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org, carlosble@terra.es, blancher@cartel-securite.fr

As far as I understand, an "ACK" packet can also start a "NEW" =
connection.
If the connection remains idle for long, the Netfilter's connection =
tracking
engine times out that connection and removes it's entry from the state
table. Now when an "ACK" packet comes back after sometime, the =
connection
tracking engine marks this as a "NEW" connection. However am not sure =
how
the state changes to "ESTABLISHED".

dhiraj

-----Original Message-----
From: Cedric Blancher [mailto:blancher@cartel-securite.fr]
Sent: 09 April 2003 11:33
To: carlosble@terra.es
Cc: netfilter@lists.netfilter.org
Subject: Re: new tcp connections, without SYN


Le mer 09/04/2003 =E0 13:16, Carlos Ble a =E9crit :
> Hi all. Two days ago, i added the policy that drops all new tcp
connections
> that starts without SYN to prevent port scaners and other attacks:
> iptables -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j =
LOG \
> --log-prefix "NEW tcp try no SYN:"
> iptables -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j =
DROP

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
you'll have problems. You can mitigeate this issue dealing echo =
requests
with your ruleset, and so having some addresses that still can ping.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  =
FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE


