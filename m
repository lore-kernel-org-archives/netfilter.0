From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: HELP ME PLEASE!!!!!!!!!
Date: Wed, 27 Aug 2003 08:52:44 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0192FE@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Daniel Arjona <darjona@transito.gob.pa>, netfilter@lists.netfilter.org

Firstly, using "!!!!!!" gets you nowhere.
Now, if your firewall doesn't work.. follow the rules of "KISS" (Keep It =
Simple Stupid) which everybody knows.

Remove all the protection of the internal IPs and dropping in the =
FORWARD chain and put some LOGging rule to see which are being droped =
and why...

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

-----Original Message-----
From: Daniel Arjona [mailto:darjona@transito.gob.pa]
Sent: Wednesday, August 27, 2003 6:15 AM
To: netfilter@lists.netfilter.org
Subject: HELP ME PLEASE!!!!!!!!!


Hello:

I tried to configure an iptables firewall, but i can't.  I need cofigure
this to use FTP, Kazaa, Internet, ICQ and access the IMAP server of =
Netscape
with my Netscape Client.
I'm a Linux newbie.
Please Help me!!!

Observations:  iptables firewall, mail server and proxy server are =
installed
in the same server. It's not recomended, but i don`t have other choice.

Regards,

DANIEL ARJONA
PD:  SEE MY IPTABLES SCRIPT


## eth1 =3D my local interface
## eth0 =3D public network interface
## XXX.XXX.XXX.0/24 =3D My local subnet

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
iptables -A FORWARD -s XXX.XXX.XXX.0/24 -i eth1 -p tcp --dport 80 -j =
ACCEPT

## FORWARDS TO HTTPS PORT
iptables -A FORWARD -s XXX.XXX.XXX.0/24 -i eth1 -p tcp --dport 443 -j =
ACCEPT

## FORWARDS TO IMAP PORT
iptables -A FORWARD -s XXX.XXX.XXX.0/24 -i eth1 -p tcp --dport 143 -j =
ACCEPT

## FORWARDS TO KAZAA PORT
iptables -A FORWARD -s XXX.XXX.XXX.0/24 -i eth1 -p tcp --dport 1214 -j
ACCEPT

## FORWARD TO DNS QUERIES PORT
iptables -A FORWARD -s XXX.XXX.XXX.0/24 -i eth1 -p tcp --dport 53 -j =
ACCEPT
iptables -A FORWARD -s XXX.XXX.XXX.0/24 -i eth1 -p udp --dport 53 -j =
ACCEPT

## FORWARDS TO FTP PORT
iptables -A FORWARD -s XXX.XXX.XXX.0/24 -i eth1 -p tcp --dport 21 -j =
ACCEPT

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




