From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ICMP and state/conntrack
Date: 28 Feb 2003 12:17:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046431034.14100.17.camel@elendil.intranet.cartel-securite.net>
References: <20030228103743.GA31779@ok.is>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030228103743.GA31779@ok.is>
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
To: netfilter@tommi.org
Cc: netfilter@lists.netfilter.org

Le ven 28/02/2003 =E0 11:37, netfilter@tommi.org a =E9crit :
> I'm wondering if state doesn't apply to ICMP packets.

It applies.

> iptables -A FORWARD -p icmp -m state -d 1.2.3.4 --state NEW -j ACCEPT
> iptables -A FORWARD -m state --state NEW,INVALID -j REJECT
> if I ping 1.2.3.4 the echo-reply is blocked from 1.2.3.4. Is this norma=
l, I
> thought that the echo-reply should be marked RELATED and therefore not
> blocked?

Nope.
In fact, you can separate ICMP messages in two categories :

	. ICMP errors
	. standelone ICMP

ICMP errors are related to an existing IP flow. As such, conntrack
engine flags them as RELATED.

Standelone ICMP (ping, netmask, timestamp and info, cf.
ip_conntrack_proto_icmp.c) are not related to IP flow, and are flagged
using NEW/ESTABLISHED states.
If you ping someone, echo-request is NEW, echo-reply is ESTABLISHED.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE


