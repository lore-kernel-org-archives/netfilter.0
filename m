From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: forwarding
Date: Tue, 18 May 2004 13:02:57 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084899777.7261.17.camel@localhost>
References: <33934.200.44.170.105.1084890127.squirrel@200.44.170.105>
	 <1084891180.6410.18.camel@localhost>
	 <34012.200.44.170.105.1084892235.squirrel@200.44.170.105>
	 <1084892325.6417.40.camel@localhost>
	 <34103.200.44.170.105.1084893176.squirrel@200.44.170.105>
	 <1084895498.7289.7.camel@localhost>
	 <34404.200.44.170.105.1084898303.squirrel@200.44.170.105>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <34404.200.44.170.105.1084898303.squirrel@200.44.170.105>
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

On Tue, 2004-05-18 at 12:38, alucard@kanux.com wrote:
> All right, let me explain my current setup because is not working after
> all your great help, let me put here step by step everything that is
> currently going on here.
> 
> -Server 1 has this /etc/rc.d/rc.firewall script:
> 
> #-----<script>
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
> #iptables -A INPUT -p tcp --dport 21 -j ACCEPT
> iptables -A INPUT -p tcp --dport 25 -j ACCEPT
> iptables -A INPUT -p tcp --dport 80 -j ACCEPT
> iptables -A INPUT -p tcp --dport 22 -j ACCEPT
> #iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
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
> iptables -t nat -A PREROUTING -d 10.73.219.156 -p tcp --dport 8080 \
>     -j DNAT --to-destination 192.168.0.2:80
> echo 1 > /proc/sys/net/ipv4/ip_forward
> #-----</script>
> 
> -in order to avoid any eth0/eth1 packets confussion, I have only one NIC
> in server2, the one that has the second webserver. This is the server2's
> route output:
> 
> -----route script
> [root@linserv root]# route
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
> 192.168.0.0     *               255.255.255.0   U     0      0        0 eth0
> 127.0.0.0       *               255.0.0.0       U     0      0        0 lo
> default         192.168.0.1     0.0.0.0         UG    0      0        0 eth0
> -----route script
> 
> It seems to be ok, from server2 I can access server1 thru 192,168 network
> but, what concerns me is that, it takes too long to show the default
> router, it gets stuck in lo about a minute. About accessing it from
> server1 using telnet, i have a remote server trying to access ip:8080 and
> it stills get no answer, even though the nmap record shows that port 8080
> in server one is filtered
> 
> Thanx a lot for this great help, I really apreciated it
> 
> Peace
> Juan
> Programmin' Python is like sugar... Sweet! ;)

OK - it's good to simplify :-)
You should not need to INPUT rule for 8080.
The delay in finding the default route is route's attempt at reverse
name resolution.  Use route -n instead.
Our next step is to trace.  From what address are you attempting to
telnet and where does that address live?
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


