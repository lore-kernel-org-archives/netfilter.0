From: "Michael Forrest" <michael@erg.abdn.ac.uk>
Subject: Libipq problems...
Date: Wed, 21 May 2003 12:23:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000201c31f8b$64eec270$66cf858b@ENTERPRISE>
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


Hi all,

I was wondering if anyone had seen a similar problem to the one am
having? Its more than likely a simple issue, but just cant seem to
figure it out at the mo. I'm connecting two machines to a hub and the
hub is then connected onwards into the network. The machine that I wish
to see all traffic has the promisc mode on the interface and should see
all traffic.

I'm using a QUEUE target with an appropriate program for receiving the
packets in userspace, I'm almost 100% certain the program works. It
works for loopback cases and receives all other traffic I throw at it.
Locally generated traffic is seen by the QUEUE module...although other
traffic on the hub is not seen by the QUEUE module. It sees only
broadcast messages and multicast, but no unicast.

I'm adding a hook to the mangle table on the PREROUTING chain as follows
:-

	iptables -t mangle -I PREROUTING -j QUEUE

This should queue anything......from my understanding of the iptables
command syntax.

Watching the physical packet counts on the mangle chains, they don't
increment by much...usually only a few packets here and there, which are
network broadcasts or multicast packets from other machines.

The strange part is, if I run tcpdump on the machine or use pcap for
packet capture. All packets are seen by the machine on tcpdump/or
pcap...although the QUEUE module only sees the packets I mentioned
above.

Is this normal or have I missed something here??

Thanks,

Michael.

--
[root@atlantis root]# ifconfig -a
eth0      Link encap:Ethernet  HWaddr 00:04:76:DD:BD:3A  
          inet addr:192.168.0.103  Bcast:192.168.0.255
Mask:255.255.255.0
          UP BROADCAST RUNNING PROMISC MULTICAST  MTU:1500  Metric:1
          RX packets:201616 errors:0 dropped:0 overruns:1 frame:0
          TX packets:86807 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100 
          RX bytes:229546583 (218.9 Mb)  TX bytes:7732765 (7.3 Mb)
          Interrupt:11 Base address:0xdc00 

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:94 errors:0 dropped:0 overruns:0 frame:0
          TX packets:94 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:6307 (6.1 Kb)  TX bytes:6307 (6.1 Kb)
--


