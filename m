From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: table traversal
Date: 28 Feb 2003 15:22:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046442130.14100.28.camel@elendil.intranet.cartel-securite.net>
References: <168d4128a3.128a3168d4@student.uml.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <168d4128a3.128a3168d4@student.uml.edu>
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
To: William Olbrys <william_olbrys@student.uml.edu>
Cc: netfilter@lists.netfilter.org

Le ven 28/02/2003 =E0 14:09, William Olbrys a =E9crit :
> I have a question about table traversal.
> Suppose I have two chains, in this order in a table.
>=20
> iptables -A FORWARD -s 10.1.2.3 -j ACCEPT
> iptables -A FORWARD -s 10.1.2.0/255.255.255.0 -j DROP
>=20
> Under this scenario a packet from 10.1.2.3 would fall under both rules.
> But would the packets be dropped or allowed to go through? Once it has
> found a match for a packet will it traverse the rest of the table or
> simply pass to the next one?

Rules evaluation is sequential, meaning that the first matching rule's
target applies.

In the exemple you give, packet will be allowed and is sent to next
table attached to the actual hook. In this cas, there's no more table to
evaluate, so packet is sent to NF_IP_POSTROUTING, and will be evaluate
in all table that have a chain attached to this hook.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

