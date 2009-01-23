From: Karel Rericha <karel@maxtel.cz>
Subject: tc filter - marks equals classids
Date: Fri, 23 Jan 2009 10:58:20 +0100
Message-ID: <5b19ed110901230158s4af2ffr5c2b61ce441c6d85@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

we have about 20 000 classes, we mark packets with iptables and we use
marks and classids which match each other (for example mark 0x2064 is
directed via tc filter rule to class 1:0x2064), so we have about 20
000 filters too. I have read somewhere (probably on docum.org) that is
it possible to write filter without specifying handle and classid, and
such filter will direct packets to classes by their marks.

So rule:

tc filter add dev eth0 protocol ip parent 1:0 prio 1 fw

would direct packets marked as 0x1666 to class 1:0x1666, packets
marked with 0x1667 to class 1:0x1667 and so on.

When I create needed classes (test):

tc qdisc add dev eth0 root handle 1: htb
tc class add dev eth0 parent 1: classid 1:1 htb rate 100000kbit

I can run above tc filter command without problems. But here strange
things begin. Regardless mentioned tc filter run or not

tc -s filter ls dev eth0

always shows on first row

filter parent 1: protocol ip pref 1 fw

But when I run

tc filter del dev eth0 protocol ip parent 1:0 prio 1 fw

this row dissapears. I would like to know if it is possible to use
such tc filter for all marks, and why there is such strange behaviour
when listing filters.

System is dual dualcore Opteron running latest Gentoo x86-64 with
kernel 2.6.27-r8, iproute2 2.6.22.20070710 and iptables 1.4.0-r1.

Karel
