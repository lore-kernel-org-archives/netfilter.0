From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: traceroute
Date: Wed, 30 Jun 2004 22:55:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088628937.1755.63.camel@anduril.intranet.cartel-securite.net>
References: <2E314DE03538984BA5634F12115B3A4E62E819@email1.mitretek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2E314DE03538984BA5634F12115B3A4E62E819@email1.mitretek.org>
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

Le mer 30/06/2004 =E0 20:20, Piszcz, Justin Michael a =E9crit :
> If the output chain POLICY is set to ACCEPT; there is no need to setup
> rules for it.

Indeed, if you accept _any_ packet, you don't need to make rules to
accept ICMP ones in particular... And if you set all chains policy to
accept, then you do not need any rule, for any type of packet, and then
it's so easy to configure...

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

