From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: htb + prio trouble
Date: Sun, 20 Nov 2011 12:44:46 -0600
Message-ID: <op.v49c0wstx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: netfilter@vger.kernel.org

Hello All,

While configuring a load-balancing router, I have run into trouble setting up traffic shaping (at least the load-balancing is working!)

I am trying to:
(1) limit total upload speed to somewhat below the interface bandwidth
(2) do some traffic shaping, particularly avoid queuing of VOIP packets.

To accomplish this I am trying to create a HTB qdisc on each outward-facing interface, each containing a PRIO qdisc with the default 3 classes.  sfq qdiscs are created for each PRIO class.

Commands to set up qdiscs and filters for outward-facing interface eth0:

+ tc qdisc del dev eth0 root handle 1
+ tc qdisc del dev eth0 ingress
+ tc qdisc add dev eth0 root handle 1:0 htb
+ tc class add dev eth0 parent 1:0 classid 1:1 htb rate 3200kbit ceil 3200kbit
+ tc qdisc add dev eth0 parent 1:1 handle 2: prio
+ tc qdisc add dev eth0 parent 2:1 handle 10: sfq perturb 10 limit 3000
+ tc qdisc add dev eth0 parent 2:2 handle 20: sfq perturb 10
+ tc qdisc add dev eth0 parent 2:3 handle 30: sfq perturb 10
+ tc filter add dev eth0 protocol ip parent 2: prio 1 u32 match ip dport 5060 0xffff flowid 2:1
+ tc filter add dev eth0 protocol ip parent 2: prio 1 u32 match ip sport 5060 0xffff flowid 2:1
+ tc filter add dev eth0 protocol ip parent 2: prio 1 u32 match ip dport 53 0xffff flowid 2:1
+ tc filter add dev eth0 protocol ip parent 2: prio 1 u32 match ip dport 80 0xffff flowid 2:1
+ tc filter add dev eth0 protocol ip parent 2: prio 1 u32 match ip dport 22 0xffff flowid 2:1
+ tc filter add dev eth0 protocol ip parent 2: prio 1 u32 match ip dport 23 0xffff flowid 2:1
+ tc filter add dev eth0 parent 2: protocol ip prio 10 u32 match ip protocol 6 0xff match u8 0x05 0x0f at 0 match u16 0x0000 0xffc0 at 2 match u8 0x10 0xff at 33 flowid 2:1
+ tc qdisc add dev eth0 handle ffff: ingress
+ tc filter add dev eth0 parent ffff: protocol ip prio 50 u32 match ip src 0.0.0.0/0 police rate 450kbit burst 200k drop flowid :1

The port 80 filter is a test to try to send all http traffic out band one of the PRIO qdisc (not working).  Port 5060 is supposed to be used by VOIP, sip protocol.

After generating some http traffic, I see only traffic on the htb, none on the prio bands:

root@debiandesk2:/home/lloyd/data/traffic_shaping# tc -s qdisc ls dev eth0
qdisc htb 1: root refcnt 2 r2q 10 default 0 direct_packets_stat 505
  Sent 40762 bytes 505 pkt (dropped 0, overlimits 0 requeues 0)
  rate 0bit 0pps backlog 0b 0p requeues 0
qdisc prio 2: parent 1:1 bands 3 priomap  1 2 2 2 1 2 0 0 1 1 1 1 1 1 1 1
  Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
  rate 0bit 0pps backlog 0b 0p requeues 0
qdisc sfq 10: parent 2:1 limit 127p quantum 1514b perturb 10sec
  Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
  rate 0bit 0pps backlog 0b 0p requeues 0
qdisc sfq 20: parent 2:2 limit 127p quantum 1514b perturb 10sec
  Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
  rate 0bit 0pps backlog 0b 0p requeues 0
qdisc sfq 30: parent 2:3 limit 127p quantum 1514b perturb 10sec
  Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
  rate 0bit 0pps backlog 0b 0p requeues 0
qdisc ingress ffff: parent ffff:fff1 ----------------
  Sent 975037 bytes 720 pkt (dropped 140, overlimits 0 requeues 0)
  rate 0bit 0pps backlog 0b 0p requeues 0


Comments are much appreciated.
--
Lloyd
