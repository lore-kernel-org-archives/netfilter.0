From: "per j" <perj8@hotmail.com>
Subject: ipt_recent 0.2.3/0.2.7 --rttl doesn't work
Date: Tue, 04 Feb 2003 17:35:08 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F126VMq7zIrWIK5mSxt0000b87d@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

--rttl function in ipt_recent doesn't work.  It's supposed to match every 
single packet with the same ip address and ttl value.  Wierd thing is it 
produces a match maybe once every 1000 packets with the same ip address and 
ttl.

I get the same ip address with the same TTL value in the logs.  I've also 
tested this by using another computer with a stable connection (ie. same ip 
address and same ttl).  -m recent with --rttl doesn't match any of the 
packets from that computer, but -m recent without --rttl matches.

I upgraded to ipt_recent 0.2.7 from 0.2.3 and the problem is not solved.  
Can you post a fix?

I'm using vanilla kernel 2.0.43 with patches from patch-o-matic CVS 
(Jan24,2003), openmosix, super-freeS/WAN, ipt_recent 0.2.7 
(ipt_recent-0.2.6.tar.gz).  And netfilter stuff all built as modules.

Already applied: submitted/01_2.4.19
                 submitted/02_2.4.20
                 base/iplimit
                 base/mport
                 base/nth
                 base/quota
                 base/random
                 base/time
                 base/TTL
                 extra/h323-conntrack-nat
                 extra/ipt_TARPIT
                 extra/mms-conntrack-nat
                 extra/recent

I've also removed ipt_TTL from all chains in my iptables and it had no 
effect.

Here are the rules in my iptables 1.2.7a:
INPUT chain (default DROP):
-j ACCEPT -i ppp0 --state ESTABLISHED,RELATED
-j DROP -i ppp0 -m recent --update --rttl --name recentDropBox
-j LOG -i ppp0 --log-prefix recentDropBox -m limit
-j DROP -i ppp0 -m recent --set --name recentDropBox


I attempt to telnet to port 137 on this box from a computer on the internet 
(ppp0) and I see in /var/log/messages:
Feb  4 12:16:11 router kernel: recentDropBoxIN=ppp0 OUT= MAC= 
SRC=24.238.110.10
DST=24.239.135.221 LEN=48 TOS=0x00 PREC=0x00 TTL=122 ID=10436 DF PROTO=TCP 
SPT=3
936 DPT=137 WINDOW=8760 RES=0x00 SYN URGP=0
Feb  4 12:16:14 router kernel: recentDropBoxIN=ppp0 OUT= MAC= 
SRC=24.238.110.10
DST=24.239.135.221 LEN=48 TOS=0x00 PREC=0x00 TTL=122 ID=10443 DF PROTO=TCP 
SPT=3
936 DPT=137 WINDOW=8760 RES=0x00 SYN URGP=0

_________________________________________________________________
STOP MORE SPAM with the new MSN 8 and get 2 months FREE*  
http://join.msn.com/?page=features/junkmail


