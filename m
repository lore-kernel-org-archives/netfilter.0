From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: Iptables don't understand network address
Date: Tue, 9 Jul 2002 16:10:29 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA281@JUPITER>
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
To: 'Jean-Michel CARICAND' <CARICAND.Jean-Michel@wanadoo.fr>, netfilter@lists.samba.org

I have the exact same setup and the only difference is that I have /24
netmask and not /23.
Does your INPUT rules have any byte count???

As below, works for me..?? I'm using 1.2.5 iptables at the moment..

[root@firewall /root]# iptables -I INPUT 1 -i eth0 -s 10.10.0.69 -p icmp -j
DROP
[root@firewall /root]# iptables -L INPUT -v -n -x 
Chain INPUT (policy DROP 86 packets, 4835 bytes)
    pkts      bytes target     prot opt in     out     source
destination         
      15      840 DROP       icmp --  eth0   *       10.10.0.69
0.0.0.0/0   



c:\>ping 10.10.0.254

Pinging 10.10.0.254 with 32 bytes of data:

Request timed out.
Request timed out.
Request timed out.
Request timed out.

Ping statistics for 10.10.0.254:
    Packets: Sent = 4, Received = 0, Lost = 4 (100% loss),
Approximate round trip times in milli-seconds:
    Minimum = 0ms, Maximum =  0ms, Average =  0ms

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: Jean-Michel CARICAND [mailto:CARICAND.Jean-Michel@wanadoo.fr]
Sent: Tuesday, 09 July 2002 5:03 PM
To: netfilter@lists.samba.org
Subject: Iptables don't understand network address 


I have a local network with 10.0.2.0 address and 255.255.254.0 netmask. 
 
My firewall have IP 10.0.2.130 on eth0. 
My station have IP 10.0.2.2.

I configure my firewall for drop the ping from the station with 1 rules :

# iptables -A INPUT -i eth0 -s 10.0.2.2 -p icmp -j DROP 

When I ping the firewall from my station (ping 10.0.2.130) , I receive an
response from the serveur 

Why ?
 
What is the problem ? My netmask ?
 
If i modify my netmask to 255.0.0.0 on firewall and my station, the ping
doesn't work. Normal !
 
Iptables don't understand network address not in class A, B or C 
 
HELP ME !!!




