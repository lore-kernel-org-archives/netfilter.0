From: Aleksandar Milivojevic <alex@milivojevic.org>
Subject: ipsec + nat
Date: Wed, 03 Aug 2005 16:12:33 -0500
Message-ID: <20050803161233.564n1ykio08k800s@www.milivojevic.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

I have a set of rules in filter table, that after some cleanup look something
like this:

-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A INPUT -p esp -s 4.3.2.1 -d 1.2.3.4 -j ACCEPT
-A INPUT -j LOG --log-prefix "INPUT "

-A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A OUTPUT -p esp -s 1.2.3.4 -d 4.3.2.1 -j ACCEPT
-A OUTPUT -j LOG --log-prefix "OUTPUT "

-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -p icmp --icmp-type ping -s 10.1.2.3 -d 10.3.2.1 -m state --state NEW
-j ACCEPT
-A FORWARD -j LOG --log-prefix "FORWARD "

So far so good.  I can ping 10.3.2.1 from 10.1.2.3 over my IPSec tunnel.

However, if I add MASQUERADE target into nat table:

-A POSTROUTING -o ppp0 -j MASQUERADE

and than try to ping 10.3.2.1, things do not work anymore.  Tcpdump on ppp0
shows (edited for clarity):

   IP 1.2.3.4 > 4.3.2.1 ESP
   IP 4.3.2.1 > 1.2.3.4 ESP
   IP 10.3.2.1 > 10.1.2.3 ICMP echo reply

The log files show that the decrypted packet (ICMP echo reply from 10.3.2.1 to
10.1.2.3) was dropped by Netfilter.  So, the IPSec as such works, it was
Netfilter that blocked the returning packet.  Seems as if Netfilter haven't
placed it into ESTABLISHED state, as it does when NAT rule is not present.

Bug in Netfilter, or bug in my configuration?

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.


