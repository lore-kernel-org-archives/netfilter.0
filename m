From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: SNAT seems to "miss" some packets
Date: Mon, 29 Jan 2007 15:07:54 +0100
Message-ID: <45BDFFBA.9090706@plouf.fr.eu.org>
References: <1003211157.20070129141238@kurgan.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1003211157.20070129141238@kurgan.org>
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
To: netfilter@lists.netfilter.org

Hello,

Fabio Muzzi a =E9crit :
>=20
> I  am  running  a  firewall  with Debian Linux (kernel 2.6.15) and am I=
 am
> expriencing a strange behavior in a simple SNAT rule.
[...]
> Running  a  simple  "ethereal -i eth2 'not host 217.221.234.74'" I can =
see
> that  sometimes some packets go through WAN interface without being SNA=
Ted
> by netfilter.

Maybe these packets are considered in the INVALID state by the Netfilter=20
connection tracking. Packets in the INVALID state bypass the stateful=20
NAT processing. You may add a rule to log INVALID packets and compare=20
them with the tcpdump output :

iptables -I FORWARD -o eth2 -m state --state INVALID \
   -j LOG --log-prefix "FWD_INV "

Anyway there is no chance that another NAT rule may cause this, as=20
packets belonging or related to an established connection don't go=20
through the nat chains.

Note :
This may be related to the thread "Dropped fin acks (iptables + lvs)"=20
above, as in both cases most affected packets seem to be FIN/ACK and=20
RST/ACK.

