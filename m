From: Payal Rathod <payal-iptables@scriptkitchen.com>
Subject: DNAT not working
Date: Wed, 18 Apr 2007 12:26:04 -0400
Message-ID: <20070418162604.GA10834@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
My gateway server is Ubuntu 6.06.1 LTS, iptables v1.3.3.  By ifconfig I 
have added one more ip say 1.2.3.4 (eth0:1). iptables-save gives me the 
output at,
http://pastebin.ca/446625

# cat /proc/sys/net/ipv4/ip_forward
1


But when I connect to 1.2.3.4 port 25,  instead of redirecting me to 
10.10.200.2 it connects me to port 25 of the gateway machine. I am 
totally confused, can anyone help me out please?

With warm regards,
-Payal

