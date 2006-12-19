From: Jeremy Freeman <jeremy@jrmy.net>
Subject: Why is my nat pre chain being bypassed by streaming udp?
Date: Tue, 19 Dec 2006 11:59:41 -0800
Message-ID: <458844AD.9000308@jrmy.net>
Mime-Version: 1.0
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

I am butting my head here folks for the past few days and hopefully
someone will be able to help me.

Background:

We receive streaming udp traffic from two sources destined for port
8302. They are always sending this traffic whether are box is on or not.
Just keeps on coming.
We want to split off the traffic from one of the sources and redirect it
to port 9302. They will not do this for us, so we need to use a REDIRECT
rule in the nat table to do this.

With every other chain empty and with an ACCEPT policy:

iptables -t nat -A PREROUTING -p udp -s <source2 ip> --dport 8302 -j
REDIRECT --to-ports 9302

however, traffic from source2 keeps on hitting 8302.

Doing a iptables -t nat -L -n -v shows:

  0     0 REDIRECT   udp  --  *      *       <source2 ip>
0.0.0.0/0           udp dpt:8302 redir ports 9302

So the traffic is never getting picked up by the chain.

Even doing a general rule in the nat PREROUTING with no target shows
that no traffic is hitting:

  0     0            udp  --  *      *       <source2 ip>       0.0.0.0/0

This is a very simple box with only 1 interface (eth0).

I thought this may be due to connection tracking so I added a raw entry
to NOTRACK the traffic also:

Chain PREROUTING (policy ACCEPT 90101 packets, 12M bytes)
9491 1333K NOTRACK    all  --  *      *       <source2 ip>      0.0.0.0/0

So I see the raw chain is picking it up.. But it is skipping past the
nat chain.

Does anyone know why this is occurring?
One other thing to note is this traffic is being natted first by a cisco
router. But tcpdump shows it coming in as follows:

11:53:27.133025 IP <source2 ip>.32811 > 192.168.6.165.8302: UDP, length 255
11:53:27.133585 IP <source2 ip>.32811 > 192.168.6.165.8302: UDP, length 74
11:53:27.133876 IP <source2 ip>.32811 > 192.168.6.165.8302: UDP, length 74
11:53:27.335457 IP <source2 ip>.32811 > 192.168.6.165.8302: UDP, length 74
etc

Any help or ideas would be greatly appreciated.

--
Jeremy Freeman


etc etc




