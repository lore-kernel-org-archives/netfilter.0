From: "Nick" <nicholas@3wsi.net>
Subject: POP3 & FTP Probs...
Date: Tue, 25 Feb 2003 13:22:54 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009a01c2dc96$557d10e0$0f095e3d@stargazer>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Currently I have a gateway for 3 subneted LAN..
At the front of a gateway there is also a Front Firewall,
using proxy arp, which is using Public ip, so the gateway also got
public IP.


Lately the users in LAN can not reach pop3 server, the connection just
hung there after POP3
Greeting then "connection closed by foreign host"...
This also happen with FTP, but worst... it doesn't got any message at
all.

I tried running tcpdump on the front firewall,
when I try to ping some server outside the network ( from LAN )
tcpdump on Front firewall shows activities ( request & reply )

But with pop3 from LAN to outside server, tcpdump shows:
SYN from Gateway, ACK from outside POP3 server...
and it just stop there....

Maybe somebody ever experienced the same ?
May I have some opinion / sugestion from this lists members ?


Thank you.


