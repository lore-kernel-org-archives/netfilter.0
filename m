From: Jason Neely <bondibox@bellsouth.net>
Subject: RTSP Reflect Broadcast
Date: Tue, 28 Feb 2006 11:38:41 -0500
Message-ID: <44047C91.40502@bellsouth.net>
Reply-To: bondibox@bellsouth.net
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org


I have a CentOS 4.2 box running Darwin Streaming Server with an iptables 
firewall.  I set the firewall rules to allow rtsp streaming, and it 
works fine while streaming static files housed on the server, but when I 
try to reflect a live broadcast with the firewall running it breaks down.

The way it is set up is an enduser ($PC) sends a request to the server 
($DSS) which then listens for the unicast broadcast session being sent 
to it from the broadcaster ($Mac), and forwards it out to the initial 
user.  The session breaks down because the server can only answer 
requests and can't initiate a listen to the broadcast being sent to it,  
or it can't forward the broadcast.  I found that it is the reject 
any-as-yet unspecified INPUT rule that is causing the stoppage.   The 
DSS has only one interface, eth0 with which it receives the broadcast 
and client requests.

What iptables ruleset will allow the streaming server to enable a user 
to tell it to start listening to an unicast transmission?

Port 554 =  DSS Listen
Port 6970-6999 = DSS Send & control
Port 5432= broadcaster audio 1
Port 5433= broadcaster audio 2
------------------------------------------------------------------------------
I did cat /proc/net/ip_conntrack and identified the following sessions 
as relevant.  

udp      src=$Mac dst=$DSS sport=6970 dport=5432  src=$DSS dst=$Mac 
sport=5432 dport=6970
udp      src=$Mac dst=$DSS sport=6971 dport=5433 src=$DSS dst=$Mac 
sport=5433 dport=6971
udp      src=$DSS dst=$PC sport=6970 dport=6970  src=$PC dst=$DSS 
sport=6970 dport=6970
udp      src=$DSS dst=$PC sport=6971 dport=6971  src=$PC dst=$DSS 
sport=6971 dport=6971
tcp      ESTABLISHED src=$PC dst=$DSS sport=2278 dport=554 src=$DSS 
dst=$PC sport=554 dport=2278

===============  iptables rules  ====================
/sbin/iptables -A INPUT -s 127.0.0.1 -j ACCEPT
/sbin/iptables -A INPUT -s 127.0.0.1 -d 192.168.1.159 -j ACCEPT
/sbin/iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
/sbin/iptables -A FORWARD -i eth0 -m state --state RELATED,ESTABLISHED 
-j ACCEPT
/sbin/iptables -A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
/sbin/iptables -A INPUT -d 192.168.1.159 -p tcp --dport 80 -j ACCEPT
/sbin/iptables -A INPUT -d 192.168.1.159 -p udp --dport 80 -j ACCEPT
/sbin/iptables -A INPUT -d 192.168.1.159 -p tcp --dport 554 -j ACCEPT
/sbin/iptables -A INPUT -d 192.168.1.159 -p udp --dport 554 -j ACCEPT
/sbin/iptables -A INPUT -d 192.168.1.159 -p tcp --dport 7070 -j ACCEPT
/sbin/iptables -A INPUT -d 192.168.1.159 -p udp --dport 7070 -j ACCEPT
/sbin/iptables -A INPUT -d 192.168.1.159 -p udp --dport 6970:6999 -j ACCEPT
/sbin/iptables -A INPUT -j LOG
/sbin/iptables -A INPUT -j REJECT
/sbin/iptables -A FORWARD -j REJECT


