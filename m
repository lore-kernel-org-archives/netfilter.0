From: "Storm D. J. Petersen" <stormp@telus.net>
Subject: linux-2.4.20 iptables-1.2.7a  DHCP on EXTIF
Date: Thu, 20 Feb 2003 19:48:09 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LKEMIKEDGPBEAFDKINCGGEMLDGAA.stormp@telus.net>
References: <20030220232634.10560.24106.Mailman@kashyyyk>
Reply-To: <stormp@telus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030220232634.10560.24106.Mailman@kashyyyk>
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


Hi,

I am still confused. ;-)

I upgraded my kernel to 2.4.20 and now  # iptables -t nat -A POSTROUTING -o
eth0 -j MASQUERADE  doesn't work.

However,  # iptables -t nat -A POSTROUTING -j SNAT -to $EXTIP    works!

My problem is that I am behind a cable modem that changes my IP address
daily.  So, what does one do if their eternal interface uses DHCP?
Thanks.
S.



