From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Hogwash Vs snort-inline Vs Iptables
Date: Tue, 31 Aug 2004 16:08:32 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093961312.2281.105.camel@anduril.intranet.cartel-securite.net>
References: <a05ad87504083106581832c864@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a05ad87504083106581832c864@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: Murugavel Thiruvengadam <tmurugavel@gmail.com>
Cc: netfilter@lists.netfilter.org

Le mar 31/08/2004 =E0 15:58, Murugavel Thiruvengadam a =E9crit :
> Iptables will work in kernel level . What about the others.=20

Snort Inline relies on Netfilter as it gets packets using iptables QUEUE
target. This means you have total control of traffic being filtered by
Netfilter and traffic being filtered by Snort Inline. That's why I do
prefer Snort Inline to Hogwash.

Speaking of string match in iptables, forget it. One basic  able thing
an IPS/IPS has to implement is fragmentation resistance. String match
will not work against TCP fragmentation, as it is a per packet match, so
it will not detect an attack payload split on two TCP packets.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

