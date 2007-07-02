From: Reid <reid_sf@yahoo.com>
Subject: Configuration question for my first iptables setup
Date: Mon, 2 Jul 2007 12:12:38 -0700 (PDT)
Message-ID: <831957.88102.qm@web54203.mail.re2.yahoo.com>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


I am brand new to iptables, and I want to setup a basic firewall for a dedicated web server. I'm
accessing the server remotely, and already locked myself out once.

I've come up with the configuration below, but feel like I don't know what I'm doing.  Does the
following look reasonable? Am I overlooking anything major? Thank you for input.


> iptables -L
Chain INPUT (policy DROP)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere            
ACCEPT     tcp  --  anywhere             anywhere            tcp flags:ACK/ACK 
ACCEPT     all  --  anywhere             anywhere            state ESTABLISHED 
ACCEPT     all  --  anywhere             anywhere            state RELATED 
ACCEPT     udp  --  anywhere             anywhere            udp spt:domain dpts:1024:65535 
ACCEPT     icmp --  anywhere             anywhere            icmp echo-reply 
ACCEPT     icmp --  anywhere             anywhere            icmp destination-unreachable 
ACCEPT     icmp --  anywhere             anywhere            icmp source-quench 
ACCEPT     icmp --  anywhere             anywhere            icmp time-exceeded 
ACCEPT     icmp --  anywhere             anywhere            icmp parameter-problem 
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:www 
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:https 
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ssh 
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:auth 
ACCEPT     icmp --  anywhere             anywhere            icmp echo-request 
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:10000 
DROP       tcp  --  anywhere             anywhere            tcp dpts:2049:2050 
DROP       tcp  --  anywhere             anywhere            tcp dpts:x11:6063 
DROP       tcp  --  anywhere             anywhere            tcp dpts:afs3-fileserver:7010 
DROP       all  --  anywhere             anywhere            

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
>
 


      ____________________________________________________________________________________
Shape Yahoo! in your own image.  Join our Network Research Panel today!   http://surveylink.yahoo.com/gmrs/yahoo_panel_invite.asp?a=7 



