From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Redirecting mail
Date: Fri, 8 Apr 2005 14:29:53 -0500
Message-ID: <005301c53c71$5734b450$f5001eac@riverview.office>
References: <003301c53c25$72c951e0$648045ac@sneak>
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
Content-Type: text/plain; charset="us-ascii"
To: Ilo Lorusso <sneak@ipnoc.co.za>, netfilter@lists.netfilter.org

This mail server in question (172.20.128.56), is it just used for sending
email from your internal network out to the world or are you expecting email
from the world to come inbound to it too?  Are you wanting this mail server
to continue using the internet connection that it has for all traffic except
SMTP or are you wanting all outbound traffic to pass through 192.168.16.56?

I would be tempted to use a combination of IPTables and IP routing rules.
Namely I'd do something like the following on the mail server
(172.20.128.56)

iptables -t nat -A OUTPUT -p tcp --sport 25 -j MARK --set-mark $SMTP_Mark
ip route add table $IPRoute2_SMTP_Table 192.168.16.0/24 dev
$DEV_of_internal_network src $IP_of_DEV_of_internal_network
ip route add table $IPRoute2_SMTP_Table default via 192.168.16.56
ip rule add fwmark $SMTP_Mark table $IPRoute2_SMTP_Table

Where:
$SMTP_Mark is the value you want to use to mark the packets that need to use
the alternant route.
$IPRoute2_SMTP_Table is the name as it appears in /etc/iproute2/rt_tables or
the number of the table that you want to use.
$DEV_of_internal_network is the device name of your internal network
interface.
$IP_of_DEV_of_internal_network is the IP address of the device name of your
internal network interface.

This should cause any traffic that leaves the mail server in question to
pass through the alternent route out to the internet.  If you have any
questions or need more help let me know and I'll see what I can do.



Grant. . . .


