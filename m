From: Steve <steve@sheddy.net>
Subject: Broken fwmark
Date: Sun, 2 Jun 2002 23:23:04 +0100 (BST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206022311320.10014-100000@shaun.sheddy.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Hi,

I've had watermark routing working fine for sometime. However, recently it
has stopped working and I'm not having much luck getting it to function
again. The machine has gone through several kernel revisions and has had
an additional network card fitted (PCNet32 based) and I'm not exactly sure
when fwmark ceased to work.

I've written a small script which shows that the packets are getting
watermarked but the replies are losing the mark. In the example below I
am pinging (from another machine) an IP bound to eth2 on the machine
itself.

N.B rp_filter is switched off.

If anyone can suggest what might cause fwmark to break in this way I'd be
very grateful,

Steve

-----

#!/bin/bash
ipt="/sbin/iptables"
LOG="-j LOG --log-level crit --log-prefix "
$ipt -t mangle -F
$ipt -t nat -F
$ipt -A PREROUTING  -t mangle -i eth2 --proto icmp -j MARK --set-mark 1

$ipt -A POSTROUTING -t mangle -m mark --mark 1 $LOG "POST SET "
$ipt -A PREROUTING  -t mangle -m mark --mark 1 $LOG "PRE SET "
$ipt -A OUTPUT      -t mangle -m mark --mark 1 $LOG "OP SET "
$ipt -A INPUT       -t mangle -m mark --mark 1 $LOG "IP SET "
$ipt -A FORWARD     -t mangle -m mark --mark 1 $LOG "FWD SET "

$ipt -A POSTROUTING -t mangle --proto icmp -m mark ! --mark 1 $LOG "POST
UNSET "
$ipt -A PREROUTING  -t mangle --proto icmp -m mark ! --mark 1 $LOG "PRE
UNSET "
$ipt -A OUTPUT      -t mangle --proto icmp -m mark ! --mark 1 $LOG "OP
UNSET "
$ipt -A INPUT       -t mangle --proto icmp -m mark ! --mark 1 $LOG "IP
UNSET "
$ipt -A FORWARD     -t mangle --proto icmp -m mark ! --mark 1 $LOG "FWD
UNSET "


Jun  2 22:52:32 kernel: PRE SET    IN=eth2 OUT= MAC=xx SRC=1.2.3.4
DST=4.3.2.1 LEN=84 TOS=0x00 PREC=0x00 TTL=55  ID=28633 PROTO=ICMP TYPE=8
CODE=0 ID=65293 SEQ=0
Jun  2 22:52:32 kernel: IP SET     IN=eth2 OUT= MAC=xx SRC=1.2.3.4
DST=4.3.2.1 LEN=84 TOS=0x00 PREC=0x00 TTL=55  ID=28633 PROTO=ICMP TYPE=8
CODE=0 ID=65293 SEQ=0
Jun  2 22:52:32 kernel: OP UNSET   IN=     OUT=eth2    SRC=4.3.2.1
DST=1.2.3.4 LEN=84 TOS=0x00 PREC=0x00 TTL=255 ID=53296 PROTO=ICMP TYPE=0
CODE=0 ID=65293 SEQ=0
Jun  2 22:52:32 kernel: POST UNSET IN=     OUT=eth2    SRC=4.3.2.1
DST=1.2.3.4 LEN=84 TOS=0x00 PREC=0x00 TTL=255 ID=53296 PROTO=ICMP TYPE=0
CODE=0 ID=65293 SEQ=0


$ uname -a
Linux 2.4.18 #1 Sun Jun 2 15:56:26 BST 2002 i586 unknown
$ iptables -V
iptables v1.2.6a
$ ip -V
ip utility, iproute2-ss010824


