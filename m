From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: masquerade over multiple gw
Date: 26 Feb 2003 12:14:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046258095.11967.6.camel@elendil.intranet.cartel-securite.net>
References: <1046000223.3276.9.camel@debian>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1046000223.3276.9.camel@debian>
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
To: Esteban Ribicic <eribicic@UolSinectis.com>
Cc: netfilter@lists.netfilter.org

Le dim 23/02/2003 =E0 12:37, Esteban Ribicic a =E9crit :
> im trying to masquerade my internal network to internet over two gw.
> it seems imposible to specify more than one -o interface right?=20
> now im using this:=20
> iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE
> but i still have ppp0 wich also is conected to the internet..
> any idea?

Juste add a second rule...

	iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

Then, packets routed through ppp0 will be masqueraded.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE


