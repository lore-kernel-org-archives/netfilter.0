From: "former03 | Baltasar Cevc" <baltasar.cevc@former03.de>
Subject: Re: Change Source IP Without Using SNAT
Date: Sun, 6 Aug 2006 17:38:43 +0200
Message-ID: <8b3be9fdc67d169b5e0196def78f954f@former03.de>
References: <20060804145057.62yh7umql7kg8040@secure.softwarelivre.org>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060804145057.62yh7umql7kg8040@secure.softwarelivre.org>
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
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Priscilla Kurtz <pri@softwarelivre.org>
Cc: netfilter@lists.netfilter.org

Hi Priscilla,

> I'm building a small communicating process migration tool:  you telnet=20=

> a server
> from A; you checkpoint the process (execution and communication),=20
> migrate
> theses checkpointed images to from A to B; restore the process in B =
and
> everything stays as the same in A.
>
> The main problem here is that IP has no mobility skills in its pure=20
> form.
> The idea I had was to configurate an alias for eth0, so my NIC can=20
> answer for
> two IPs: eth0 and eth0:0. For testing my tool, I'm using a small=20
> cluster with 6
> nodes + front-end. So, only one node at a time has the eth0:0 up=20
> because this
> virtual interface is also migrated. For that, the connections wuold be
> identified by IP_telnerServer, IP_eth0:0; PORT_telnetServer,=20
> PORT_'eth0:0'.
>
> But, as usual, all the traffic is routed through default gw route. All=20=

> I wanted
> to do is build up a rule (by /sbin/route ou by iptables) that forces=20=

> traffic go
> go out through eth0:0. I realised that if I make all the traffic go=20
> out by
> eth0:0 and migrate eth0:0 in some time later, I'll be screwing all=20
> other
> process' communication, right? So I thought about iptables. But all=20
> source Ip
> mangling stuff is done with SNAT. To me, it's not useful because NAT=20=

> rules only
> are checked for new connections. And I'm migrating a connection which,=20=

> in
> theory, remains the same.
You can't route any traffic on a virtual interface in that sense -=20
eth0:0 *is*
eth0, it's just a work around for some tools that do not support=20
multiple IPs
per interface.

The nat table will see each connection only once, however, I assume=20
(don't know!)
that that's a conntrack thing, so in case your conntrack hasn't seen=20
the packet
yet, it will pass the nat.

> So after this bla bla bla, the question is: how can I change source ip=20=

> without
> using SNAT?
You can't. At least not using an unmodified iptables/netfilter.

Baltasar

--

Baltasar Cevc

_____ former 03 gmbh
_____ infanteriestra=DFe 19 haus 6 eg
_____ D-80797 muenchen

_____ http://www.former03.de


