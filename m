From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: firewall problem continued
Date: Mon, 9 Aug 2004 04:12:16 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040809081216.GA12643@tranquility.scriptkitchen.com>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

Hi,
I am rephrasing my last question with better words and more information.
My firewall config (simple) is kept at,
http://payal.staticky.com/tables.txt

My problem is simple I have a DMZ machine where mail server is hosted.
Its apache (needed for webmail) can be accessed from outside world by
http://<ext IP>. But if I give http://<ext IP> from a LAN machine I cannot
access it. Upon further investigation I found that port 25 and 110 can be
accessed from LAN but not from the gateway (firewall) machine. Therefore,
since this machine is also a simple squid proxy to LAN, I cannot access
webmail thru' LAN. Now, if someone can help me in access those services 
from the firewall machine itself, it will be great.
I have blocked access to port 80 -d 0/0 from LAN and allow access
only through squid.

If you need more information, do tell.

Waiting eagerly for any inputs.
With warm regards,
-Payal

