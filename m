From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: tcpdump and iptables ..
Date: Sat, 06 Mar 2004 19:46:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078598785.3118.10.camel@anduril.intranet.cartel-securite.net>
References: <FD1B6DC5FFF43C4888DCC155FE8C1FFE70CC74@7xch10ka.sevenspace.local>
	 <1078589808.2066.3.camel@localhost>
	 <200403061812.31256.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403061812.31256.Antony@Soft-Solutions.co.uk>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

Le sam 06/03/2004 =E0 19:12, Antony Stone a =E9crit :
> tcpdump sees ethernet frames,=20
> IPX and similar traffic which are not even IP based, as well as complet=
ely=20
> different media types such as 802.11b headers.   All this gets stripped=
 off=20
> before reaching netfilter (with the exception of MAC addresses, but eve=
n=20
> there, netfilter can't tell whether a packet arrived by ethernet or 802=
.11).

Just a notice about 802.11 stuff.

The way tcpdump will see traffic coming from a wireless link depends on
the wifi interface state. If the interface is in normal operation mode
(managed, ad-hoc or master), it will see frames as usual ethernet ones,
just as it was sniffing a wired link. If the interface is in monitor
mode, then it will see the frames will full 802.11 header.

BTW, I can confirm tcpdump will see outgoing traffic as it is after
POSTROUTING chain, and incoming one as it is before PREROUTING. I've
just checked playing with TTL on pings.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

