From: Brian C.Howard <bh@staff.tjs.org>
Subject: Routing between subnets on the same physical network
Date: Fri, 21 Jan 2005 00:02:21 -0600
Message-ID: <03CCE042-6B72-11D9-B191-000393AEDAC4@staff.tjs.org>
Mime-Version: 1.0 (Apple Message framework v619)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I have a rather bizarre network setup:


I have two separate subnets, a 192.168.1.0 and 10.1.1.0 which both 
coexist on the same physical network.  Splitting the networks is 
impossible for a multitude of reasons.

The 192.168.1.0 subnet has a debian box running netfilter which nats it 
to a real IP address on the internet (via a cable modem).

The 10.1.1.0 subnet has a proprietary router which does some 1:1 nat 
for low addresses, and many:1 nat for high addresses.  Traffic on this 
subnet reaches the internet through a T1.


The problem is that a large percentage of the traffic outbound on the 
192.168.1.0 subnet is destined to the external ips of a hosts (say A) 
on the 10.1.1.0 subnet, thus wasting bandwidth in both directions.  I 
can't simply add an alias to host A, as it is a complicated server, and 
wouldn't take well to that sort of thing.

The question is how do I make A directly reachable from the 192.168.1.0 
subnet?  I don't want to do any nat with netfilter, because slots in 
the conntrack table are already at a premium.  Ideally, I would like to 
add some rule or route which would tell hosts that A is directly 
reachable (currently, if you try to ping 10.1.1.6 (A's address) from 
the 192.168.1.0 subnet, you get a no route to host error).

Any thoughts would be much appreciated.

--
Brian Howard


