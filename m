From: Sebastian Rodriguez <sniper.mdr@gmail.com>
Subject: Problem with Forward
Date: Tue, 8 Mar 2005 18:36:19 +0000
Message-ID: <8568e72d050308103614b8fa93@mail.gmail.com>
Reply-To: Sebastian Rodriguez <sniper.mdr@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

First of all, little description of my situation.
I am in a Hight school room, where we acces to the lan via a proxy.
I have also behind the school connection and adsl connection (ppp0)
I am using a Server (connected to the school lan, to the adsl and to
my computer) to determine the connection I use. I 've set up iptables
rules who works fine for me.
I wanted also to share my connection with a friend.=20
The problem is that I dont want to give him ful acces to the adsl
connection (don't want him to use emule or Bittorrent, for eg)
If I give him full acces to my connection, everything is all right,
but if I put my restrictions, he can't even go to IRC.
His configuration is: he puted my server as a gateway, and he put the
official internal ip and dns.
the strange part its that if I give him full rigths, establish
conection and after put therestrictions on (commenting the general
forward line) the connection works (he can only use bnet and irc as i
wanted, but not BT)
Maybe it's just a stupid errr, but i don't understand what is wrong :'(
here is my "little" script:


-- #!/bin/sh

#-------------------------------------------------
#eth0--> 00:0C:6E:2B:CF:94   Internal LAN (my Pc to server) IP fixe
#eth1--> 00:02:44:29:C7:45    School LAN DHCPD
#eth2--> 00:26:54:0C:04:18    ADSL
#-------------------------------------------------

# Configuration des routes
route del default gw 10.133.15.254
route add -host 10.133.15.254 dev eth1
route add -net 10.0.0.0/8 gw 10.133.15.254
route add -net 192.168.2.0/24 gw 10.133.15.254
route add default gw 84.97.32.1

# On efface tout
iptables -F
iptables -t nat -F
# Regles pour le NAT
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -d 10.0.0.0/8 -o eth1
-j MASQUERADE
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -d 192.168.2.0/24 -o
eth1 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o ppp0 -j MASQUERADE

# Anti Ping OF Death
iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit
1/s -j ACCEPT
#---------------------------
# ETH1
#--------------------------
# Refuser les ports sur eth1
iptables -A INPUT -i eth1 -m state --state NEW,INVALID -j REJECT
iptables -A FORWARD -i eth1 -m state --state NEW,INVALID -j REJECT

#Ouverture de ports
iptables -I INPUT -i eth1 -p tcp --dport 80 -j ACCEPT
iptables -I INPUT -i eth1 -p udp --dport 80 -j ACCEPT
iptables -I INPUT -i eth1 -p tcp --dport 20:21 -j ACCEPT
iptables -I INPUT -i eth1 -p udp --dport 20:21 -j ACCEPT
iptables -I INPUT -i eth1 -p tcp --dport 6666:6670 -j ACCEPT
iptables -I INPUT -i eth1 -p tcp --dport 7000 -j ACCEPT

#---------------------------
# PPP0
#--------------------------

# Refuser les ports sur ppp0
iptables -A INPUT -i ppp0 -m state --state NEW,INVALID -j DROP
iptables -A FORWARD -i ppp0 -m state --state NEW,INVALID -j DROP

#Ouverture de ports
iptables -I INPUT -i ppp0 -p tcp --dport 80 -j ACCEPT
iptables -I INPUT -i ppp0 -p udp --dport 80 -j ACCEPT
iptables -I INPUT -i ppp0 -p tcp --dport 20:21 -j ACCEPT
iptables -I INPUT -i ppp0 -p udp --dport 20:21 -j ACCEPT
iptables -I INPUT -i eth1 -p tcp --dport 6666:6670 -j ACCEPT
iptables -I INPUT -i eth1 -p tcp --dport 7000 -j ACCEPT
iptables -I INPUT -i eth1 -p tcp --dport 4000 -j ACCEPT
iptables -I INPUT -i eth1 -p tcp --dport 6112:6119 -j ACCEPT
iptables -I INPUT -i eth1 -p udp --dport 4000 -j ACCEPT
iptables -I INPUT -i eth1 -p udp --dport 6112:6119 -j ACCEPT

#-------------------------
# Routage Programmes
#------------------------
# Partage Direct Connect
iptables -I FORWARD -i eth1 -p tcp --dport 4120:4121 -j ACCEPT
iptables -I FORWARD -i eth1 -p udp --dport 4120:4121 -j ACCEPT
iptables -A PREROUTING -t nat -i eth1 -p tcp --dport 4120 -j DNAT --to
192.168.1.111:4120
iptables -A PREROUTING -t nat -i eth1 -p tcp --dport 4121 -j DNAT --to
192.168.1.111:4121
iptables -A PREROUTING -t nat -i eth1 -p udp --dport 4120 -j DNAT --to
192.168.1.111:4120
iptables -A PREROUTING -t nat -i eth1 -p udp --dport 4121 -j DNAT --to
192.168.1.111:4121

# Routage Emule
iptables -I FORWARD -i ppp0 -p tcp --dport 4662 -j ACCEPT
iptables -I FORWARD -i ppp0 -p udp --dport 4672 -j ACCEPT
iptables -I FORWARD -i ppp0 -p udp --dport 4665 -j ACCEPT
iptables -A PREROUTING -t nat -i ppp0 -p tcp --dport 4662 -j DNAT --to
192.168.1.111:4662
iptables -A PREROUTING -t nat -i ppp0 -p udp --dport 4672 -j DNAT --to
192.168.1.111:4672
iptables -A PREROUTING -t nat -i ppp0 -p udp --dport 4665 -j DNAT --to
192.168.1.111:4665

# Routage BitTorrent
iptables -I FORWARD -i ppp0 -p tcp --dport 6881:6889 -j ACCEPT
iptables -I FORWARD -i ppp0 -p udp --dport 6881:6889 -j ACCEPT
iptables -A PREROUTING -t nat -i ppp0 -p tcp --dport 6881 -j DNAT --to
192.168.1.111:6881
iptables -A PREROUTING -t nat -i ppp0 -p tcp --dport 6882 -j DNAT --to
192.168.1.111:6882
iptables -A PREROUTING -t nat -i ppp0 -p tcp --dport 6883 -j DNAT --to
192.168.1.111:6883
iptables -A PREROUTING -t nat -i ppp0 -p tcp --dport 6884 -j DNAT --to
192.168.1.111:6884
iptables -A PREROUTING -t nat -i ppp0 -p tcp --dport 6885 -j DNAT --to
192.168.1.111:6885
iptables -A PREROUTING -t nat -i ppp0 -p tcp --dport 6886 -j DNAT --to
192.168.1.111:6886
iptables -A PREROUTING -t nat -i ppp0 -p tcp --dport 6887 -j DNAT --to
192.168.1.111:6887
iptables -A PREROUTING -t nat -i ppp0 -p tcp --dport 6888 -j DNAT --to
192.168.1.111:6888
iptables -A PREROUTING -t nat -i ppp0 -p tcp --dport 6889 -j DNAT --to
192.168.1.111:6889

#-----------------------------------
#Partage nk IP:10.133.8.1
#------------------------#-----------------------------------
#Partage nk IP:10.133.8.1
#----------------------------------
#Regles Generales
iptables -I INPUT -i eth1 -s 10.133.8.1 -j ACCEPT
#iptables -t nat -A POSTROUTING -s 10.133.8.1/32 -d 192.168.2.0/24 -o
eth1 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.133.8.1 -o ppp0 -j MASQUERADE
#iptables -I FORWARD -i eth1 -s 10.133.8.1 -j ACCEPT

#IRC
iptables -I FORWARD -i eth1 -s 10.133.8.1 -p tcp --dport  6666:6670 -j ACCE=
PT
iptables -I FORWARD -i eth1 -s 10.133.8.1 -p tcp --dport  7000 -j ACCEPT
iptables -I FORWARD -i eth1 -s 10.133.8.1 -p udp --dport  6666:6670 -j ACCE=
PT
iptables -I FORWARD -i eth1 -s 10.133.8.1 -p udp --dport  7000 -j ACCEPT

#Battle.net
iptables -I FORWARD -i eth1 -s 10.133.8.1 -p tcp --dport  4000 -j ACCEPT
iptables -I FORWARD -i eth1 -s 10.133.8.1 -p udp --dport  4000 -j ACCEPT
iptables -I FORWARD -i eth1 -s 10.133.8.1 -p tcp --dport  6112:6119 -j ACCE=
PT
iptables -I FORWARD -i eth1 -s 10.133.8.1 -p udp --dport  6112:6119 -j ACCE=
PT

iptables -I FORWARD -i eth1 -s 10.133.8.1 -p tcp --dport  20:21 -j ACCEPT
iptables -I FORWARD -i eth1 -s 10.133.8.1 -p udp --dport  20:21 -j ACCEPT
iptables -I FORWARD -i eth1 -s 10.133.8.1 -p tcp --dport  80 -j ACCEPT
iptables -I FORWARD -i eth1 -s 10.133.8.1 -p udp --dport  80 -j ACCEPT


Thxs for your answers :D


----------

S=E9bastien Rodriguez

