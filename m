From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: traceroute
Date: Thu, 01 Jul 2004 14:15:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088684154.4124.2.camel@anduril.intranet.cartel-securite.net>
References: <Pine.LNX.4.33.0407011119540.29206-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0407011119540.29206-100000@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter <netfilter@lists.netfilter.org>

Le jeu 01/07/2004 =E0 11:21, Jozsef Kadlecsik a =E9crit :
> Actually UDP based traceroute uses ports in the range 33434-33523.

Just an add-on for those who want to allow traceroute through a
Netfilter firewall in FORWARD : Windows traceroute uses ICMP echo
requests. Thus, ICMP echo has to be accepted in order to have it work
from Windwos boxes.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

