From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: define 'connections'
Date: Mon, 02 Feb 2004 00:57:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075679868.2300.5.camel@anduril.intranet.cartel-securite.net>
References: <200402012232.i11MWZu04330@neo1.neolabs.be>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200402012232.i11MWZu04330@neo1.neolabs.be>
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
To: jo@neolabs.be
Cc: netfilter@lists.netfilter.org

Le dim 01/02/2004 =E0 22:32, jo@neolabs.be a =E9crit :
> is this correct :=20
> when you are SNAT-ing and using a statefull firewall, iptables must
> manage 2 different 'states' :
> - the connections that went out so incoming response packets are matche=
d
> to the correct outgoing request packets
> - the states of the state module meaning a list of the connections so
> incoming responste packets are ALLOWED to go back in

In fact, Netfilter has only one state table that contains the whole
information about each packet, NATed or not. So only the "first" table
you mention exist and does the whole job.

Your "second" state table does not exist as Netfilter does not allow
itself a packet to get through whatever can be its state. Netfilter does
not behave like Packet Filter that let go response packets as long as
the first one was matched with a "keep state" rule. It just "flags" the
packet and it is up to you to decide wether this packet should go
through or get dropped.

> I guess if you are doing SNAT with an empty filter table, you only have
> the 'states' of the first kind, right?

Yes...

> Which one of these do we actually see in /proc/net/ip_conntrack ?

Both NAted and normal connections as mentionned before.

> Are these the SNAT-connections or the states from the state module?

Both, as they all belong to the conntrack engine.

> Where can I find the default lifetime for both?

Use the source, Luke, use the source ;)

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

