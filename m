From: alucard@kanux.com
Subject: forwarding on the same NIC
Date: Mon, 10 May 2004 15:36:13 -0400 (VET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3401.200.44.170.105.1084217773.squirrel@200.44.170.105>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi there...

   I have been using netfilter for a while and now, I have to integrate
some other servers and somehow I can't get it to forward packets. Let
me explain mi scenario.

- Linux box, Address 10.73.219.156 nat'ed' from a real IP address from a
external router
- The linux box has only one NIC -and having a second one is not a
problem- It functions as a web/mail server, and that means that I'm using
80 and 25 already. What i'd like to do is, access another internal
webserver from the outside getting in using another port in the nat'ed'
linux box.


-------      -----------------      ----------------
router |<--->|Linux box      |<---->|2nd WebServer |
-------      |using web/mail |      |10.73.219.77  |
             |10.73.219.156  |      ----------------
             -----------------

And I think that, using something like this would make it happen but it
doesn't

-------------
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 8080 -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 8080 -j DNAT
--to-destination 10.73.219.77:80
--------------

I'm trying to use port 8080 to enter into the server and then forward it
to the other's server port 80 and it's not working. Here's my whole
script, which include some other services that I use perfectly.

--------------
iptables -F
iptables -X

echo "Habilitando politicas de negacion total de paquetes"

iptables -P FORWARD DROP
iptables -P INPUT DROP

echo "Reglas para paquetes de entrada y salida"

iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A INPUT -p tcp --dport 25 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

##internas
iptables -A INPUT -i eth0 -p tcp --dport 143 -j ACCEPT
iptables -A INPUT -i lo -p tcp --dport 143 -j ACCEPT
iptables -A INPUT -p tcp --dport 3306 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 110 -j ACCEPT

#para el forward a la maquina compaq

echo 0 > /proc/sys/net/ipv4/ip_forward
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 8080 -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 8080 -j DNAT \
--to-destination 10.73.219.77:80
echo 1 > /proc/sys/net/ipv4/ip_forward
--------------

Any suggestions would be really apreciated

Thanx a lot as usual...
Juan

