From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: inconsistency in iptables and ifconfig traffic counters?
Date: 07 Jan 2005 00:48:37 +0100
Message-ID: <1105022980.21389.6.camel@nostromo.bgsecm.com>
References: <000901c4f346$6bc96ec0$3200a8c0@jeroen>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000901c4f346$6bc96ec0$3200a8c0@jeroen>
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
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El mi=C3=A9, 05 de 01 de 2005 a las 17:48, Jeroen van den Hoed escribi=C3=
=B3:
> Hello all,
>=20
> I'm working on a script to monitor all traffic that passes my colocated
> server. My first thought was to use ifconfig to monitor the RX and TX
> counters repeatedly and calculate my (monthly) traffic. Later I decided=
 to
> use iptables since it can monitor the traffic seperately, for multiple =
ip
> aliases, where ifconfig can not.
>=20
> I now have both scripts running at the same time, and I came accross
> inconsistencies in the reported traffic. Ifconfig reports more traffic =
than
> iptables does. For example; yesterday, iptables reported that my receiv=
ed
> traffic was 230mb, whereas ifconfig reported 259mb. (the transmitted tr=
affic
> has similar inconsistencies, ifconfig reports 10 to 15% more traffic th=
an
> iptables does)
> The problem, of course, is that I now don't know which counter to trust=
.
>=20
> Setup
> My external interface is eth0 which is checked with "ifconfig eth0" eve=
ry 5
> minutes. The RX and TX values are then written to a log file and at the=
 end
> of the day these values are added up and reported to me by mail. (The s=
cript
> handles the overflow of the 32bit counter values correctly.)
>=20
> For iptables I've a couple of rules to measure my incoming and outgoing
> traffic in the mangle table; as follows:
> iptables -t mangle -N incomingtraffic
> itpables -t mangle -A incomingtraffic -j RETURN
> iptables -t mangle -A PREROUTING -i eth0 -j incomingtraffic
> iptables -t mangle -N outgoingtraffic
> itpables -t mangle -A outgoingtraffic -j RETURN
> iptables -t mangle -A POSTROUTING -o eth0 -j outgoingtraffic
> At the end of the day these values are read out and the counters are re=
set
> to zero (iptables -L -n -v -x -t mangle -Z).
>=20
> Shouldn't the iptable rules above count ALL the traffic coming in and g=
oing
> out of eth0? And if these rules are correct, then why is this report lo=
wer
> than the report of ifconfig?
>=20
> Hope someone can enlighten me.
>=20
>=20
> Thanks in advance,
> Jeroen van den Hoed

You can try if you want our GPL software bastion-firewall with it's
bastion-firewall-stats addon, it does more or less what you want, and=20
can generate independent scripts that you can use without having to use
the bastion-firewall software. The software uses a daemon programmed
with libiptc to check the counters of the interfaces, rules, etc and
then some scripts to save the data in a Rrdtool database. It generates
then graphical stats in HTML and GIF with this data.

You can download it at: http://www.bgsec.com

Hope it help. Regards.

--=20
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


