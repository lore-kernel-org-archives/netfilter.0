From: Tish Best <tish.best@wichita.edu>
Subject: Expanation needed for Connection Tracking with NAT One-Way
Date: Tue, 08 Jun 2004 22:01:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40C3B3E9@webmail.wichita.edu>
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

I am trying to test some research ideas and am not able to perform NAT 
translation on incoming packets only.  I am trying to explain why, and am 
looking for a confirmation (or correction) of what I think is happening.  I 
have two Routers (B and C) in my network.  I am trying to send packets 
directly from A to D through B, but route the replies through C and B using 
NAT translation.

                  D
                 /  \
                /    \
         A --- B ---- C

The gateway route of Host D is to Router C.  Router C has the following 
iptables entries in the NAT PREROUTING and NAT POSTROUTING table.

iptables -t nat -A PREROUTING -s D -d A -j DNAT --to B
iptables -t nat -A POSTROUTING -s D -d B -j SNAT --to C

Router B has the following entries in its iptables NAT PREROUTING and 
POSTROUTING tables.

iptables -t nat -A PREROUTING -s C -d B -j LOG
iptables -t nat -A PREROUTING -s C -d B -j DNAT --to A
iptables -t nat -A POSTROUTING -s C -d A -j LOG
iptables -t nat -A POSTROUTING -s C -d A -j SNAT --to D

I am able to see the first TCP SYN packet travel from A through B to D.  At 
this point Router B has an ip_conntrack entry from A to D.  I then see the 
reply travel from D to C.  C successfully performs NAT translation, and the 
packet is sent to Router B with a source of C and a destination of B.  I added 
logging to the iptables entries in Router B, and I see the packet get 
translated in both the PREROUTING and the POSTROUTING tables, but the packet 
is never sent.  I never see a new conntrack entry for this packet.

I think that Router B is dropping the packet through connection tracking since 
it cannot add a new conntrack entry for this packet because it already has an 
entry for packets from A to D that do not require NAT translation.  If it 
added a new entry, then it would not know whether to translate the next packet 
from A to D or send it directly to D.

Is this analysis correct?  Is there anyway to send packets directly to D and 
router them back to A through C and B using NAT translation the way I have 
described using iptables or otherwise?  Any explanation on what criteria 
connection tracking uses to drop packets in this case would be a great help.

Thanks,
Tish Best


