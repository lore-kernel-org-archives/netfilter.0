From: sebastian.ionita@focomunicatii.ro
Subject: Iptables and vlan interfaces
Date: Fri, 30 Sep 2005 14:21:29 +0300
Message-ID: <20050930112129.19898.qmail@focomunicatii.ro>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.netfilter.org

Why doesn't iptables works with vlans interfaces? 

iptables -t mangle -A FORWARD -i eth0 -o eth1.11 -j MARK --set-mark 4
Gives me the error:
host/network eth1.11 not found. 

I'm running kernel version 2.4.27. with iptables 1.2.9 

The eth1.11 exists works perfectly. 

Seby, 



