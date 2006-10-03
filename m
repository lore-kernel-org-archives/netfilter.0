From: David Fletcher <mlist@c2h2.net>
Subject: GRE tunnel bound to bridged interface
Date: Tue, 03 Oct 2006 08:28:44 -0700
Message-ID: <452281AC.7040809@c2h2.net>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I have a very specific repeatable issue with a gre tunnel bound to a 
bridged interface.

Tunnel "tgre0" is bound to a source address on "br1"

tuxnix ~ # ip tunnel show tgre0
tgre0: gre/ip  remote 72.25.98.XXX  local 12.106.79.YYY  ttl 64

tuxnix ~ # brctl show
bridge name     bridge id               STP enabled     interfaces
br1             8000.000b824a311c       no              eth1
                                                         eth2
br0             8000.00065b6f4c82       no              eth0
                                                         eth3
                                                         eth4
br2             8000.00022acb474a       no              eth5

The tunnel is built on br1.

When i disable the bridge and put the 12.106.79.YYY address on the 
physical interface, this is what I see in the firewall debug:

Oct  3 07:55:02 tuxnix Shorewall:vpn2loc:ACCEPT:IN=tgre0 OUT=br2 
PHYSOUT=eth5 SRC=10.2.1.6 DST=10.2.2.30 LEN=84 TOS=0x00 PREC=0x00 TTL=62 
ID=19 DF PROTO=ICMP TYPE=8 CODE=0 ID=22904 SEQ=20

This is the correct output - the packet is shown as coming IN on tgre0.

When i reenable the bridge and look at the same output:

Oct  2 23:03:47 tuxnix Shorewall:net2loc:ACCEPT:IN=br1 OUT=br2 
PHYSIN=eth1 PHYSOUT=eth5 SRC=10.2.1.6 DST=10.2.2.30 LEN=100 TOS=0x00 
PREC=0x00 TTL=62 ID=625 PROTO=ICMP TYPE=8 CODE=0 ID=59 SEQ=3


As you can see, the input interface is incorrect. This is causing 
numerous issues (Shorewall detecting the wrong zone due to wrong source 
interface, masquerading failing because of wrong source interface) etc 
etc etc, so i really need to get this fixed.


Any help would be much appreciated

Current kernel:
tuxnix ~ # uname -a
Linux tuxnix 2.6.14-rc1 #4 PREEMPT Thu Sep 28 16:38:03 PDT 2006 i686 
Pentium III (Coppermine) GenuineIntel GNU/Linux

I have also tried 2.6.18 to see if that would resolve this issue. It did 
not.

tuxnix ~ # iptables -V
iptables v1.3.5

Bridge utils version: net-misc/bridge-utils-1.0.6-r3

--David
mlist@c2h2.net






