From: "Ferry van Steen" <ferry.van.steen@infopart.nl>
Subject: RE: (no subject)
Date: Mon, 9 Sep 2002 14:07:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001101c257f9$71148a80$1be02a0a@infopart.nl>
References: <000201c25717$ce09ac80$0201a8c0@Operator>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000201c25717$ce09ac80$0201a8c0@Operator>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: 'saki' <saki@sunsilk.econet-cyber.com>
Cc: netfilter@lists.netfilter.org

Ok, I never tried this but you could try these....
Also .30 and .45 can=92t be used. They=92re the network and broadcast
respectively

Assuming eth0 is local net, ppp0 internet interface. Also, I don't allow
the firewall/nat box to go onto the internet. If you want that you'll
have to make lines for it. This is EXTREMELY!! basic.

iptables -F
iptables -t nat -F

iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -P OUTPUT ACCEPT
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

iptables -A INPUT -s 127.0.0.1/8  -d 127.0.0.1/8 -i lo -j ACCEPT
iptables -A OUTPUT -s 127.0.0.1/8 -d 127.0.0.1/8 -o lo -j ACCEPT

iptables -A FORWARD -s 192.168.1.0/24 -d 0/0 -i eth0 -o ppp+ -m state
--state NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -s 0/0 -d 192.168.1.0/24 -i ppp+ -o eth0 -m state
--state RELATED,ESTABLISHED -j ACCEPT

