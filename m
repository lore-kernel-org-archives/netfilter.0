From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: z-newnat16 - Implementation of the new nat API for kernel
	2.4.19-pre4 and above.
Date: 23 Oct 2002 00:32:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1035325948.10494.24.camel@elendil>
References: <000a01c27a00$26e18de0$3200a8c0@dualcon.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000a01c27a00$26e18de0$3200a8c0@dualcon.com.br>
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

Le mar 22/10/2002 =E0 21:20, Juliano Dapper a =E9crit :
> I Have problems after compile kernel 2.4.19 with patch-o-matic20020825,=
 option z-newnat16.
> After compile and restart my linux box, i try insert basic rule:
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE and result is:
> ARGUMENT INVALID
> My iptables is version 1.2.7a and kernel 2.4.19.

Works fine on my box with z-newnat16 too :

cbr@elendil:~$ sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
cbr@elendil:~$ sudo iptables -t nat -L POSTROUTING -v
Chain POSTROUTING (policy ACCEPT 240 packets, 17859 bytes)
 pkts bytes target     prot opt in     out     source               desti=
nation        =20
    0     0 MASQUERADE  all  --  any    eth0    anywhere             anyw=
here

Is iptable_nat.o module loaded (if built as module) ?
 =20
--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

