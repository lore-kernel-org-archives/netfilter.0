From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: traceroute
Date: Thu, 01 Jul 2004 14:25:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088684733.4124.12.camel@anduril.intranet.cartel-securite.net>
References: <2E314DE03538984BA5634F12115B3A4E62E81C@email1.mitretek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2E314DE03538984BA5634F12115B3A4E62E81C@email1.mitretek.org>
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
To: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter <netfilter@lists.netfilter.org>

Le jeu 01/07/2004 =E0 11:52, Piszcz, Justin Michael a =E9crit :
> He was talking about pinging from behind his NAT, it has nothing to do
> with people pinging him, FYI.

I picked the thread at this stage, and for what I understood, your
statement about ICMP filtering was far more general than this very
situation with some profitable ruleset :

> ICMP is "allowed" when you -I INPUT ESTABLISHED,RELATED.
> You do not have to allow it explicitly (ie: allow icmp so other
> machines can ping your machine).


Anyway, even in this kind of situation, NAT handling is one thing, and
filtering is another. So, depending on how your filtering rules are
implemented, your statement remains wrong.

I don't mean to be aggressive upon you, but for what I read from this
thread, you made a wrong statement about ICMP filtering, and that's it.
Bas faith arguing on some special background context has no relevance.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

