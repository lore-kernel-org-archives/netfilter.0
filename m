From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: forwarding
Date: Tue, 18 May 2004 16:09:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405181609.59945.Antony@Soft-Solutions.co.uk>
References: <33934.200.44.170.105.1084890127.squirrel@200.44.170.105> <1084891180.6410.18.camel@localhost> <34012.200.44.170.105.1084892235.squirrel@200.44.170.105>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <34012.200.44.170.105.1084892235.squirrel@200.44.170.105>
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

On Tuesday 18 May 2004 3:57 pm, alucard@kanux.com wrote:

> Hi there again...
>
> Here's my changed rule:
>
> -------
> echo "Borrando posibles reglas anteriores..."
> iptables -F
> iptables -X
>
> echo "Habilitando politicas de negacion total de paquetes"
>
> iptables -P FORWARD DROP
> iptables -P INPUT DROP
>
> #para el forward
> echo 0 > /proc/sys/net/ipv4/ip_forward
> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 80 -j ACCEPT
> iptables -t nat -A PREROUTING -d 10.73.219.156 -p 6 --dport 8080 \
>     -j DNAT --to-destination 192.168.0.2:80
> echo 1 > /proc/sys/net/ipv4/ip_forward
> -------
>
> and after I executed this, here's my nmap output
>
> -------
> root@mail:~# nmap 10.73.219.156
>
> (The 1652 ports scanned but not shown below are in state: filtered)
> PORT     STATE SERVICE
> 22/tcp   open  ssh
> 25/tcp   open  smtp
> 80/tcp   open  http
> 143/tcp  open  imap
> 3306/tcp open  mysql
> --------

Where are you running nmap from?

I wonder if the problem is thr routes on machine2 (the genuione web server) 
not sending the reply packets back via machine1 (the firewall) correctly?

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
192.168.0.0     *               255.255.255.0   U     0      0        0 eth1
10.73.216.0     *               255.255.252.0   U     0      0        0 eth0
169.254.0.0     *               255.255.0.0     U     0      0        0 eth0
127.0.0.0       *               255.0.0.0       U     0      0        0 lo
default         192.168.0.1     0.0.0.0         UG    0      0        0 eth1

If the requests come in on eth1 but the replies go out on eth0 that would be a 
problem.

Regards,

Antony.

-- 
"The future is already here.   It's just not evenly distributed yet."

 - William Gibson

                                                     Please reply to the list;
                                                           please don't CC me.


