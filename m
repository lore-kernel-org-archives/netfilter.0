From: "Han, Yan" <hany@u.library.arizona.edu>
Subject: RE: simple port forwarding question
Date: Mon, 3 Nov 2003 11:04:58 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BEA73FB6B8F62545A5B2818724D0DF2902E7084E@u.library.Arizona.EDU>
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
To: 'Rohit Kumar Mehta' <rohitm@engr.uconn.edu>, netfilter@lists.netfilter.org

Hi! Look at your forward options

Maybe you need to have these lines. Make sure if FORWARD is ACCEPT.



#set the dafault policies; close everything
iptables -P INPUT DROP   
iptables -P OUTPUT DROP 
iptables -P FORWARD ACCEPT  # modify this 


################################################
# Allow all outgoing Internet access
################################################
iptables -A OUTPUT  -s 192.168.28.3  -d 0/0 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT


################
iptables -t nat -A PREROUTING --dst 192.168.28.3 -p tcp --dport 88 -j 
DNAT --to 192.168.28.2
iptables -t nat -A PREROUTING --dst 192.168.28.3 -p udp --dport 88 -j 
DNAT --to 192.168.28.2

iptables -t nat -A POSTROUTING -p udp --dst 192.168.28.2 --dport 88 -j 
SNAT --to-source 192.168.28.3
iptables -t nat -A POSTROUTING -p tcp --dst 192.168.28.2 --dport 88 -j 
SNAT --to-source 192.168.28.3

iptables -t nat -A OUTPUT --dst 192.168.28.3 -p tcp --dport 88 -j DNAT 
--to-destination 192.168.28.2
iptables -t nat -A OUTPUT --dst 192.168.28.3 -p udp --dport 88 -j DNAT 
--to-destination 192.168.28.2


Yan

-----Original Message-----
From: Rohit Kumar Mehta [mailto:rohitm@engr.uconn.edu] 
Sent: Monday, November 03, 2003 6:59 AM
To: netfilter@lists.netfilter.org
Subject: simple port forwarding question


Hi guys, I was wondering if someone could help me out here.  I am fairly 
well confused after trying to muddle through
this tutorial:
http://iptables-tutorial.frozentux.net/iptables-tutorial.html

I think what I want to do should be easy.  Perhaps someone could help.

We are trying to trick the systems into believing that the Kerberos 5 
server is on IP#2 (let's call it 192.168.28.3)
but it is in fact on IP#1 (192.168.28.2).

Maybe my attempted iptables commands will make it blatantly obvious what 
I am trying to do:

iptables -t nat -A PREROUTING --dst 192.168.28.3 -p tcp --dport 88 -j 
DNAT --to 192.168.28.2
iptables -t nat -A PREROUTING --dst 192.168.28.3 -p udp --dport 88 -j 
DNAT --to 192.168.28.2

iptables -t nat -A POSTROUTING -p udp --dst 192.168.28.2 --dport 88 -j 
SNAT --to-source 192.168.28.3
iptables -t nat -A POSTROUTING -p tcp --dst 192.168.28.2 --dport 88 -j 
SNAT --to-source 192.168.28.3

iptables -t nat -A OUTPUT --dst 192.168.28.3 -p tcp --dport 88 -j DNAT 
--to-destination 192.168.28.2
iptables -t nat -A OUTPUT --dst 192.168.28.3 -p udp --dport 88 -j DNAT 
--to-destination 192.168.28.2


Basically we want it so that if I do a "telnet 192.168.28.3 88", I get a 
connection to "192.168.28.2:88"
This works - when I initiate the connection from 192.168.28.3, but from 
any other machine on the network
it does not work.

Am I doing something wrong or forgetting a key step?  Thanks!

Rohit


