From: Arindam Haldar <arindamhaldar@inbox.lv>
Subject: will this enhance peformace ?
Date: Fri, 07 Jun 2002 16:42:41 +0530
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D009529.6010009@inbox.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

hi all,
have anyone tried changing the tcp setting in the source files ? for eg

decreasing the TCP_KEEPALIVE_TIME from 2 hours to say 10 min --> 
(120*60*HZ) to (10*60*HZ) in include/net/tcp.h ??
changing the parameters in static unsigned long tcp_timeouts[] in 
net/ipv4/netfilter/ip_conntrack_proto_tcp.c from 5 DAYS to 4 HOURS or 
from 30 MIN to 10 MIN or both ???

will that change tcp keep alive or packets in conntrack in any way ??.. 
sorry for being too basic but am trying to think how it can help better 
my iptables/iproute firewal/bandwidth on my pc !

thankiing in advance
A.H


