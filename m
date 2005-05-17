From: "bagwan ali" <bagwani@hotmail.com>
Subject: redirect to 127.0.0.1 [corrected]
Date: Tue, 17 May 2005 17:04:30 +0000
Message-ID: <BAY16-F138F014D31905BBA75CC46BA160@phx.gbl>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi All,

I have a problem redirecting traffic from $SERVER:11000 to 127.0.0.1:10001. 
The situation is that I need more than one serverprocess listening to ONE 
specific port in this case port 11000. Ofcourse this is  not possible, but 
there is only ONE client connection at a time to ONE serverprocess. So 
instead that the process is listening on $SERVER:11000, it is listening on 
127.0.0.1:10001 and the second serverprocess is listening on 127.0.0.1:10002 
and so on. So I can depending on the source IP address redirect traffic from 
$SERVER:11000 to 127.0.0.1:$FREEPORT. Let me give an example in pseudo 
firewall rules:

$CLIENT_ONE    to $SERVER:11000 REDIRECT 127.0.0.1:10001
$CLIENT_TWO   to $SERVER:11000 REDIRECT 127.0.0.1:10002
$CLIENT_THREE to $SERVER:11000 REDIRECT 127.0.0.1:10003

I tried the following to achive this in iptables and failed:

iptables -t nat -A PREROUTING -p tcp -s $CLIENT_ONE -d $SERVER --dport 11000 
-j REDIRECT --to-ports 11001
iptables -t nat -A PREROUTING -p tcp -s $CLIENT_TWO -d $SERVER --dport 11000 
-j REDIRECT --to-ports 11002
iptables -t nat -A PREROUTING -p tcp -s $CLIENT_THREE -d $SERVER --dport 
11000 -j REDIRECT --to-ports 11003

where
$SERVER           = 192.168.2.1
$CLIENT_ONE    = 192.168.2.50
$CLIENT_TWO   = 192.168.2.51
$CLIENT_THREE = 192.168.2.52

The problem is that the client and server cannot establish a connection. Who 
can help me solve this porblem!!

Thanks in advance

-Luc

My OS is Fedora Core 3 (kernel 2.6.11) with iptables v1.2.11.
Here are my iptable rules:

iptables -L -vn && iptables -t nat -L -vn
[BEGIN RULES]
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
pkts bytes target     prot opt in     out     source               
destination
813K 2200M ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
171K 8306K ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0 
           state RELATED,ESTABLISHED
8338  400K ACCEPT     all  --  *      *       192.168.2.0/24       0.0.0.0/0
    0     0 REJECT     icmp --  *      *       0.0.0.0/0            
0.0.0.0/0           reject-with icmp-port-unreachable
  885 47572 LOG        all  --  *      *       0.0.0.0/0            
0.0.0.0/0           LOG flags 0 level 4
  885 47572 REJECT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0           reject-with icmp-port-unreachable

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
pkts bytes target     prot opt in     out     source               
destination

Chain OUTPUT (policy ACCEPT 276K packets, 340M bytes)
pkts bytes target     prot opt in     out     source               
destination
813K 2200M ACCEPT     all  --  *      lo      0.0.0.0/0            0.0.0.0/0

Chain PREROUTING (policy ACCEPT 7873 packets, 474K bytes)
pkts bytes target     prot opt in     out     source               
destination
    0     0 REDIRECT   tcp  --  *      *       192.168.2.50         
192.168.2.1         tcp dpt:11000 redir ports 11001
    0     0 REDIRECT   tcp  --  *      *       192.168.2.51         
192.168.2.1         tcp dpt:11000 redir ports 11002
    0     0 REDIRECT   tcp  --  *      *       192.168.2.52         
192.168.2.1         tcp dpt:11000 redir ports 11003

Chain POSTROUTING (policy ACCEPT 5086 packets, 322K bytes)
pkts bytes target     prot opt in     out     source               
destination

Chain OUTPUT (policy ACCEPT 5086 packets, 322K bytes)
pkts bytes target     prot opt in     out     source               
destination
[END RUULES]

_________________________________________________________________
FREE pop-up blocking with the new MSN Toolbar - get it now! 
http://toolbar.msn.click-url.com/go/onm00200415ave/direct/01/


