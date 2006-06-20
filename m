From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: configuring iptables for masquerading
Date: Tue, 20 Jun 2006 12:50:40 +0200
Message-ID: <4497D300.9020300@plouf.fr.eu.org>
References: <002b01c6939b$3e0f4580$cf34000a@sven>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002b01c6939b$3e0f4580$cf34000a@sven>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Hello,

Angel Tsankov a =E9crit :
> I've configured iptables for masquerading and when some of the=20
> masqueraded hosts performs a trace route I get this:
>=20
> tracert www.abv.bg

MS Windows traceroute ?

> Tracing route to www.abv.bg [194.153.145.105]
> over a maximum of 30 hops:
>=20
>  1    17 ms     5 ms     6 ms  194.153.145.105
>=20
> Trace complete.

Same with any source and destination hosts ?
Does "normal" access (web, ftp...) to the destination host work ?

This looks like the result of a TTL normalization that could be caused=20
by an iptables rule with the TTL target in the 'mangle' table. You can=20
dump the active ruleset with the command 'iptables-save'.

> This route is obviously too short. I have attached the=20
> /etc/rc.d/rc.iptables file. Could someone tell me what I have misconfig=
ured?

I don't see anything which could cause such behaviour in your script.

