From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: tunneling and iptables
Date: Wed, 10 Mar 2004 08:16:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078902997.2564.18.camel@anduril.intranet.cartel-securite.net>
References: <5.2.1.1.2.20040309214501.00b47310@postoffice6.mail.cornell.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.2.1.1.2.20040309214501.00b47310@postoffice6.mail.cornell.edu>
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
To: Hitesh Ballani <hb69@cornell.edu>
Cc: netfilter@lists.netfilter.org

Le mer 10/03/2004 =E0 03:52, Hitesh Ballani a =E9crit :
> i was stuck with the interaction of iptables and tunneling ...if i have=
 an=20
> ip-ip tunnel, are the ip hooks checked for both the outer and the inner=
 ip=20
> header ?

Most of the time, both of them.
Usually, on Linux, tunnel usage means logical interface creation (tun0,
tap0, sit0, ppp0, etc.). Suppose you create a tunnel called tun0 over
eth0.

You will see tunneling packets on eth0, INPUT chain.
You will see tunneled packets on tun0, INPUT or FORWARD chain depending
on the way they're routed.

> Also,  the mark extension allows you to mark packets with 16-bits marks=
=20
> which is big enough to encode the port number, but if i try to add poli=
cy=20
> routing on the fly using the ip rules command then i get screwed becaus=
e=20
> the table-id (for specifying which table has the rules to route this=20
> packet) is only 8-bits and so, I cannot encode the port numbers in ther=
e=20
> ... i know this is not a clear description but if you know anything abo=
ut=20
> this problem, i would be more than happy to spell the details out...

Do you really need the full 16 bits space ? I mean that you'll need it
if you have 16^2 different routes (one mark per route) which should not
the case.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

