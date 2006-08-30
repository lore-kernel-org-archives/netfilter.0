From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: [MASQUERADING] iptables keeps sending from old IP after ppp0's
 IP has changed
Date: Wed, 30 Aug 2006 15:25:37 +0200
Message-ID: <44F591D1.5080008@plouf.fr.eu.org>
References: <200608301407.55481.Daniel@musketa.de>
	<Pine.LNX.4.61.0608301500440.4610@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0608301500440.4610@yvahk01.tjqt.qr>
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

Jan Engelhardt a =E9crit :
>>Every night the router's ppp0 goes down and after about a minute up aga=
in with=20
>>a new IP. But iptables keeps on sending the NATted UDP packets _from_ t=
he old=20
>>IP address. `iptables -F` and reloading the rules doesn't help. The onl=
y=20
>>workaround is to stop asterisk on the NAT client for about 2 minutes.=20
>=20
> That is how it is. The -t nat table is only consulted for NEW connectio=
ns.
>=20
>>Why isn't this table deleted when ppp0 goes down?
>=20
> netfilter does not know it has gone down, I think.

Unlike SNAT, isn't the MASQUERADE target supposed to delete obsolete=20
masqueraded conntrack entries when the related interface goes down - or=20
maybe when it goes up again with a different address ?

>>How can I force iptables to use ppp0's real IP address as sender IP in=20
>>outgoing packets?
>=20
> Flush the conntrack table when ppp0 has gone up (yes, up)

Why not when ppp0 has gone down ?