iptables -A POSTROUTING -s 192.168.1.1 -o ippp+ -j SNAT --to-source
202.47.12.31
iptables -A POSTROUTING -s 192.168.1.2 -o ippp+ -j SNAT --to-source
202.47.12.31
iptables -A POSTROUTING -s 192.168.1.3 -o ippp+ -j SNAT --to-source
202.47.12.31
iptables -A POSTROUTING -s 192.168.1.4 -o ippp+ -j SNAT --to-source
202.47.12.31=20
iptables -A POSTROUTING -s 192.168.1.5 -o ippp+ -j SNAT --to-source
202.47.12.32
iptables -A POSTROUTING -s 192.168.1.6 -o ippp+ -j SNAT --to-source
202.47.12.32
iptables -A POSTROUTING -s 192.168.1.7 -o ippp+ -j SNAT --to-source
202.47.12.32
iptables -A POSTROUTING -s 192.168.1.8 -o ippp+ -j SNAT --to-source
202.47.12.32
iptables -A POSTROUTING -s 192.168.1.9 -o ippp+ -j SNAT --to-source
202.47.12.33
iptables -A POSTROUTING -s 192.168.1.10 -o ippp+ -j SNAT --to-source
202.47.12.33
iptables -A POSTROUTING -s 192.168.1.11 -o ippp+ -j SNAT --to-source
202.47.12.33
iptables -A POSTROUTING -s 192.168.1.12 -o ippp+ -j SNAT --to-source
202.47.12.33
iptables -A POSTROUTING -s 192.168.1.13 -o ippp+ -j SNAT --to-source
202.47.12.34
iptables -A POSTROUTING -s 192.168.1.14 -o ippp+ -j SNAT --to-source
202.47.12.34
iptables -A POSTROUTING -s 192.168.1.15 -o ippp+ -j SNAT --to-source
202.47.12.34
iptables -A POSTROUTING -s 192.168.1.16 -o ippp+ -j SNAT --to-source
202.47.12.34
iptables -A POSTROUTING -s 192.168.1.17 -o ippp+ -j SNAT --to-source
202.47.12.35
iptables -A POSTROUTING -s 192.168.1.18 -o ippp+ -j SNAT --to-source
202.47.12.35
iptables -A POSTROUTING -s 192.168.1.19 -o ippp+ -j SNAT --to-source
202.47.12.35
iptables -A POSTROUTING -s 192.168.1.20 -o ippp+ -j SNAT --to-source
202.47.12.35
iptables -A POSTROUTING -s 192.168.1.21 -o ippp+ -j SNAT --to-source
202.47.12.36
iptables -A POSTROUTING -s 192.168.1.22 -o ippp+ -j SNAT --to-source
202.47.12.36
iptables -A POSTROUTING -s 192.168.1.23 -o ippp+ -j SNAT --to-source
202.47.12.36
iptables -A POSTROUTING -s 192.168.1.24 -o ippp+ -j SNAT --to-source
202.47.12.36
iptables -A POSTROUTING -s 192.168.1.25 -o ippp+ -j SNAT --to-source
202.47.12.37
iptables -A POSTROUTING -s 192.168.1.26 -o ippp+ -j SNAT --to-source
202.47.12.37
iptables -A POSTROUTING -s 192.168.1.27 -o ippp+ -j SNAT --to-source
202.47.12.37
iptables -A POSTROUTING -s 192.168.1.28 -o ippp+ -j SNAT --to-source
202.47.12.37
iptables -A POSTROUTING -s 192.168.1.29 -o ippp+ -j SNAT --to-source
202.47.12.38
iptables -A POSTROUTING -s 192.168.1.30 -o ippp+ -j SNAT --to-source
202.47.12.38
iptables -A POSTROUTING -s 192.168.1.31 -o ippp+ -j SNAT --to-source
202.47.12.38
iptables -A POSTROUTING -s 192.168.1.32 -o ippp+ -j SNAT --to-source
202.47.12.38
iptables -A POSTROUTING -s 192.168.1.33 -o ippp+ -j SNAT --to-source
202.47.12.39
iptables -A POSTROUTING -s 192.168.1.34 -o ippp+ -j SNAT --to-source
202.47.12.39
iptables -A POSTROUTING -s 192.168.1.35 -o ippp+ -j SNAT --to-source
202.47.12.39
iptables -A POSTROUTING -s 192.168.1.36 -o ippp+ -j SNAT --to-source
202.47.12.39
iptables -A POSTROUTING -s 192.168.1.37 -o ippp+ -j SNAT --to-source
202.47.12.40
iptables -A POSTROUTING -s 192.168.1.38 -o ippp+ -j SNAT --to-source
202.47.12.40
iptables -A POSTROUTING -s 192.168.1.39 -o ippp+ -j SNAT --to-source
202.47.12.40
iptables -A POSTROUTING -s 192.168.1.40 -o ippp+ -j SNAT --to-source
202.47.12.40
iptables -A POSTROUTING -s 192.168.1.41 -o ippp+ -j SNAT --to-source
202.47.12.41
iptables -A POSTROUTING -s 192.168.1.42 -o ippp+ -j SNAT --to-source
202.47.12.41
iptables -A POSTROUTING -s 192.168.1.43 -o ippp+ -j SNAT --to-source
202.47.12.41
iptables -A POSTROUTING -s 192.168.1.44 -o ippp+ -j SNAT --to-source
202.47.12.41
iptables -A POSTROUTING -s 192.168.1.45 -o ippp+ -j SNAT --to-source
202.47.12.42
iptables -A POSTROUTING -s 192.168.1.46 -o ippp+ -j SNAT --to-source
202.47.12.42
iptables -A POSTROUTING -s 192.168.1.47 -o ippp+ -j SNAT --to-source
202.47.12.42
iptables -A POSTROUTING -s 192.168.1.48 -o ippp+ -j SNAT --to-source
202.47.12.42
iptables -A POSTROUTING -s 192.168.1.49 -o ippp+ -j SNAT --to-source
202.47.12.43
iptables -A POSTROUTING -s 192.168.1.50 -o ippp+ -j SNAT --to-source
202.47.12.43

And 6 future hosts left to connect...

Met vriendelijke groet,

Ferry van Steen
InfoPart Automatisering B.V.
Beeksestraat 24
4841 GC Prinsenbeek
Tel: 076 - 5 44 04 11
Fax: 076 - 5 41 83 51
Mobiel: 06 - 28 46 47 45
E-Mail (zaak): ferry.van.steen@infopart.nl
E-Mail (prive): freaky@bananateam.nl
MSN Messenger: freaky@freaky2000.dyndns.org
ICQ (UIN (zelden gebruikt)): 191458

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of saki
Sent: dinsdag 20 augustus 2002 22:56
To: netfilter@lists.samba.org
Subject: (no subject)

hello=A0 i have internet cafe with 50 client and 1 server with 16 public
address
client1, client2, client3, client4 =A0exit to ip.public.no.1=A0=20
client5, client6, client7, client8 =A0exit to ip.public.no.2=A0=20
client9, client10, client11, client12 =A0exit to ip.public.no.3
........
........
client ip address 192.168.1.1 - 192.168.1.50
public ip address 202.47.12.30 - 202.47.12.45
=A0
any one can help ?
i have installed redhat7.2 for server


