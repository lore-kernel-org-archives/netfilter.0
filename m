From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Passed chains from local process to local ip
Date: Mon, 26 Jul 2004 09:03:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090825381.2463.59.camel@anduril.intranet.cartel-securite.net>
References: <23413.1090823248@www51.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <23413.1090823248@www51.gmx.net>
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
To: andilist@gmx.de
Cc: netfilter@lists.netfilter.org

Le lun 26/07/2004 =E0 08:27, andilist@gmx.de a =E9crit :
> my network interface has 5 ip-adresses. If have 2 daemons (say A and B)
> running on 2 different local ip-Addresses (ip-A and IP-B) on the same p=
ort.

OK.

> It's not possible to run a deamon on 2 or more addresses.

Yes it is. Maybe you're meaning your particular daemon is not capable of
running one specific interfaces, but I can show you Apache servers that
runs on 2 out of 4 interfaces, not counting virtual hosts stuff, BIND
that runs the same way, etc...

> so i need to forward ip-c, ip-d and ip-e to ip-a.

So be it.

> ip-a -> A
> ip-b -> B
> ip-c -> ip->a -> A
> ip-d -> ip->a -> A
> ip-e -> ip->a -> A

Do you mean ip-c -> ip-a -> A ?

> it works allready from packets from remote hosts (with dnat and prerout=
ing),

OK.
/
> but not from local packets. to use dnat for local packets in the output
> chain i read that i must update the kernel and install a new version of
> iptables.

To use DNAT on OUTPUT, you have to build your kernel with "NAT of local
connections" options, and no particular iptables configuration except
using a version prior or equal to 1.2.6a which is now quite old (out
there since 17/03/2002).

Anyway, I must admit I have some difficulties to understand your context
and the particular reason why A cannot listen on ip-a, ip-c, ip-d and
ip-e. The fact is locally generated packets NAT works. I use it all the
time for SSH redirections, but I never tried it on locally destined
traffic. The more I can say is try and see for yourself, but I guess it
will work (don't forget local traffic is bound to lo interface, whatever
local addresses it uses as source or destination).


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

