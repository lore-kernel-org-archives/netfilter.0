From: Andrei Ivanov <andrei.ivanov@ines.ro>
Subject: 0x62 revisited
Date: Thu, 26 Sep 2002 20:12:25 +0300 (EEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33L2.0209261920190.11715-100000@webdev.ines.ro>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hello again,
As I see from the logs, iptables splits the 8 bit TOS field into
2 fields, 4 bit wide, precedence (0x60 in precedence) and tos (0x02).

Sep 26 19:56:20 webdev kernel: firewall: IN=eth1 OUT=
MAC=00:00:21:ee:b7:11:00:02:44:18:f0:88:08:00 SRC=204.152.189.116
DST=194.105.18.49 LEN=52 TOS=0x02 PREC=0x60 TTL=48 ID=54596 DF PROTO=TCP
SPT=21 DPT=39388 WINDOW=5792 RES=0x00 ACK FIN URGP=0

So I tried matching packets with tos 0x02:
iptables -A INPUT -i eth1 -m tos --tos 0x02 -j LOG --log-level debug
--log-prefix "TOS: 0x02: "

But this doesn't want to match the packets... :(
Then I read about DSCP, so I tried with that.
It seems DSCP splits the formerly TOS field in 2,
the actual DSCP field, 6 bit wide, and the remaining 2 bits are unused.
This means that the DSCP value would be 0x18, so:

iptables -A tos_match -i eth1 -m dscp --dscp 0x18 -j LOG --log-level debug
--log-prefix "DSCP 0x18: "

really WORKS.

But the 2 remaining bits' value would be 0x02, so I wanted to match them
too:
iptables -A tos_match -i eth1 -m dscp --dscp 0x18 -m tos --tos 0x02 -j LOG
--log-level debug --log-prefix "TOS: 0x62: "

but this doesn't work...

Please tell me, what can I do ?
Does anything I've done untill now make any sense ?


