From: "Shaun Hedges" <sh@realsecure.net>
Subject: Netfilter max simultaenous connections limit>?
Date: Tue, 2 Sep 2003 16:23:29 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <IAEOKBNDAKLABMLEEMMKAEBBFOAA.sh@realsecure.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

We have high speed applications that open up hundreads of threads per
computer very fast then close then open again.  At one time, we can have
about 15000 tcp connections going through the firewall at once.  We've
recently been adding more application servers but we're noticing that the
bandwidth usage isn't going up intune with the number of computers, it's
actually staying around the same.  We know this shouldn't be the case so am
wondering if 15000+ connections is too much for a RH Linux+netfilter
configuration using no stateful inspection just basic FORWARD'ing rules to
block all traffic from those machines except one port coming in.  Our
firewall rules:
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:RH-Lokkit-0-50-INPUT - [0:0]
-A INPUT -j RH-Lokkit-0-50-INPUT
-A RH-Lokkit-0-50-INPUT -i eth0 -j ACCEPT
-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 65456 --syn -j ACCEPT
-A RH-Lokkit-0-50-INPUT -i lo -j ACCEPT
-A FORWARD -d 192.168.168.0/27 -p udp -m udp --sport 53 -j ACCEPT
-A FORWARD -d 192.168.168.0/27 -p udp -m udp --dport 53 -j ACCEPT
-A FORWARD -d 192.168.168.0/27 -p tcp -m tcp --syn -j DROP
-A FORWARD -d 192.168.168.0/27 -p udp -j DROP
-A RH-Lokkit-0-50-INPUT -p udp -m udp -s 0/0 --sport 53 -d 0/0 -j ACCEPT
-A RH-Lokkit-0-50-INPUT -p udp -m udp -s 0/0 --dport 53 -d 0/0 -j ACCEPT
-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 80 --syn -j ACCEPT
-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --syn -j REJECT
-A RH-Lokkit-0-50-INPUT -p udp -m udp -j REJECT

COMMIT

WE basically just allow nothing in to the subnet but everything out..

Our router is a P1.7ghz Celeron w/ 512mb ram and IDE disks and 2 3com NIC
nic cards..  Is this insufficient?  Our b/w usage is a mere 2.5mbits, but we
have about 8mbits available, and when it goes up, we seem to add more
incoming bandwidth as outgoing, it looks as though the errors or timeouts
are increasing.

Any ideas?  Do I have to increase a limit in anyway?

Thx


