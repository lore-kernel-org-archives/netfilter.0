From: "Storm D. J. Petersen" <stormp@telus.net>
Subject: linux-2.4.20 iptables-1.2.7a  DHCP on EXTIF
Date: Thu, 20 Feb 2003 20:05:03 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LKEMIKEDGPBEAFDKINCGMEMLDGAA.stormp@telus.net>
References: <LKEMIKEDGPBEAFDKINCGGEMLDGAA.stormp@telus.net>
Reply-To: <stormp@telus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <LKEMIKEDGPBEAFDKINCGGEMLDGAA.stormp@telus.net>
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

Whoops should read:

However,  # iptables -t nat -A POSTROUTING -o eth1 -j SNAT -to $EXTIP
works!



-----Original Message-----
From: Storm D. J. Petersen [mailto:stormp@telus.net]
Sent: Thursday, February 20, 2003 7:48 PM
To: netfilter@lists.netfilter.org
Subject: linux-2.4.20 iptables-1.2.7a DHCP on EXTIF
Importance: High


Hi,

I am still confused. ;-)

I upgraded my kernel to 2.4.20 and now  # iptables -t nat -A POSTROUTING -o
eth0 -j MASQUERADE  doesn't work.

However,  # iptables -t nat -A POSTROUTING -j SNAT -to $EXTIP    works!

My problem is that I am behind a cable modem that changes my IP address
daily.  So, what does one do if their eternal interface uses DHCP?
Thanks.
S.



