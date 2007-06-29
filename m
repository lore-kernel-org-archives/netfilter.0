From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: Routing decision after FORWARD
Date: Fri, 29 Jun 2007 11:41:59 -0600
Message-ID: <46854467.7060309@nicaraguaopensource.com>
References: <4682630E.30406@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4682630E.30406@gmail.com>
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
To: Ivan Dubrov <wfragg@gmail.com>
Cc: netfilter@lists.netfilter.org

Ivan:

There are three escenaries:

(1) Packets destined to our machine
(2) Packets originated inside our machine
(3) Packets forwarded

The table only have a reference to escenary (1) and the diagram after=20
the tables hits all escenaries.

Not all packets traverse all chains, that depends on the escenary.

Hope this helps,

Jorge D=E1vila.

Ivan Dubrov wrote:
> Hello,
>=20
> Look here:
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html#TRAVERSIN=
GGENERAL
>=20
> According to the diagram, there is routing decision after
> filter/FORWARD. However, according to the tables before, there is no
> such routing (there is only one routing before mangle/FORWARD). The
> question is, which one is correct?
>=20
>=20


--=20
Jorge Isaac Davila Lopez
Nicaragua Open Source
+505 430 5462
davila@nicaraguaopensource.com


