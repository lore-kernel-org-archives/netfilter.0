From: Dexter <babyangel@skydsl.com.ph>
Subject: iptables setting problem
Date: Sun, 09 Apr 2006 13:48:55 +0700
Message-ID: <4438AE57.6060706@skydsl.com.ph>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Dear Sir,
I encounter the problem of setting the iptables.
I manually set eth0 210.21.47.32 netmask 255.255.255.0 gateway 
210.21.47.1 and eth1 192.168.1.1 netmask 255.255.255.0
and setting of Lan computer is 192.168.1.2  255.255.255.0  192.168.1.1
from the computer in Lan I can ping both the address of eth0 and eth1, 
but I can not ping the default gateway that ISP assigned to me.
I did the following:
iptables -A FORWARD -i eth1 -j ACCEPT
echo 1 > /proc/sys/net/ipv4/ip_forward

but didn't work, then I did follow:
iptables -t nat -A PREROUTING -d $210.21.47.32/24 -i eth0 -j DNAT 
--to-destination 192.168.1.0
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o eth0 -j SNAT 
--to-source $210.21.47.32

but still didn't work. something wring with my setting. Thanks.

Best Regards,
Dexter Co


