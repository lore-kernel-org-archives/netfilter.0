From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: forwarding
Date: Tue, 18 May 2004 10:39:41 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084891180.6410.18.camel@localhost>
References: <33934.200.44.170.105.1084890127.squirrel@200.44.170.105>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <33934.200.44.170.105.1084890127.squirrel@200.44.170.105>
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
To: alucard@kanux.com
Cc: netfilter@lists.netfilter.org

I think I see it - I'll add a comment in your e-mail within brackets []

On Tue, 2004-05-18 at 10:22, alucard@kanux.com wrote:
> Hi there again,
> 
>    I finally decided to add a second card to both, the server and the
> client to be able to forward packets from port 8080 in server 1 to port
> 80 in server 2 and somehow this packets are not going thru, let me
> explain my scenario
> 
>                            Internet Address
>                             Nat'ed Address
>                             ---------------
>                             |  Linux Box  |
>                   Server 1  |10.73.219.156|nat'ed' address
>                             | 192.168.0.1 |2nd NIC to forward packets
>                             ---------------
>                                  8080
>                                    |
>                                    |
>                                   80
>                             ---------------
>                             |  web server |
>                   Server 2  | 192.168.0.2 |
>                             |             |
>                             ---------------
> 
> 
> - Server 1 has a natted addres using it's 10.73; what I'm trying to do is
> that evrything that comes to 10.73.219.156:8080 gets forwarded to
> 192.168.0.2:80.
> 
> - Server 1 functions as a webserver and that's why I'm using port 8080 in
> order to forward packets to port 80 in server 2
> 
> - Here's my Server 1's /etc/rc.d/rc.firewall script because somehow it's
> not working:
> 
> -----
> echo "Borrando posibles reglas anteriores..."
> iptables -F
> iptables -X
> 
> echo "Habilitando politicas de negacion total de paquetes"
> 
> iptables -P FORWARD DROP
> iptables -P INPUT DROP
> 
> echo "Reglas para paquetes de entrada y salida"
> 
> iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> 
> iptables -A INPUT -p tcp --dport 21 -j ACCEPT
> iptables -A INPUT -p tcp --dport 25 -j ACCEPT
> iptables -A INPUT -p tcp --dport 80 -j ACCEPT
> iptables -A INPUT -p tcp --dport 22 -j ACCEPT
> 
> ##internas
> iptables -A INPUT -i eth0 -p tcp --dport 143 -j ACCEPT
> iptables -A INPUT -i lo -p tcp --dport 143 -j ACCEPT
> iptables -A INPUT -p tcp --dport 3306 -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 110 -j ACCEPT
> 
> #para el forward
> echo 0 > /proc/sys/net/ipv4/ip_forward
> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 80 -j ACCEPT
> iptables -t nat -A PREROUTING -d 192.168.0.1 -p tcp --dport 8080 \
>     -j DNAT --to-destination 192.168.0.2:80
[JAS - isn't the packet coming in on 10.73.219.156? In other words, your
NAT rule should be:
iptables -t nat -A PREREOUTING -d 10.73.219.156 -p 6 --dport 8080 -j
DNAT --to-destination 192.168.0.2:80]
> echo 1 > /proc/sys/net/ipv4/ip_forward
> -----
> 
> I have done this many times and somehow this time is not working, that
> means that I have changed many things using postrouting, nat and dnat. Is
> it because any missconfiguration on Server 2's route? here's the output:
> 
> -----
> [root@linserv root]# route
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
> 192.168.0.0     *               255.255.255.0   U     0      0        0 eth1
> 10.73.216.0     *               255.255.252.0   U     0      0        0 eth0
> 169.254.0.0     *               255.255.0.0     U     0      0        0 eth0
> 127.0.0.0       *               255.0.0.0       U     0      0        0 lo
> default         192.168.0.1     0.0.0.0         UG    0      0        0 eth1
> -----
> 
> Is it because I have to use different INPUT rules? for what I know, INPUT
> rules are only for the packets going to the computer itself.
> 
> Any suggestions will be great
> Thanks a lot as usual to this great mailing list
> 
> Juan
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


