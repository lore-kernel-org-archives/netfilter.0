From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: IPSec rules
Date: 28 Mar 2003 17:45:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048869911.4875.5.camel@elendil.intranet.cartel-securite.net>
References: <NDBBKABJBJCIJNAELLKEMEALIKAA.jimm@simutronics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NDBBKABJBJCIJNAELLKEMEALIKAA.jimm@simutronics.com>
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
To: jimm@simutronics.com
Cc: netfilter@lists.netfilter.org

Le ven 28/03/2003 =E0 16:52, James Miller a =E9crit :
> I have reviewed a few posts about how to setup rules to allow IPSec.  I=
 sure
> would appreciate a peer review of my rules for IPSec traffic before put=
ting
> them into general use.
[...]
> INPUT:
> $IPTABLES -A INPUT -i eth1 -p 50 -j ACCEPT
> $IPTABLES -A INPUT -i eth1 -p 51 -j ACCEPT
> $IPTABLES -A INPUT -i eth1 -p UDP --dport 500 -j ACCEPT

You can harden this one saying source port has also to be 500.

[...]
> OUTPUT:
> $IPTABLES -A OUTPUT -p 50 -j ACCEPT
> $IPTABLES -A OUTPUT -p 51 -j ACCEPT
> $IPTABLES -A INPUT -p udp -m udp --dport 500 -j ACCEPT

You can also add output interface using "-o eth1" and specify source
port for last rule.

Matching state is not useful if both sides are likely to initiate IPSEC
tunnel.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

