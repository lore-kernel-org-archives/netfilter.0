From: Jihoon Chung <difro@sexycoder.com>
Subject: icmp echo packets not masqueraded properly.
Date: Tue, 18 Mar 2003 16:32:01 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030318073201.GA7700@morpheus>
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


I have two lines goint out to internet from the firewall machine.
One is adsl (say, ppp0) and the other is cable modem (eth1).
My notebook is connected to eth2 and is running Windows 2000.

I use ppp0 as primary line and cable modem as backup.
So when ppp0 is connected , 'ip route show | tail -1' shows the following,

default via 1.1.1.1 dev ppp0

and when ppp0 goes down, 'ip route show | tail -1' show the following.

default via 2.2.2.2 dev eth1

(I've written a small daemon which detects status of ppp0 and changes to
 default route accordingly, and this calls 'ip route flush cache'
 everytime it changeds routes)

And the Masquerading rule is:
`iptables -t filter -A FORWARD -j MASQUERADE`;

The problem occurs when I'm pinging from the notebook (host inside the
firewall) to any host outside the firewall. 

When ppp0 dies and the default-route gets changed to eth1 while pinging
from the notebook,  the ping session is still masqueraded to ppp0's ip
address !! ,  even though the packets are routed through eth1.
(I found this by tcpdumping on eth1)

If I stop the ping on the notebook and wait 30 seconds and ping again, 
it behaves fine.

Is there anyway I can make it behave without "stop-wait30sec" ?

(by the way , I searched in /proc and tried turning on
 /proc/sys/net/ipv4/ip_dynaddr , but nothing changed.)


