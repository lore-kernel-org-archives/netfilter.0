From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: forwarding
Date: Tue, 18 May 2004 10:58:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084892325.6417.40.camel@localhost>
References: <33934.200.44.170.105.1084890127.squirrel@200.44.170.105>
	 <1084891180.6410.18.camel@localhost>
	 <34012.200.44.170.105.1084892235.squirrel@200.44.170.105>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: alucard@kanux.com
Cc: netfilter@lists.netfilter.org

On Tue, 2004-05-18 at 10:57, alucard@kanux.com wrote:
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
> echo "Reglas para paquetes de entrada y salida"
> 
> iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> 
> #iptables -A INPUT -p tcp --dport 21 -j ACCEPT
> iptables -A INPUT -p tcp --dport 25 -j ACCEPT
> iptables -A INPUT -p tcp --dport 80 -j ACCEPT
> iptables -A INPUT -p tcp --dport 22 -j ACCEPT
> 
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
> 
> Should I show something else? for what I know, it should be forwarding
> packets but is not... port 8080 is not open as nmap shows, any
> suggestions?
> 
> Thanks a lot as usual...
> Juan
Although it probably did, are you sure nmap scanned port 8080? How about
nmap -sT -p 8080 10.73.219.156

I would then trace both the wire and the iptables rules to find out
where it is breaking - John 
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


