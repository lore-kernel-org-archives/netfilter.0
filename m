From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: IP forwarding on port 80
Date: 13 Jun 2003 10:05:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1055491521.665.8.camel@elendil.intranet.cartel-securite.net>
References: <002201c3317c$d9fc6b50$0300a8c0@eclipse>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002201c3317c$d9fc6b50$0300a8c0@eclipse>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: Kent Wang <kwang@kwang.org>
Cc: 'George Vieira' <georgev@citadelcomputer.com.au>, netfilter@lists.netfilter.org

Le ven 13/06/2003 =C3=A0 09:24, Kent Wang a =C3=A9crit :
> A properly DNAT=E2=80=99d packet should pass through FORWARD and then O=
UTPUT,
> but I found nothing in the log.

A forwarded packets only crosses FORWARD chain. Framework has changed
from ipchains' one. Now, a given packet goes through one filter table
chain, and one only, depending it is destined to the hosts, destined to
be routed or locally generated.

If your DNAT implies packet to get routed, then you'll them in FORWARD
chain. Otherwise, you'll see them in INPUT chain.

> Any clues?

Well, read the doc.

--=20
C=C3=A9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=C3=A9curit=C3=A9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

