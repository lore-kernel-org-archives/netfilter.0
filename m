From: Karel Rericha <karel@maxtel.cz>
Subject: "tc filter add dev bond0 parent 1: protocol ip fw" does not work
Date: Wed, 5 Aug 2009 14:49:35 +0200
Message-ID: <5b19ed110908050549u37e1fca0tb3bd0b4e08df65f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello list,

command

"tc filter add dev bond0 parent 1: protocol ip fw"

is AFAIK supposed to filter packets marked with <number> to classid
1:<number>, which would effectively replace thousands of filters in
our case. But it doesnt work on newer kernels as discussed here:

http://forum.soft32.com/linux/tc-filter-fw-26-problem-ftopict469017.htm=
l
http://groups.google.com/group/linux.debian.bugs.dist/browse_thread/thr=
ead/14843edac6598f84

When I tried to add this filter very strange things happen:

***********************************************************************=
****************************************************
router ~ # tc qdisc add dev bond0 root handle 1:0 htb
router ~ # tc filter add dev bond0 parent 1: protocol ip prio 1 fw
RTNETLINK answers: Invalid argument
We have an error talking to the kernel
router ~ # tc filter ls dev bond0
router ~ # tc filter add dev bond0 parent 1: protocol ip prio 1 handle
1 fw flowid 1:
router ~ # tc filter ls dev bond0
filter parent 1: protocol ip pref 1 fw
=A0 =A0 =A0 =A0 =A0 =A0# WHAT IS THIS ?
filter parent 1: protocol ip pref 1 fw handle 0x1 classid 1:
router ~ # tc filter del dev bond0 parent 1: protocol ip prio 1 handle
1 fw flowid 1:
router ~ # tc filter ls dev bond0
filter parent 1: protocol ip pref 1 fw
=A0 =A0 =A0 =A0 =A0 =A0# AFTER ADD AND DEL THIS REMAINS
router ~ # tc filter del dev bond0 parent 1: protocol ip prio 1 fw
# YOU CAN DEL BUT NOT ADD ?
router ~ # tc filter ls dev bond0
***********************************************************************=
*****************************************************

Does anyone know what is happening here ? Is generic filter as shown
in links abadoned or simply not working ?

My system is Gentoo AMD64 on dual dualcore Opterons 2214, kernel
2.6.30-r4. We shape about 20 000 pps and use bonding and affinity to
load balance ingress and egress between cores. But bonding is not
relevant here because I obtained same results on different machine
with Core 2 Duo and eth0 only.

Thanks, Karel
