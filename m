From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: tc and iptables
Date: 16 Dec 2002 11:15:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1040033709.11898.11.camel@elendil.intranet.cartel-securite.net>
References: <3DF6C4D3.6040109@deeeproot.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DF6C4D3.6040109@deeeproot.co.in>
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
To: nimit <nimit@deeeproot.co.in>
Cc: netfilter@lists.netfilter.org

Le mer 11/12/2002 =E0 05:53, nimit a =E9crit :
> 	i am new to netfilter, just learning to use iptables and tc, but i am=20
> not clear which one is more suitable for bytelimiting purpose.

Well... See LARTC at http://lartc.org/...

Netfilter is a packet filter, which is suitable for filtering network
flows.
tc is a traffic control utility, which is suitable for controling
traffic behaviour, so bytelimiting purposes.

Netfilter's limit match is _not_ suitable for traffic shaping, as said
in Filtergin HOWTO.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

