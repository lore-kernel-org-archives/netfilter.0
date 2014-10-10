From: Aravindhan Dhanasekaran <adhanas@ncsu.edu>
Subject: Help: Marking UDP packets in a bridge
Date: Fri, 10 Oct 2014 11:28:00 -0400
Message-ID: <5437FB00.3030806@ncsu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I'm trying to mark UDP packets entering (or leaving) a bridge, destined to a
particular UDP port on a machine on the other side of the bridge.

My simple topology looks like:
host1 [eth1] <-----> [s1-eth1] bridge [s1-eth2] <-----> [eth1] host2


I've added a rule to the FORWARD chain on the mangle table in the bridge to mark
the packets that I require:
$ sudo iptables -t mangle -A FORWARD -p udp --dport 9917 -j MARK --set-mark 17
$ iptables -L FORWARD -t mangle -v
Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source       destination
    0     0 MARK       udp  --  any    any     anywhere     anywhere      udp
dpt:9917 MARK set 0x11


But, looks like none of packets are being marked (counters are all 0s in
iptables output as shown above). I have traffic matching the above rule flowing
through the bridge which I verified using tcpdump.
$ sudo tcpdump -i s1-eth1 udp dst port 9917
...
11:22:14.774417 IP 10.0.0.2.49774 > 10.0.0.1.9917: UDP, length 1470
11:22:14.774597 IP 10.0.0.2.49774 > 10.0.0.1.9917: UDP, length 1470
11:22:14.774731 IP 10.0.0.2.49774 > 10.0.0.1.9917: UDP, length 1470^C

999 packets captured
1831 packets received by filter
795 packets dropped by kernel


I'm not sure what's wrong with my configuration. Any help would be appreciated.

Thanks,
/Aravind
