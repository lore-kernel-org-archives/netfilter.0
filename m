From: MOUDARIR Mohamed <Moudarir@Richbond.ma>
Subject: RE: transparent proxy whith DNAT
Date: Thu, 5 Sep 2002 09:35:30 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <14C5057BC852D611BAC400E0299AA10FC94A@MAILSERV>
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

Hello,
I find why the proxy respond this error,
Think you for your help,
In fact there is a missing config line in my squid.conf,

The important parameters that should be able are:
	httpd_accel_host virtual
	httpd_accel_port 80
	httpd_accel_with_proxy	on
	httpd_accel_uses_host_header on

Now, it work fine.

BTW, what is the more efficace and fast :
	iptables -t nat -A PREROUTING -i $int_iface -s ! $int_ip -p tcp
--dport 80 -j DNAT --to $int_ip:3128
OR
	$IPTABLES -t nat -A PREROUTING -i $int_iface -p tcp --dport 80 -j
REDIRECT --to-port 3128

Best regards.

