From: Martin Metzker <martinmetzker@gmx.net>
Subject: change destination port
Date: Wed, 23 Aug 2006 22:39:07 +0200
Message-ID: <44ECBCEB.3080700@gmx.net>
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

hello world!

i need to modify the dport of a locally generated packet.
i want an ipsec tunnel between my router here (dynamic ip) and a box 
behind a cisco pix firewall (static ip). the problem is that the pix is 
an ipsec endpoint as well so forwarding port 500 on the pix is a bad 
idea. the nat traversal option only encapsulates esp packets so i have 
to make ike work by myself.
the idea is to change the dport from 500 to some other port, say 2000. 
as far as i can tell openswan does not support that, so i was/am hoping 
i can use iptables to change the dport on packets leaving my box with 
destination X.X.X.X.

iptables -A OUTPUT -t nat -p tcp -d X.X.X.X --dport 500 -J DNAT 
--to-destination X.X.X.X:2000
doesn't do the trick. in fact locally generated outbound ike packets 
don't seem to care about OUTPUT on table nat. the postrouting chain does 
not support target DNAT so i'm about to believe i can't do it.

this mailing list is sort of my last hope. if i can't find help here i 
might have to start cross compiling :-(

thanks in advance

martin

