From: "Stuart Lamble" <stu@gateway10.homeip.net>
Subject: Is this config OK, plus were should I be logging...
Date: Sun, 4 Apr 2004 19:26:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000401c41a6a$056c3690$0464a8c0@stu>
Reply-To: <stu@gateway10.homeip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org



:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]
-A INPUT -i lo -j ACCEPT 
-A INPUT -i eth1 -j ACCEPT 
-A INPUT -p icmp -j ACCEPT 
-A INPUT -p tcp -m tcp --sport 25 -j ACCEPT 
-A INPUT -i ppp0 -p tcp -m tcp --dport 22 -j ACCEPT 
-A INPUT -i ppp0 -p tcp -m tcp --dport 25 -j ACCEPT 
-A INPUT -i ppp0 -p tcp -m tcp --dport 80 -j ACCEPT 
-A INPUT -i ppp0 -p tcp -m tcp --dport 443 -j ACCEPT 
-A INPUT -i ppp0 -p tcp -m tcp --dport 10000 -j ACCEPT 
-A INPUT -i ppp0 -p udp -m udp --sport 53 -j ACCEPT 
-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT 
-A FORWARD -s 192.168.100.0/255.255.255.0 -j ACCEPT 
-A FORWARD -d 192.168.100.6 -p tcp -m tcp --dport 22 -j ACCEPT 
-A FORWARD -d 192.168.100.6 -p tcp -m tcp --dport 7783 -j ACCEPT 
-A OUTPUT -s 127.0.0.1 -j ACCEPT 
-A OUTPUT -o eth1 -j ACCEPT 
-A OUTPUT -p tcp -m tcp --sport 80 -j ACCEPT 
-A OUTPUT -p tcp -m tcp --sport 25 -j ACCEPT 
-A OUTPUT -p tcp -m tcp --sport 22 -j ACCEPT 

:PREROUTING ACCEPT [10:1191]
:POSTROUTING ACCEPT [1:48]
:OUTPUT ACCEPT [0:0]
-A PREROUTING -i ppp0 -p tcp -m tcp --dport 555 -j DNAT --to-destination
192.168.100.6:22 
-A PREROUTING -i ppp0 -p tcp -m tcp --dport 7783 -j DNAT
--to-destination 192.168.100.6:7783 
-A POSTROUTING -s 192.168.100.0/255.255.255.240 -o ppp0 -j MASQUERADE 

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.648 / Virus Database: 415 - Release Date: 3/31/2004
 

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.648 / Virus Database: 415 - Release Date: 3/31/2004
 


