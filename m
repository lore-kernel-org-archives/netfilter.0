From: "Richard Hauswald" <richard.hauswald@gmx.de>
Subject: problem matching marked packets in nat PREROUTING chain
Date: Mon, 04 Jun 2007 13:27:04 +0200
Message-ID: <20070604112704.44000@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
To: netfilter@lists.netfilter.org

Hello folks,
i'm trying to do the following:

mangle - PREROUTING : marking packets with 23 containing a string "formula1"
nat_PREROUTING: matching packets marked with 23 and Log them

I used the following commands:
iptables -t mangle -A PREROUTING -m string --string formula1 --algo kmp -j MARK --set-mark 23
iptables -t nat -I PREROUTING -p tcp -m mark --mark 23 -j LOG

For debug purpose i added the following rule to the mangle PREROUTING
iptables -t mangle -A PREROUTING -p tcp -m mark --mark 23 -j LOG

then i send the packets to the network interface and used the following commands to check if the rules are working correctly:
iptables -t mangle -vnL:

Chain PREROUTING (policy ACCEPT 557K packets, 326M bytes)
 pkts bytes target     prot opt in     out     source               destination
    1   482 MARK       0    --  *      *       0.0.0.0/0            0.0.0.0/0           STRING match "formula1" ALGO name kmp TO 65535MARK set 0x17
    1   241 LOG        tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           MARK match 0x17 LOG flags 0 level 4

Chain INPUT (policy ACCEPT 12380 packets, 1786K bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain FORWARD (policy ACCEPT 544K packets, 325M bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 11765 packets, 1841K bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain POSTROUTING (policy ACCEPT 554K packets, 326M bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain PREROUTING (policy ACCEPT 3707 packets, 424K bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 LOG        tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           MARK match 0x17 LOG flags 0 level 4

Chain POSTROUTING (policy ACCEPT 2224 packets, 294K bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 2284 packets, 188K bytes)
 pkts bytes target     prot opt in     out     source               destination


My question is now why doas the rule placed in the mangle matches the mark and the same one in nat doas not?

Thanks a lot,
Richard
-- 
GMX FreeMail: 1 GB Postfach, 5 E-Mail-Adressen, 10 Free SMS.
Alle Infos und kostenlose Anmeldung: http://www.gmx.net/de/go/freemail

