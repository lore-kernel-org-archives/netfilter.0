From: Valentijn Sessink <linux-kernel-MTA3NDA5NjA5Nwo@mail.v.sessink.nl>
Subject: port based filtering and IPsec 2.6
Date: Wed, 14 Jan 2004 17:26:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040114162623.GR4106@openoffice.nl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello list,

https://lists.netfilter.org/pipermail/netfilter/2003-July/045710.html and
following discuss port based filtering and IPsec, AKA 
http://www.ussg.iu.edu/hypermail/linux/kernel/0308.2/1132.html

The issue: if you have a host-to-host connection and you try to use iptables
to filter, you'll see only ESP packets in the INPUT chain. Those are of no
use, as the content (and ports and the like) are all hidden. FreeS/WAN
doesn't have this problem, as it uses a separate dummy interface that
handles the unencrypted packets.

Now there seems a solution that is a bit of a hack, but it does work. Simply
use a *tunnel* between the two hosts, and define the subnets to be
"tunneled" to be the hosts themselves, like so:

add $foo $bar esp 0xf00 -m tunnel   
        -E 3des-cbc $secret1 -A hmac-md5 $secret2; 
spdadd $foo $bar any -P out ipsec
        esp/tunnel/$here-$distant/require;
add $bar $foo esp 0xf01 -m tunnel
	-E 3des-cbc $secret3 -A hmac-md5 $secret4;
spdadd $bar $foo any -P in ipsec
	esp/tunnel/$bar-$foo/require;

Now you'll find double logs from each packet, like so:

$foo:~# iptables -A INPUT -s $bar -j LOG
... to my surprise tells me things like:
Jan 14 14:43:08 $foo kernel: IN=eth1 OUT=
MAC=52:54:05:e5:de:c9:00:02:fd:39:8f:13:08:00 SRC=bar
DST=foo LEN=112 TOS=0x00 PREC=0x00 TTL=54 ID=0 DF PROTO=ESP SPI=0x302
Jan 14 14:43:08 $foo kernel: IN=eth1 OUT=
MAC=52:54:05:e5:de:c9:00:02:fd:39:8f:13:08:00 SRC=bar
DST=foo LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP
SPT=22 DPT=1028 WINDOW=5792 RES=0x00 ACK SYN URGP=0  

I'm not exactly sure what are drawbacks here (if any). I saw comments by
Bruce Schneier http://www.schneier.com/paper-ipsec.html, recommending the
eliminiation of transport mode anyway, but I'm not sure if this is still
debated. So use at your own risk.

Valentijn
-- 
http://www.openoffice.nl/   Open Office - Linux Office Solutions
Valentijn Sessink  valentyn+sessink@nospam.openoffice.nl

