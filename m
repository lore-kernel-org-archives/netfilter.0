From: John Sasso <jsassojr@nycap.rr.com>
Subject: Problem w/ iptables on FC3
Date: Mon, 04 Jul 2005 10:25:14 -0400
Message-ID: <1120487114.7207.10.camel@localhost.localdomain>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I am desperately trying to get the version of iptables that comes
default on Fedora Core 3 to work, even with a simple configuration.  The
version of iptables is 1.2.11.

The simple script is shown below, followed by the 'iptables -L' output
and interface configuration.  My system is single-homed, and starting
off simple I am trying to allow outgoing pings.  After running the
script, when I try to ping anything I get:

ping: sendmsg: Operation not permitted

What is going on here?  I've followed closely the guidelines given in
several books on iptables and a variety of online docs, but to no avail.
Is this a bug?

--john

--------------------------------------------
# Initialize all the chains by removing all the rules tied to them
iptables --flush
iptables -t nat --flush
iptables -t mangle --flush

# Now that the chains have been initialized, remove the user-defined
# chains.  We will recreate them afterwards
iptables --delete-chain
iptables -t nat --delete-chain
iptables -t mangle --delete-chain

# If a packet does not match any of the built-in chains, then the policy
# should be to drop it.
# If the firewall has only one interface, the FORWARD policy is not
necessary.
# However, defining a FORWARD policy is a precaution for future use.
iptables --policy INPUT    DROP
iptables --policy OUTPUT   DROP
iptables --policy FORWARD  DROP

iptables -A INPUT  -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

iptables -A OUTPUT -o eth0 -s 192.168.50.100 -p icmp --icmp-type echo-
request -j ACCEPT
iptables -A INPUT -i eth0 -d 192.168.50.100 -p icmp --icmp-type echo-
reply -j ACCEPT
--------------------------------------------


--------------------------------------------
# iptables -L
Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
ACCEPT     icmp --  anywhere             192.168.50.100      icmp echo-
reply

Chain FORWARD (policy DROP)
target     prot opt source               destination

Chain OUTPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
ACCEPT     icmp --  192.168.50.100       anywhere            icmp echo-
request
--------------------------------------------


# ifconfig -a
eth0      Link encap:Ethernet  HWaddr 00:20:78:07:BE:45
          inet addr:192.168.50.100  Bcast:192.168.50.255
Mask:255.255.255.0
          inet6 addr: fe80::220:78ff:fe07:be45/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:160 errors:0 dropped:0 overruns:0 frame:0
          TX packets:144 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:25140 (24.5 KiB)  TX bytes:14039 (13.7 KiB)
          Interrupt:11 Base address:0x2000



