From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: NEW vs INVALID
Date: 30 Sep 2002 17:26:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1033399610.1633.38.camel@elendil>
References: <m2elbb4w7h.fsf@pcwi1068.uni-muenster.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <m2elbb4w7h.fsf@pcwi1068.uni-muenster.de>
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
To: Jens =?ISO-8859-1?Q?Lechtenb=F6rger?= <lechten@wi.uni-muenster.de>
Cc: netfilter@lists.netfilter.org

Le lun 30/09/2002 =E0 12:18, Jens Lechtenb=F6rger a =E9crit :
> using stateful packet matching I wonder how an INVALID tcp packet is
> defined.  In particular, I set up a rule to log inbound NEW ssh
> connections to port 22:
> iptables -A INPUT  -m state --state NEW -p TCP --dport 22 -j LOG
> --log-level 5 --log-prefix "IPTABLES: Legal NEW TCP: "
> What confuses me, is that this rule not only logs initial SYN
> packets but also (initial) packets with SYN and FIN set.=20
> I thought that such packets should be INVALID...
> Is this a bug or a feature?

Definitly a feature ;)

States a completly different concept than TCP connection, for it must
also apply to UDP, or other layer 4 protocols, which can be
connectionless.

A NEW packet is a packet for which Netfilter cannot find an existing
state in conntrack table. This packet, if TCP, can be SYN, as it should,
but also ACK, or any flag combination you want. This packet, if allowed,
create a state that will match following packets.

An INVALID packet is a packet for which Netfilter cannot guess its
state. Most of the time, it is ICMP errors that cannot be associated
(i.e. RELATED) to an existing connection. You can also have ressources
lack or bugs.

So, a packet why strange flags combination, such as SYN+FIN, is wrong
from TCP point of vue, but is a valid packet from state tracking point
of vue. This behaviour allows you to define exactly want you want to
match. As an example, you can consider match Xmas or Null scans :

	iptables -A INPUT -m state --state NEW -p tcp --tcp-flags ALL ALL -j LOG
	iptables -A INPUT -m state --state NEW -p tcp --tcp-flags ALL NONE -j LO=
G

To be strict, your iptables command should be :

	iptables -A INPUT  -m state --state NEW -p TCP --dport 22 --syn -j LOG -=
-log-level 5 --log-prefix "IPTABLES: Legal NEW TCP: "

My 2 cents of euro.

--=20
C=E9dric Blancher
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

