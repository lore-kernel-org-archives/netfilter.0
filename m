From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: Protecting against DoS
Date: Tue, 9 Dec 2003 17:43:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031209154333.GB17221@edu.joroinen.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hello!

I was thinking about the correct or best way to protect my Linux/netfilter =

box againts DoS-attacks.=20

Some time ago one of the windows users in my LAN managed to get nimda (or
some other) worm to his computer. The worm started scanning the internet
for other vulnerable boxes, opening big amount of tcp-connections all the
time without closing them.=20

So after a while I hit the limit of max. open connections
(/proc/sys/net/ipv4/ip_conntrack_max), and the firewall-box is basicly
DoS:ed. With the default settings, open tcp-connections stay in the state
table for 5 days, so it takes a looong time to get things running again if
you don't reload the modules or reboot the box..

Now I have a couple of questions to be sure about the facts while setting=20
up the correct limits to prevent this kind of DoS-attacks..


1) Is the correct formula to calculate the maximum number of connections
(for /proc/sys/net/ipv4/ip_conntrack_max) free_memory_in_bytes / 350 ? This
is what I got from the Netfilter FAQ: "You can easily increase the number of
maximal tracked connections, but be aware that each tracked connection eats
about 350 bytes of non-swappable kernel memory!"

2) Netfilter FAQ: "To optimize performance, please also raise the number of
hash buckets by using the hashsize module loadtime parameter of the
ip_conntrack.o module." What's the correct formula to calculate good value
for hashsize?

3) Is there some problem other than the idle tcp-connections dying sooner i=
f I
lower the the value of TCP_CONNTRACK_ESTABLISHED in
/usr/src/linux/net/ipv4/netfilter/ip_conntrack_proto_tcp.c from 5 days to 1
day or even less (to get the possible non-closed tcp-connections out from t=
he state
table sooner) ?

4) What's the correct place to set up limits for new connections (to prevent
the state table being filled up in DoS) ? Is it better to do in the=20
mangle-table/PREROUTING-chain something like "-m state --state NEW -m limit=
=20
--limit 5/sec -j RETURN && -j DROP" than later in the filter-table/FORWARD-=
chain?
I'm thinking about performance here..

5) I'm thinking about measuring average "new connections per second"-rate
and setting up limits to obey that.. is this good way?

6) Do you have some other tips? What are the biggest problems in addition to
getting the state table filled up..


Thanks for your replies!

-- Pasi K=E4rkk=E4inen
      =20
                                   ^
                                .     .
                                 Linux
                              /    -    \
                             Choice.of.the
                           .Next.Generation.

