From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: snat dnat question
Date: Sat, 6 Jul 2002 11:55:46 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA254@JUPITER>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Thomas Hilgert' <Thomas.Hilgert@hilgert.de>, netfilter@lists.samba.org

Can you tell more about where your testing the telnet.. from outside or LAN
etc..

Can you list it more verbosely

iptables -L -v -n -x
iptables -L -v -n -x -t nat

I usually don't POSTROUTE anywhere to anywhere.. dunno about you but I at
least specify a source address so it doesn't snat something your not aware
of...

-----Original Message-----
From: Thomas Hilgert [mailto:Thomas.Hilgert@hilgert.de]
Sent: Saturday, 06 July 2002 8:57 AM
To: netfilter@lists.samba.org
Subject: snat dnat question


Hi guys,

I have some question regarding snat / dnat witch iptables. Here is what
I do
1. setup a packetfilter linuxbox with 3 interfaces.
   ETH0: Connected to the internet (public ip)
   ETH1: DMZ with stmp server 10.2.0.0/24
   ETH2: Internal LAN with ip address 10.1.0.0/24

   Snat all to the official ip address
   Dnat all incoming to the smtp server
See the and of mail for a iptables -t nat -L
And now the question :-) 
If I do a telnet to mail.mailwatch.com 25 (simulating smtp) is all I get
SYN_SENT and that is no connection from the DMZ. The packet filter has
no problem to establish a connection. 
PLEASE explain me why

Thanks in advance

Thomas Hilgert
-----------------
Here are the rules to play: 
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       all  --  anywhere             anywhere           to:10.2.0.2

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT       all  --  anywhere             anywhere
to:212.23.129.186

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
[root@gw1 iproute2]# iptables -t nat -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       all  --  anywhere             anywhere           to:10.2.0.2

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT       all  --  anywhere             anywhere
to:212.23.129.186

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination



