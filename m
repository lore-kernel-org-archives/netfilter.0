From: "Daniel Arjona" <darjona@transito.gob.pa>
Subject: HELP ME PLEASE!!!!!!!!!
Date: Tue, 26 Aug 2003 15:14:39 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002f01c36c0e$ae0e71b0$0221a0c0@DANIEL>
Reply-To: "Daniel Arjona" <darjona@transito.gob.pa>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hello:

I tried to configure an iptables firewall, but i can't.  I need cofigure
this to use FTP, Kazaa, Internet, ICQ and access the IMAP server of Netscape
with my Netscape Client.
I'm a Linux newbie.
Please Help me!!!

Observations:  iptables firewall, mail server and proxy server are installed
in the same server. It's not recomended, but i don`t have other choice.

Regards,

DANIEL ARJONA
PD:  SEE MY IPTABLES SCRIPT


## eth1 = my local interface
## eth0 = public network interface
## XXX.XXX.XXX.0/24 = My local subnet

## FLUSH
iptables -F
iptables -X
iptables -Z
iptables -t nat -F

## DEFAULT POLICIES
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P POSTROUTING ACCEPT

## LOCAL HOST
iptables -A INPUT -i lo -j ACCEPT


## ACCEPT ACCESS FROM THE LOCAL NETWORK & LOCAL INTERFACE
iptables -A INPUT -s XXX.XXX.XXX.0/24 -i eth1 -j ACCEPT

## SMTP Port
iptables -A INPUT -s 0.0.0.0/0 -p tcp --dport 25 -j ACCEPT

## POP3 Port
iptables -A INPUT -s 0.0.0.0/0 -p tcp --dport 110 -j ACCEPT

## FORWARDS TO HTTP PORT
iptables -A FORWARD -s XXX.XXX.XXX.0/24 -i eth1 -p tcp --dport 80 -j ACCEPT

## FORWARDS TO HTTPS PORT
iptables -A FORWARD -s XXX.XXX.XXX.0/24 -i eth1 -p tcp --dport 443 -j ACCEPT

## FORWARDS TO IMAP PORT
iptables -A FORWARD -s XXX.XXX.XXX.0/24 -i eth1 -p tcp --dport 143 -j ACCEPT

## FORWARDS TO KAZAA PORT
iptables -A FORWARD -s XXX.XXX.XXX.0/24 -i eth1 -p tcp --dport 1214 -j
ACCEPT

## FORWARD TO DNS QUERIES PORT
iptables -A FORWARD -s XXX.XXX.XXX.0/24 -i eth1 -p tcp --dport 53 -j ACCEPT
iptables -A FORWARD -s XXX.XXX.XXX.0/24 -i eth1 -p udp --dport 53 -j ACCEPT

## FORWARDS TO FTP PORT
iptables -A FORWARD -s XXX.XXX.XXX.0/24 -i eth1 -p tcp --dport 21 -j ACCEPT

## DENIED FORWARD FOR THE OTHERS PORTS
iptables -A FORWARD -s XXX.XXX.XXX.0/24 -i eth1 -j DROP

## MASQUERADING OF THE LOCAL NETWORK
iptables -t nat -A POSTROUTING -s XXX.XXX.XXX.0/24 -o eth0 -j MASQUERADE

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -A INPUT -s 0.0.0.0/0 -i eth0 -p tcp --dport 1:1024 -j DROP
iptables -A INPUT -s 0.0.0.0/0 -i eth0 -p udp --dport 1:1024 -j DROP

## CLOSE WEBMIN PORT
iptables -A INPUT -s 0.0.0.0/0 -i eth0 -p tcp --dport 10000 -j DROP

echo " OK . Verifique que lo que se aplica con: iptables -L -n"

# END



