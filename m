From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: SNAT: I'm going insane
Date: Sat, 31 Jan 2004 20:37:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075577846.2506.10.camel@anduril.intranet.cartel-securite.net>
References: <739652C2AFA4834AAB5986A215F68CEC01656E@svr1.home.compsup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <739652C2AFA4834AAB5986A215F68CEC01656E@svr1.home.compsup.net>
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
To: Carl Farrington <carl@compsup.net>
Cc: netfilter@lists.netfilter.org

Le sam 31/01/2004 =E0 20:22, Carl Farrington a =E9crit :
> Guess I should read up on netfilter quite a bit more. So the state tabl=
e
> is an automagic thing that re-writes the return packets.. thanks.

Yes, because deNAT is handle through conntrack, prior to anything else.
Netfilter's NAT is very bound to conntrack as you can see. That's why
unNATing rules are not necessary.

Moreover, once a packet has been NATed, no other packet belonging to
this very connection will go through nat table. Which means you only see
the very first packet of each connection in nat table.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

