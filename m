From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: TTL patch buggy?
Date: Thu, 08 Jan 2004 09:02:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073548926.768.15.camel@elendil.intranet.cartel-securite.net>
References: <Pine.LNX.4.44.0401071709030.4717-100000@filer.marasystems.com>
	 <1073502275.16972.10.camel@jasiiitosh.nexusmgmt.com>
	 <20040107193547.GF6629@obroa-skai.de.gnumonks.org>
	 <1073506041.16972.25.camel@jasiiitosh.nexusmgmt.com>
	 <20040107213853.GD20346@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040107213853.GD20346@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>, netfilter@lists.netfilter.org

Le mer 07/01/2004 =E0 22:38, Ramin Dousti a =E9crit :
> You can hide the firewall and the internal network if you reset the
> TTL of these packets to the max (255) and drop the outbound ICMP
> port unreachable (in case of UDP traceroute) and ICMP echo-reply
> (in case of ICMP traceroute).

Avoiding traceroutes can't be easily done by blocking consequences, as
they are numerous. I mean you can do a traceroute using TCP as well (see
tcptraceroute tool), or even using applications requests on UDP, such as
a DNS request (useful to traceroute microsoft.com DNS server), or
anything else that can trigger a valuable target response. In thoses
cases, you really can't block final answer as it is a valid one.

Moreover, if blocking echo-reply is no arm, blocking ICMP errors can
have really bad side effects. If we look a bit closer, a well configured
firewall should not let a packet destined to a closed UDP port go
through... Letting conntrack deal with ICMP error is to me the best
deal.

If you really want to prevent traceroute based discoveries, you just
should raise packets TTL so they don't expire within your network for
normal operations. So you'll add 2, 3, maybe 4 to the TTL, but not more.
Resetting TTL to 255 is far too much if a loop appears.
If you want to prevent discovery based on the TTL of packets you send,
reset TTL for outbound traffic to a default value such as 64.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

