From: Nick Taylor <nickt@lightlink.com>
Subject: Re: NETMAP nat target and strange traceroutes
Date: Thu, 1 Jul 2004 12:04:29 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSU.4.58.0407011123550.17661@adore.lightlink.com>
References: <Pine.LNX.4.33.0407011144170.29404-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0407011144170.29404-100000@blackhole.kfki.hu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

> > Thank you for responding.  I don't think that we've communicated the
> > problem clearly, though.
>
> OK, could you add the IP addresses of the interfaces to the ASCII chart?
>
I've updated to ASCII chart to show the four DSL modems in use (fvrp*), as
well as the 3 linux boxes (bond0* and rp2), and the cisco router (t3).  In
order to distinguish the lines indicating network topology from the lines
connecting the lables, I've used hash marks (#) to indicate a network
connection.  I hope this is more clear.

The IPs are as follows:


207.127.235.1
|        10.42.0.1
|        |    10.42.0.2
|        |    |     10.42.1.1
|        |    |     |   10.42.1.2
|        |    |     |   |     10.42.2.2      207.127.233.35
|        |    |     |   |     |    10.42.2.1 |
|        |    |     |   |     |    |         |
T3###bond0####fvrp0fv###fvrp0rp####bond0rp###rp2###customer
     |     #                    #        |
     |     #                    #        |
     |     ###fvrp1fv###fvrp1rp##        207.127.233.33
     |        |     |   |     |
     |        |     |   |     10.42.2.3
     |        |     |   10.42.1.4
     |        |     10.42.1.3
     |        10.42.0.3
     207.127.235.40


T3 has IP 207.127.235.1 (among others)
bond0:eth0 is 207.127.235.40, and 207.127.235.28
bond0:eth1 is 10.42.0.1

there are four DSL modems not shown in the original diagram, they are
numbered as follows:

10.42.0.2, and 10.42.0.3 plug into eth1 of bond0
the "wan" side of these modems are 10.42.1.1 and 10.42.1.3, respectively.

another set of modems attaches to the other end of the BANA circuits,
"wan" addresses are 10.42.1.2, and 10.42.1.4.  The ethernet ports of these
modems plug into bond0rp:eth0, and they have addresses 10.42.2.2, and
10.42.2.3.

bond0rp:eth0 is 10.42.2.1
bond0rp:eth1 is 207.127.233.33

There is however a NETMAP nat rule in place for the 207.127.233.32/28
network, mapping it to 10.23.23.0/28, so the machine knows itself as
207.127.233.33, and machines in the "outside world" should know it by that
address, but while local packets traverse the DSL links, they'll be
10.23.23.1.

rp2:eth0 is 207.127.233.35 (natted to 10.23.23.3) and
rp2:eth1 has many aliases, too many to list.

