From: Rob de beir <rob.de.beir@xs4all.nl>
Subject: Routing the same ip address over a router
Date: Sun, 24 Aug 2003 09:45:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308240945.28162.rob.de.beir@xs4all.nl>
Reply-To: root@debeir.xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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


Routing the same ip address over a linux server/router. The goal is to get on the linux machine
gsx-vmware running with a windows authentication helper, running over tcp/ip port 80. The virtual
windows machine and the linux box should have the same ip addresses.


I have a question about routing the same ip address over a router to a server.

Normally we set up a server behind a firewall on its own local network and do NAT forwarding using 
iptables as illustrated hereafter. In this way the web server can be reached  from the internet. 
This works great.



 |-|                    -----------------                                       -----------------
 |I|              eth0  |               | eth1                            eth0  |               |
 |N|--------------------|     router    |---------------------------------------|  web server   |
 |E|    213.31.202.69   |               | 192.168.151.1         92.168.151.69   |   port 80     |
 |T|    255.255.255.248 ----------------- 255.255.255.0        255.255.255.0    -----------------
 |-|    213.31.202.65 gw                                       192.168.151.1 gw

Relevant iptables command for this setup I have used:

# echo "1" > /proc/sys/net/ipv4/ip_forward
# iptables -A PREROUTING -t nat -p tcp -d 213.31.202.69 --dport 80 -j DNAT --to-destination 192.168.151.69
# iptables -A POSTROUTING -t nat -o eth0 -j SNAT --to-source 213.31.202.69


I have tested as well the situation of using gsx-VMware on the router running for example a 
windows web server. In this situation a virtual device vmnet1 is used. In this way all the traffic
coming at port traffic of the linux router is forwarded to the virtual windows machine. Running a 
virtual windows machine inside a linux box serving web pages might seem rather silly, but this is
meant as a test case. In ths final situation the windows machine will do a little more. Unfortunately
we have to use software that only runs on a windows machine. Why not replacing the complete linux
machine with a windows box? Well in fact there are two different virtual windows machines running 
on this linux box. We kind of mirrored this box to another linux box and with the heartbeat
program we now have created an High-Availability cluster serving two windows 2003 servers. It's 
amazing, but with the situation as printed above it works really smooth. 
 



 |-|                    -----------------                                       -----------------
 |I|              eth0  |               | vmnet1                                |  windows      |
 |N|--------------------|     router    |---------------------------------------|  web server   |
 |E|    213.31.202.69   |               | 192.168.151.1         92.168.151.69   |   port 80     |
 |T|    255.255.255.248 ----------------- 255.255.255.0        255.255.255.0    -----------------
 |-|    213.31.202.65 gw                                       192.168.151.1 gw





However, we now have to set up a different configuration. The server is now a windows box 
(still a virtual machine using vmware)) and is used in an authentication proces for Citrix, 
using port 80. Due to this authentication and server certificates, 
the server needs to have a public ip address. Due to the fact we have no more public addresses available 
and donnot want to hire extra ones, the server ip address has to be the same as the router outside 
ip address as shown below.

However I have no idea how to set up iptables to do NAT routing in this situation. As the server ip address 
and the router ip address are the same I'm not sure if the kernel at the router will forward the packets.

I have searched the internet for a solution, but could not find an answere. Some sources say that this can 
only be done by tunneling, but I could not find a good example and do not have experience with tunneling. 
I'm also not sure if tunneling can be used in this situation as one end is a windows machine?


If someone has experience with this or has a solution for the below printed routing, pls let me know how 
to fill in the ip addresses on the router interface and the iptables command or other programs to be used.


 |-|                    -----------------                                       -----------------
 |I|              eth0  |               | eth1                            eth0  |               |
 |N|--------------------|     router    |---------------------------------------|  auth server  |
 |E|    213.31.202.69   |               |                        213.31.202.69  |   port 80     |
 |T|    255.255.255.248 -----------------                                       -----------------
 |-|    213.31.202.65 gw




The real situation is a little bit more complicated, as the auth server is a windows machine running under
gsx-vmware on the router using a virtual interface vmnet0

 |-|                    -----------------                                       -----------------
 |I|              eth0  |               | vmnet0                                |  Windows      |
 |N|--------------------|     router    |---------------------------------------|  auth server  |
 |E|    213.31.202.69   |               |                        213.31.202.69  |   port 80     |
 |T|    255.255.255.248 -----------------                                       -----------------
 |-|    213.31.202.65 gw




