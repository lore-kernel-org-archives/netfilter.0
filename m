From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: dnat with mac instead of ip address?
Date: Tue, 13 Jul 2004 13:40:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1089718849.2100.1.camel@anduril.intranet.cartel-securite.net>
References: <OF10BF823B.F4DC31CA-ONC1256ED0.0034E497-C1256ED0.0034FAB7@promon.cz>
	 <200407131200.03000.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407131200.03000.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

Le mar 13/07/2004 =E0 13:00, Antony Stone a =E9crit :
> Change the destination MAC address on a packet, without changing the IP=
=20
> address?

OP has to see ebtables :

	http://ebtables.sourceforge.net/

Ebtables can perform SNAT and DNAT regarding MAC addresses, but as far
as I could see, you can provide a solution to all examples without this.
In fact, MAC DNAT could be seen as a "simple" form of ARP proxy.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

