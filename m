From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: how do I set the MAC address in POSTROUTING?
Date: Mon, 11 Dec 2006 07:29:56 +0100
Message-ID: <1165818596.13113.9.camel@anduril.intranet.cartel-securite.net>
References: <eknslc$rpq$1@sea.gmane.org>
	<200612010153.55904.Daniel@musketa.de>	<ekph22$1va$1@sea.gmane.org>
	<45704F1C.7070703@plouf.fr.eu.org>  <457C395F.1000702@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <457C395F.1000702@gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: sean <seandarcy2@gmail.com>
Cc: netfilter@lists.netfilter.org

Le dimanche 10 d=E9cembre 2006 =E0 11:44 -0500, sean a =E9crit :
> The internet routers just look at the ip address, so I=20
> wouldn't think they'd strip out the MAC address, do they?

MAC addresses are layer 2 addresses. They don't propagate outside
ethernet network when packet is handled by a router.

So, yes your local router can see your client MAC address and you can
use -m mac in iptables to match it. If you're sitting outside your
client's LAN, you won't see its MAC address.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

