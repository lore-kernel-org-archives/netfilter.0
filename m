From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: z-newnat16 again......
Date: 24 Oct 2002 10:53:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1035449595.8915.4.camel@elendil>
References: <000a01c27ac3$21285d20$3200a8c0@dualcon.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000a01c27ac3$21285d20$3200a8c0@dualcon.com.br>
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
To: Juliano Dapper <juliano@dualcon.com.br>
Cc: netfilter@lists.netfilter.org

Le mer 23/10/2002 =E0 20:36, Juliano Dapper a =E9crit :
> [root@teste /]# lsmod
> Module                  Size  Used by    Not tainted
> ipt_MASQUERADE          1184   0  (autoclean)
> iptable_filter          1728     0  (unused)
> iptable_nat            14420   0  [ipt_MASQUERADE]
> ip_conntrack         22188   1  [ipt_MASQUERADE iptable_nat]
> ip_tables              10528   5  [ipt_MASQUERADE iptable_filter iptabl=
e_nat]
>=20
> [root@teste /]# iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> iptables: Invalid argument
>=20
> Linux teste.dualcon.com.br 2.4.19 #1 Qua Out 23 11:54:48 BRST 2002 i586=
 unknown

As someone pointed out before, is your iptables build according to that
kernel ? I mean, do you use iptables 1.2.7a ?

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

