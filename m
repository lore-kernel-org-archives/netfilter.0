From: Rowan Reid <rreid@studio3arc.com>
Subject: Internal ip exiting network on firewall external nic despight rule
Date: Fri, 20 Sep 2002 11:37:02 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000501c260d4$b650ff50$0801a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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


I'm not sure I understand this data that I'm getting from my firewall.
If I understand it correctly it's saying that a machine from my local
net is going out through my external Interface.  I have a rule which
should drop all internal network request that appear at the external
nic. Any help would be appreciated.

RULE ####
# remote interface, claiming to be local machines, IP spoofing, get lost
#
$IPTABLES -A INPUT -i $EXTIF -s $INTNET -d $UNIVERSE -j drop-and-log-it

CONFIG ###
s3a-www:~ # firewall mlist
  External Interface:  eth1
  Internal Interface:  eth0
  ---
  External IP: **.**.76.66
  ---
  Internal Network: 192.168.1.0/24
  Internal IP:      192.168.1.1



LOG FILE ###
Sep 20 04:04:01 s3a-www kernel: IN=eth1 OUT=eth1 SRC=192.168.1.105
DST=216.99.233.76 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=61116 DF
PROTO=TCP SPT=4380 DPT=110 WI
NDOW=8760 RES=0x00 ACK URGP=0
 
Rowan Reid
Job Captain, 
Systems Administrator
STUDIO 3 ARCHITECTS
909  982  1717


