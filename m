From: ro0ot <ro0ot@phreaker.net>
Subject: Transparent Proxy to a Remote Squid Box
Date: Fri, 19 Nov 2004 23:50:28 +0800
Message-ID: <419E1644.1030903@phreaker.net>
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

I am running the below scripts for "Transparent Proxy to a Remote Squid 
Box": -

$IPTABLES -t nat -A PREROUTING -i $cusif -s ! $squid_box -p tcp --dport 
80 -j DNAT --to $squid_box:3128
$IPTABLES -t nat -A POSTROUTING -o $cusif -s $cus_net -d $squid_box -j 
SNAT --to $cus_ip
$IPTABLES -A FORWARD -s $eastin_i001 -d $squid_box -i $cusif -o $cusif 
-p tcp --dport 3128 -j ACCEPT

If the daemon dies, I need to remove the above three lines.  How can I 
monitor the Squid daemon from the firewall? 

Regards,
ro0ot




