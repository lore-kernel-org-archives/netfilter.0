From: "americo.sb" <americo.sb@uol.com.br>
Subject: DNAT error in access from lan
Date: Fri, 22 Nov 2002 10:59:21 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <H5ZAQX$IF5rET4To2FJV6LeiS1fcilU4uXas7y7I_R@uol.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

I have 2 domains 
 work.com ----------------------- my.work.com
         |                           |
         |                           |
 ns_server.work.com             ns1_server.my.work.com
 stations.work.com               stations.my.work.com
                                 http_server.work.com
 
 into ns1_server.my.work.com there are 2 nic, eth0 
 (200.200.200.200) and eth1 (10.0.0.1/24) 
 into firewall i have http_server.work.com with 1 nic, eth0 
(10.0.0.254/24)
 
 I create 2 rolles one to my lan access web and other for 
access http_server into my lan

1 - snat 
iptables -t nat -A POSTROUTING -o eth0 -p tcp -j SNAT --to-
source 200.200.200.200
 2 - dnat
iptables -t nat -A PREROUTING -i eth0 -d 200.200.200.200 -p 
tcp -m tcp --dport 80 -j DNAT --to-destination 10.0.0.254:8080
 
 the problem =EDs:
 if i write www.work.com from my house OK  - go to my 
ns_server.work.com 
go ns1_server.my.work.com  (iptables server - Name Server)
go http_server.work.com
 if i write www.work.com from my lan, error, server not found.
 
 thanks for help.


 
---
UOL, o melhor da Internet
http://www.uol.com.br/


