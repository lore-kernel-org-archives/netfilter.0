From: bruce <bruce@gajshield.com>
Subject: iptables with multiport problem
Date: Tue, 5 Oct 2004 18:17:04 +0530
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200410051250.i95CoY030305@securegate.mailserver.gajshield.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Hi all,

I am  working with linux firewall implementation


I am using iptables version  v1.2.11 and  linux kernal 2.4.27.
If multiport option comes with iptables(iptable rules are below), the 
services are not working. But individual services are working properly. 
The following filtering rules are not giving any syntatical errors.
I checked logs no info..

#/sbin/iptables -A FORWARD -i eth0 -o eth1 -p tcp -s 192.168.2.0/24 -m 
multiport --dport 24,80 -m multiport --sport 0:65535  -d 192.168.1.2  -j 
ACCEPT

#/sbin/iptables -A FORWARD -i eth1 -o eth0 -p tcp -s 192.168.1.2 -m multiport 
--sport 24,80 -d 192.168.2.0/24 -m multiport --dport 0:65535 -j ACCEPT

Please give any solution or hints for the below problem.
Thanks
Bruce

