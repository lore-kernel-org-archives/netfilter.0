From: Sagara Wijetunga <sagaralists@yahoo.com>
Subject: Is this firewall good enough?
Date: Tue, 8 Jun 2004 02:14:36 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040608091436.84113.qmail@web14712.mail.yahoo.com>
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

Hi all

I have set up my first firewall using iptables. I want
to check with more experienced users of iptables
whether my firewall is good enough to protect the
server.

My server expressly offer following services only:
1.  FTP server
2.  SSH server
3.  SMTP server
4.  DNS server
5.  HTTP server
6.  POP3 server
7.  IMAP server
8.  HTTPS server
9.  SMTP over SSL
10. IMAP over SSL
11. POP3 over SSL

I have set up the firewall with following rules:

1.  /sbin/iptables -A INPUT -s 127.0.0.1 -d 127.0.0.1
-j ACCEPT
2.  /sbin/iptables -A INPUT -p tcp -m state --state
ESTABLISHED,RELATED -j ACCEPT
3.  /sbin/iptables -A INPUT -p tcp --dport 20  --syn
-j ACCEPT	#ftp-data
4.  /sbin/iptables -A INPUT -p tcp --dport 21  --syn
-j ACCEPT	#ftp
5.  /sbin/iptables -A INPUT -p tcp --dport 22  --syn
-j ACCEPT	#ssh
6.  /sbin/iptables -A INPUT -p tcp --dport 25  --syn
-j ACCEPT	#smtp
7.  /sbin/iptables -A INPUT -p tcp --dport 53  --syn
-j ACCEPT	#DNS
8.  /sbin/iptables -A INPUT -p tcp --dport 80  --syn
-j ACCEPT	#http
9.  /sbin/iptables -A INPUT -p tcp --dport 110 --syn
-j ACCEPT	#POP3
10. /sbin/iptables -A INPUT -p tcp --dport 143 --syn
-j ACCEPT	#IMAP
11. /sbin/iptables -A INPUT -p tcp --dport 443 --syn
-j ACCEPT	#https
12. /sbin/iptables -A INPUT -p tcp --dport 465 --syn
-j ACCEPT	#smtp over SSL
13. /sbin/iptables -A INPUT -p tcp --dport 993 --syn
-j ACCEPT	#IMAP over SSL
14. /sbin/iptables -A INPUT -p tcp --dport 995 --syn
-j ACCEPT	#POP3 over SSL
15. /sbin/iptables -P INPUT DROP
16. /sbin/iptables -P FORWARD DROP
17. /sbin/iptables -P OUTPUT ACCEPT

Ofcourse, the comment style #string is not included in
the real rule.

I have following queries regarding the above firewall:

1. Does this effectively offer connections ONLY to the
services I offer and nothing more than that? 

2. Does the rule 2 create any security loophole?

3. This firewall allows passive as well as non-passive
FTP connections. Is passive FTP connections   a
security threat?

4. Is this firewall good enough to protect the server?
If no, could you kindly comment how could I improve
further?

Many thanks in advance.

Kindest regards
Sagara



	
		
__________________________________
Do you Yahoo!?
Friends.  Fun.  Try the all-new Yahoo! Messenger.
http://messenger.yahoo.com/ 

