From: gerardo arnaez <garnaez@gmail.com>
Subject: http connection hangs when connecting to forwarded IP
Date: Fri, 13 May 2005 10:27:44 -0700
Message-ID: <148eea710505131027505dc087@mail.gmail.com>
Reply-To: gerardo arnaez <garnaez@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org, garnaez@gmail.com

Hello.
Im using iptables to forward an entire Ip address

the set is

DSL <--->(eth1) Server A (eth0[192.168.1.1])<-->SWITCH<-->
[192.168.1.2](eth0)ServerB

ServerA listens on multiplle IP addresses
I want Server A to forward a specific IP addres to Server B as
if ServerB were directly connected to the internet

servA listens on 69.30.71.117 (alias eth1:1)=20
I want it to forward al requests on this IP to server B
Server B is 192.168.1.2

From reading and going on line
I have the follow iptables rules
but when I try to connect to 6930.71.117 via a port 80 from outside the sys=
tem
It just hangs.
Not sure where the trouble lays,
any help appreciated
the follw are my rules set

---------------------------
iptables -F
iptables -t nat -F
iptables -t mangle -F #ignore if you get an error here
iptables -X #deletes every non-builtin chain in the table
echo "table cleanup complete"

iptables -t nat -A PREROUTING -d 69.30.71.117 -j DNAT --to 192.168.1.2
iptables -t nat -A POSTROUTING -s 192.168.1.2 -j SNAT --to 69.30.71.117
echo "forward 69.30.71.117 to 192.168.1.2"


#THESE ARE ACCEPTED OR NOT FROM OUTBOUND
#iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
#echo "Open 8080"
#iptables -A INPUT -p tcp --dport 21 -j ACCEPT
#echo "Start FTP"
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
echo "Start SSH"
iptables -A INPUT -p tcp --dport 25 -j ACCEPT
echo "ALLOW OUTSIDE SMTP"
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
echo "ALLOW APACHE"
#iptables -A INPUT -p tcp --dport 110 -j ACCEPT
#echo "ALLOW POP3"
#iptables -A INPUT -p tcp --dport 443 -j ACCEPT
#echo "ALLOW APACHE SSL"
#iptables -A INPUT -p tcp --dport 5901 -j ACCEPT
#iptables -A INPUT -p tcp --dport 6001 -j ACCEPT
#echo "Open TIGHT VNC"

#Next Iptables This allows Mysql to work only on local connectionsa
iptables -A INPUT -i ! eth1 -p tcp --dport 3306 -j ACCEPT
echo "mySQL now limited to local connections"

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m state --state NEW -i ! eth1 -j ACCEPT

#THIS WILL FORWARD PACKETS FROM PUB TO LOCAL IF PREVIOUS ESTABLISHED
iptables -A FORWARD -i eth1 -o eth0 -m state --state
ESTABLISHED,RELATED -j ACCEPT

iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
echo "Both network cards in action"

# use this line if you have a static IP address from your ISP
# replace your static IP with x.x.x.x
#/sbin/iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to x.x.x.x
# use this line only if you have dynamic IP address from your ISP
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
echo "Masquerade! Paper faces on parade. Masquerade--hide your face
where the world will never find you."

iptables -A INPUT -i eth1 -m state --state NEW,INVALID -j DROP
iptables -A FORWARD -i eth1 -m state --state NEW,INVALID -j DROP
echo "STOP NEW PACKETS FROM COMING IN THAT DONT MEET RULES ABOVE"

#These two lines below dont work when I turn them on
#Need to have it work with psad
#iptables -A FORWARD -j LOG --log-prefix "DROP "
#iptables -A FORWARD -j DROP

echo 1 > /proc/sys/net/ipv4/ip_forward
echo "ALL DONE, Any ERRORS?"

