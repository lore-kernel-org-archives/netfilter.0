From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: "selective" connection tracking?
Date: Fri, 31 Oct 2003 10:10:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067591422.812.13.camel@elendil.intranet.cartel-securite.net>
References: <3F9EA786.5060401@otaku42.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F9EA786.5060401@otaku42.de>
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
To: Michael Renzmann <mrenzmann@otaku42.de>
Cc: netfilter@lists.netfilter.org

Le mar 28/10/2003 =E0 18:29, Michael Renzmann a =E9crit :
> Is it possible to use connection tracking only for specified=20
> connections, but not for all? Or would it be possible to "disable"=20
> connection tracking for connections that go through the forward chain,=20
> and using it only for connections that from/to the machine itself?

With stock Netfilter/iptables, it is not possible. Once ip_conntrack is
loaded, every packet is evaluated against connection tracking and is
given a state.

However, you can use raw table that is available in patch-o-matic. This
will imply iptables and kernel compilation. raw table is prior to
conntrack subsystem and allows you to choose wether a packet has to go
through conntrack or not, using NOTRACK target :

	iptables -t raw -A PREROUTING -d 1.2.3.4 -p tcp --dport 80 \
		-j NOTRACK

Then, you can match them afterwards using UNTRACK state :

	iptables -A FORWARD -m state --state UNTRACKED -j ACCEPT

Note that if you do not conntrack a connection, you loose all conntrack
capabilities such as ICMP errors handling, helpers and NAT (as
Netfilter's NAT relies on conntrack).

See http://www.netfilter.org/documentation/pomlist/pom-base.html#raw for
more details (examples are excerpts from this page).

I also like raw table TRACE target that allows full debugging as traced
packets will get logged for any rule they meet.

> As far as I could find out: when starting to use stateful inspection=20
> features connection tracking is loaded (as module), which then is=20
> applied to ALL the connections that are comming into / going out of the=
=20
> machine and are passed through it (where the machine acts as router). I=
s=20
> that correct?

Correct, unless using raw table.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

