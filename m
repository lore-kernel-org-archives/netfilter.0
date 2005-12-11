From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: QoS with netfilter
Date: Sun, 11 Dec 2005 09:07:53 +0100
Message-ID: <1134288474.8304.4.camel@anduril.intranet.cartel-securite.net>
References: <bab495710512100453s275d2335l4a92d90d37224c2@mail.gmail.com>
	<200512101357.44378.arny@ats.s.bawue.de>
	<bab495710512100528h5103dd81t35a56afe726a7b7b@mail.gmail.com>
	<1134232492.31448.0.camel@anduril.intranet.cartel-securite.net>
	<bab495710512101014g6909071s2e69552681c39cd3@mail.gmail.com>
	<1134243923.3532.8.camel@anduril.intranet.cartel-securite.net>
	<439B7959.4000400@lopsch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <439B7959.4000400@lopsch.com>
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
To: Daniel Lopes <lopsch@lopsch.com>
Cc: netfilter@lists.netfilter.org

Le dimanche 11 d=E9cembre 2005 =E0 01:56 +0100, Daniel Lopes a =E9crit :
> Perhaps I'm wrong but the handling will be done bei IP as soon as the=20
> bits are set. That's the way the internet routers should work. With tc=20
> you can do other schemes of handling. Correct me please if I'm wrong.

I haven't seen a public router reading TOS/DSCP values from foreign
packets. If so, what would be the point ? Everybody would ask for higher
bandwidth, higher priority, and we would end just the same we were
before.
AFAIK, there's not requirement for an IP stack to apply QoS policy to
TOS/DSCP marked packets, unless the admin has decided so. You have to
use tc for that (at least for TOS I'm sure).


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

