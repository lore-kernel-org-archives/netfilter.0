From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: how to interconnect two private network
Date: 03 Dec 2002 14:14:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038921285.8905.9.camel@elendil.intranet.cartel-securite.net>
References: <200212030913.02744.michel.guilhem@cp.finances.gouv.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212030913.02744.michel.guilhem@cp.finances.gouv.fr>
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
To: "GUILHEM Michel (34)" <michel.guilhem@cp.finances.gouv.fr>
Cc: netfilter@lists.netfilter.org

Le mar 03/12/2002 =E0 10:13, GUILHEM Michel (34) a =E9crit :
[...]
> I want trying to do this the following rule
> iptables -t nat -A POSTROUTING -s 10.0.0.0/255.0.0.0 -o eth0 -j SNAT --=
to=20
> source 154.0.0.0/255.0.0.0=20
> But i am not sure , is my probleme solvable by a combination of iptable=
s , nat=20
> and route ?

I do not think DNAT will work until you specify a DNAT rule per client
(i.e. static DNAT).

You can use patch-o-matic NETMAP target that is almost what you exactly
want :

	http://www.netfilter.org/documentation/pomlist/pom-base.html#NETMAP

NETMAP target just alters network part of IP, letting host part
unmodified. It can provide both DNAT and SNAT if respectively used in
PREROUTING or POSTROUTING.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

