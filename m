From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: Reject Mac-Address
Date: 01 Aug 2003 11:28:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059730096.1516.4.camel@elendil.intranet.cartel-securite.net>
References: <FDEMKKNJDLAJDPNDPCDDKEDENFAA.georgev@citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDEMKKNJDLAJDPNDPCDDKEDENFAA.georgev@citadelcomputer.com.au>
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
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: Leonardo Pires <leonardo@nextwave.com.br>, netfilter@lists.netfilter.org

Le ven 01/08/2003 =E0 11:15, George Vieira a =E9crit :
> Hey, don't forget.. the firewall will only see the MAC of the routers (=
from
> experience) unless the routers pass the MAC address across when routed.=
..
> but AFAIK they don't.. so -m mac is useless in this scenario...

True, I focused on source MAC filtering and forgot to have a more
attentive look at the network drawing. My mistake.

> internet--router---firewall---router---clients

Using this architecture, clients MAC address won't be visible from
firewall. Routeur's one will be the only one visible.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

