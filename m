From: vaida bogdan <vaida.bogdan@gmail.com>
Subject: prerouting and postrouting + clamav + clamsmtpd
Date: Sat, 19 Feb 2005 14:54:34 +0200
Message-ID: <12848a3b050219045423ee8992@mail.gmail.com>
Reply-To: vaida bogdan <vaida.bogdan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

My network design looks like this:

WIN1
WIN2    -    GW1    -   MAIL SERVER    -   GW2
WIN3

GW1 iptable rules:
PREROUTING
REDIRECT   tcp  --  eth0:1/24  MAIL_SERVER     tcp dpt:smtp redir ports 10025
POSTROUTING
SNAT       all  --  eth0:1/24  anywhere       to:eth0



WIN are on the internal network, GW1 does SNAT. I've had a lot of
virii problems on the internal network but MAIL SERVER logs show the
GW1 ip. I installed clamav+clamsmtpd and added the PREROUTING rule.
The problem is I don't get connections on localhost:10025. I can't
access the internal network (WIN) to telnet and check why. Does the
current firewall configuration have any flaw? I added the PREROUTING
rule to pass any traffic to the MAIL_SERVER through clamsmtpd for
scanning.

