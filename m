From: gfzhang@njnu.edu.cn (gfzhang)
Subject: ip_conntrack_max table full
Date: Mon, 28 Apr 2003 21:00:14 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030428130014.M2389@pine.njnu.edu.cn>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


i'm using iptables as NAT svr to my UNIV. my system is:
   2*xeron 2.4GHZ
   2GB   mem

after some time about a day I found that there is logging 
messege on my screen like this :
    Ip_conntrack table full drop pack
   tones of such messages and all of the LAN user can't get
access to internet.

cat  /proc/sys/net/ipv4/ip_conntrack_max 
 65536

when I cat /proc/net/ip_conntrack I found 
a lot of dead transformed items the TIMEOUT is about 5days
obviously nobody is using my box but such items will last 
for a long time before I reboot my box!
how can i flush them?

in ip_conntrack_proto.c 
I found the default timeout is 5DAYS

I don't think it's necessary for me to maintain a tranform 
for so long .
   maybe I should change the default TIMEOUT TO 1DAY
   anybody can help me to deal with it?

   thanks in advance.





