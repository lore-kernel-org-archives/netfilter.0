From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: forwarding on the same NIC
Date: Tue, 11 May 2004 11:09:39 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084288178.15768.10.camel@localhost>
References: <3401.200.44.170.105.1084217773.squirrel@200.44.170.105>
	 <200405102115.14089.Antony@Soft-Solutions.co.uk>
	 <1292.192.168.74.154.1084226963.squirrel@192.168.74.154>
	 <1084227992.14224.5.camel@localhost>
	 <1166.200.44.170.105.1084283379.squirrel@200.44.170.105>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1166.200.44.170.105.1084283379.squirrel@200.44.170.105>
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

On Tue, 2004-05-11 at 09:49, alucard@kanux.com wrote:
> Hi again
> 
>    I used a trace program and there are no packets going thru, and I scan
> the ports and there's no 8080 open, let me show you everything again
> 
> Here's my /etc/rc.d/rc.firewall
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
> #para el forward a la maquina compaq
> 
> echo 0 > /proc/sys/net/ipv4/ip_forward
> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -i eth0 -p tcp --dport 80 -j ACCEPT
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 8080 -j DNAT
> --to-destination 10.73.219.77:80
> echo 1 > /proc/sys/net/ipv4/ip_forward
> -----
> 
> Here's my nmap scan
> -----
> root@mail:~# nmap 10.73.219.156
> 
> Starting nmap 3.48 ( http://www.insecure.org/nmap/ ) at 2004-05-11 09:42 VET
> Interesting ports on mail.aeropostal.com.ve (10.73.219.156):
> (The 1651 ports scanned but not shown below are in state: filtered)
> PORT     STATE  SERVICE
> 21/tcp   closed ftp
> 22/tcp   open   ssh
> 25/tcp   open   smtp
> 80/tcp   open   http
> 143/tcp  open   imap
> 3306/tcp open   mysql
> 
> ------
> 
> As we can see, there's no 8080 port. We have to remember that the
> interface that is nat'ed' from the internet is the same one that's
> forwarding packets to 10.73.219.77. Do you think that this could be the
> reason? should I use a second card and use it to forward packets? Here's
> setup, the one I wrote on the first message
> 
> -----
> 
> - The linux box has only one NIC -and having a second one is not a
> problem- It functions as a web/mail server, and that means that I'm using
> 80 and 25 already. What i'd like to do is, access another internal
> webserver from the outside getting in using another port in the nat'ed'
> linux box.
> 
> 
> -------      -----------------      ----------------
> router |<--->|Linux box      |<---->|2nd WebServer |
> -------      |using web/mail |      |10.73.219.77  |
>              |10.73.219.156  |      ----------------
>              -----------------
> 
> -------------
> 
> Thanx a lot for your time...
> 
> Juan
Let me see if I understand this correctly.  The ISP router connects you
to the Internet but it know you as the RFC 1918 (private) address
10.73.219.156.  The router, Linux box and 2nd WebServer are all
connected on the same subnet through a hub or switch.  You want the
Linux box to change the packet addressed to it on 8080/tcp to 80/tcp
with a source address of 10.73.219.77 and then forward the packet to the
2nd WebServer?

I've never tried this but I'll take a few guesses on what happens and
why it is probably much safer to use a second NIC.  I would guess that
the packet 10.73.219.156:8080 arrives at the Linux box (can be verified
with Ethereal (www.ethereal.com)), is properly DNAT'd to 10.73.219.77:80
and then passed to the routing subsystem.  The routing subsystem looks
at the packet and sees that it lives on the same network as itself
(10.73.219.x) and thus does not forward the packet (can be verified by
putting a log rule at the beginning of both the INPUT and FORWARD chains
- my guess is it never arrives at the FORWARD chain).  Unless the Linux
box and the 2nd WebServer live on separate networks, routing will not
forward a packet from one to the other.

In other words, you are bridging rather than routing and thus need to
make a layer two decision rather than a layer three decision.  I
understand there is bridging functionality available in Linux but I have
never used it and do not know where to find it.

Alternately, you could subnet 10.73.219.x into two separate networks and
bind two addresses (one for each subnet) to the NIC in the Linux box.

However, I would suggest a separate NIC and a true DMZ.  I assume that
if someone within the ISP cloud attempted to attack 10.73.219.77 by
addressing it directly, there would be nothing to stop them.  The
packets would be forwarded from the ISP router to the 2nd WebServer.  I
would always set it up behind the firewall even though it uses an RFC
1918 address unless you have the utmost trust in both the ISP and all
users attached to their cloud.  Hope this helps - John
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


