From: zakinthinos@freemail.gr
Subject: script for home dialup / ppp0 link
Date: Thu, 7 Oct 2004 09:35:39 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4164e3bbe289b5.57642435@freemail.gr>
Reply-To: zakinthinos@freemail.gr
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


to keep it simple it mainly works with tha input chain


it does not have the -f flag to handle fragments
because i want only 1 rule to handle all
fragmants that match and not only head fragment
(or only fragments 2-3)


in one point it uses both conntrack and -m state
(in similar rules)
for testing/illustration purposes


i hope that wrapping is not too bad

any comments welcome


# echo 1 >/proc/sys/net/ipv4/conf/ppp0/rp_filter
# bad fragments can (?) pass through
# spoofed still pass through

*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]

#assymetrical attack on interfaces
#spooffed with localhost from ppp0 dropped
-A INPUT -i ppp0 -s 127.0.0.1 -j DROP
#whatever come to lo must be from localhost or DROP
-A INPUT -i lo -s ! 127.0.0.1 -j DROP
-A INPUT -i lo -s 127.0.0.1 -j ACCEPT
#DROP others that try reach loopback
-A INPUT -i lo -j DROP


#put a limit for DoS on ppp0
#  possibly limits speed too much  -A INPUT -m limit -i ppp0 -j DROP

#no accept icmp 
-A INPUT -p icmp --icmp-type any -j LOG --log-prefix "ICMP  " --log-level debug
-A INPUT -p icmp --icmp-type any -j DROP




#only ACK flag  == stealth portscanner --- TOO MANY BROKEN HTTPD
#-A INPUT -p tcp --tcp-flags ALL SYN,ACK -j LOG --log-prefix "port scan  " --log-level debug
#-A INPUT -p tcp --tcp-flags ALL ACK -j LOG --log-prefix "port scan  " --log-level debug


#-A INPUT -p tcp --tcp-flags ALL SYN,ACK -j DROP
#-A INPUT -p tcp --tcp-flags ALL ACK -j DROP




# only rst flag , DROP
-A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST -j LOG --log-prefix "port scan  " --log-level debug
-A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST -j DROP


#no accept NEW for tcp
-A INPUT -p tcp --syn -j LOG --log-prefix "bad tcp pakt  " --log-level debug
-A INPUT -p tcp --syn -j DROP

#match unclean 
-A INPUT -m unclean -j LOG --log-prefix "unclean found   " --log-level debug
-A INPUT -m unclean -j DROP






#no accept new connections
-A INPUT -m state --state NEW,INVALID -j LOG --log-prefix "NEW at input " --log-level debug
-A INPUT -m state --state NEW,INVALID -j DROP


#no accept new connections, use CONNTRACK
-A INPUT -m conntrack --ctstate NEW,INVALID -j LOG --log-prefix "NEW conn at input  " --log-level debug
-A INPUT -m conntrack --ctstate NEW,INVALID -j DROP


#accept tcp on ports>1024, only established conns
-A INPUT -m state --state ESTABLISHED,RELATED -p tcp -j ACCEPT --dport 1025:
-A INPUT -m state --state ESTABLISHED,RELATED -p udp -j ACCEPT --dport 1025:

#drop all that did not match
-A INPUT -j DROP

#disallow X win traffic to go through OUTPUT
#someone to start a bad xterm = no
-A OUTPUT -p tcp -j DROP --dport 6000:6010 
-A OUTPUT -p udp -j DROP --dport 6000:6010 




#set policy , accept all in output, dissallow others
-P OUTPUT ACCEPT
-P INPUT DROP
-P FORWARD DROP


COMMIT



