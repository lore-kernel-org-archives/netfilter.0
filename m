From: alucard@kanux.com
Subject: RE: forwarding
Date: Tue, 18 May 2004 14:50:03 -0400 (VET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1563.192.168.74.21.1084906203.squirrel@192.168.74.21>
References: <7C9884991ADAE0479C14F10C858BCDF567934A@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF567934A@alderaan.smgtec.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Daniel Chemko <dchemko@smgtec.com>
Cc: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>, netfilter@lists.netfilter.org

> iptables -t nat -A POSTROUTING --destination ${server2} -j SNAT --to
> ${server1_internal_ip}
>
> This is the last time I try to respond to you since you've been ignoring
> the rest. SNAT traffic from server 1 to server 2. Period. There's no
> magic. Put it in, then the system will magically work. Well, replace the
> ${}'s with the actual values first.
>

Dude, is not that I wasn't reading or not paying attention to your posts,
I really apreciate them, it=B4s just that -and this is why I like this list
so much- that I had a LOT of replys trying to help. For what I can see
now, I have to be doing something VERY stupid that is not allowing me to
do what I need so, I'm sending -again- my script mixed with your
recommendations for you to read it and suggest something

-----
echo "Borrando posibles reglas anteriores..."
iptables -F
iptables -X

echo "Habilitando politicas de negacion total de paquetes"

iptables -P FORWARD DROP
iptables -P INPUT DROP

echo "Reglas para paquetes de entrada y salida"

iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

#iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A INPUT -p tcp --dport 25 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
#iptables -A INPUT -p tcp --dport 8080 -j ACCEPT

##internas
iptables -A INPUT -i eth0 -p tcp --dport 143 -j ACCEPT
iptables -A INPUT -i lo -p tcp --dport 143 -j ACCEPT
iptables -A INPUT -p tcp --dport 3306 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 110 -j ACCEPT

#para el forward
echo 0 > /proc/sys/net/ipv4/ip_forward
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 80 -j ACCEPT
iptables -t nat -A PREROUTING -d 10.73.219.156 -p tcp --dport 8080 \
    -j DNAT --to-destination 192.168.0.2:80
echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -t nat -A POSTROUTING --destination 192.168.0.2 -j SNAT --to \
10.73.219.156
-----

Thanx a lot again for this great help

Peace
Juan
Programmin' Python is like sugar... Sweet! ;)

