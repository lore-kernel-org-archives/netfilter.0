From: Frans Luteijn <f.a.g.luteijn@knoware.nl>
Subject: nat problem
Date: Mon, 05 Jul 2004 18:33:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40E982F0.309A28A3@knoware.nl>
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

Dear Sirs,

I have a little problem, which might be a bug. I have an 3COM
ISDN-router. It broadcasts every 10 seconds its connectionstatus to the
internal net. Now I want to forward those broadcasts to another network.
This is the situation:


+------+    +--------+    +--------+
|ISDN- |    |        |    |Internal|
|router|----|firewall|----|network |
+------+    |        |    +--------+
            +--------+
                |
                |
                |
            +------+
            |ADSL- |
            |router|
            +------+


The ISDN-router has 192.168.1.1/24, the ADSL-router has 172.19.3.1/16,
the firewall has at eth0 192.168.1.4, at eth1 172.19.3.2 and at eth2
192.168.2.1. The internal network is 192.168.2.0/24.

The firewall is a Debian-Linux with a 2.4.26 kernel with Nat enabled.

After reading of all the nesesary HOWTO's, I decided that that
forwarding should be done with prerouting. To know what I have to
forward, I have to know what the packets are. I turned logging on for
that interface, and if I can log the packets, I can also manipulate
them.
So I typed:

iptables -t nat -A PREROUTING -i eth0 -j LOG

and waited for the packets to come by. But nothing happened. Althought I
could see some other packets coming in. From my log:

Jul  2 16:38:16 firewall kernel: IN=eth0 OUT=
MAC=ff:ff:ff:ff:ff:ff:00:50:04:0e:d9:00:08:00 SRC=192.168.1.3
DST=192.168.1.255 LEN=240 TOS=0x00 PREC=0x00 TTL=32 ID=19499 PROTO=UDP
SPT=138 DPT=138 LEN=220
Jul  2 16:43:40 firewall kernel: IN=eth0 OUT=
MAC=ff:ff:ff:ff:ff:ff:00:50:04:0e:d9:00:08:00 SRC=192.168.1.3
DST=192.168.1.255 LEN=240 TOS=0x00 PREC=0x00 TTL=32 ID=19755 PROTO=UDP
SPT=138 DPT=138 LEN=220

Those are from a machine that will be moved to my internal network

Then I typed:

iptables -A INPUT -i eth0 -j LOG

and there were the packets:

Jul  2 16:47:43 firewall kernel: IN=eth0 OUT=
MAC=ff:ff:ff:ff:ff:ff:08:00:4e:a6:f5:74:08:00 SRC=192.168.1.1
DST=192.168.1.255 LEN=116 TOS=0x00 PREC=0x00 TTL=64 ID=48404 PROTO=UDP
SPT=1025 DPT=2071 LEN=96
Jul  2 16:47:53 firewall kernel: IN=eth0 OUT=
MAC=ff:ff:ff:ff:ff:ff:08:00:4e:a6:f5:74:08:00 SRC=192.168.1.1
DST=192.168.1.255 LEN=116 TOS=0x00 PREC=0x00 TTL=64 ID=48405 PROTO=UDP
SPT=1025 DPT=2071 LEN=96
Jul  2 16:48:03 firewall kernel: IN=eth0 OUT=
MAC=ff:ff:ff:ff:ff:ff:08:00:4e:a6:f5:74:08:00 SRC=192.168.1.1
DST=192.168.1.255 LEN=116 TOS=0x00 PREC=0x00 TTL=64 ID=48406 PROTO=UDP
SPT=1025 DPT=2071 LEN=96

In /proc/net/ip_conntrack I can see:

udp      17 27 src=192.168.1.3 dst=192.168.1.255 sport=138 dport=138
[UNREPLIED] src=192.168.1.255 dst=192.168.1.3 sport=138 dport=138 use=1
udp      17 20 src=192.168.1.1 dst=192.168.1.255 sport=1025 dport=2071
[UNREPLIED] src=192.168.1.255 dst=192.168.1.1 sport=2071 dport=1025
use=1
.......


Now are my questions:
am I doing something wrong, e.g. shouldn't it be prerouting;
can't it be done, because of the sourceport and the destport are
different;
is it a bug in the nat-software or is it intended to work that way?

If you need some extra information, I am happily to provide it.

Yours Sincerely,
--
Frans Luteijn
PGP PblKey fprnt=C4 87 CE AF BC B6 98 C1  EF 42 A1 9A E2 C0 42 5B




