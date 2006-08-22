From: =?ISO-8859-1?Q?Per_J=F8rgensen?= <pj4a@dmusyd.edu>
Subject: Problem about LAN/DMZ
Date: Tue, 22 Aug 2006 21:32:26 +0200
Message-ID: <44EB5BCA.2010504@dmusyd.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hey Netfilter!
I have been studying netfilter for several days now for building my own=20
firewall. But have ran into a problem and goes like this:
The machine Soekris 4801 Debian Sarge is my firewall
eth0 --> WAN --> Directly connected to the internet
eth1 --> LAN --> 172.16.0.0/24 --> eth1 address 0.1
eth2 --> DMZ --> 172.16.10.0/24 --> eth2 address 10.1
I have installed bind and are running perfectly and NSLOOKUP are showing=20
the coorectly things
In the zone file I have named the servers with their external IP.

The IPTABLES script are an bash file with these rules for:
the interfaces:
lan:
$IPTABLES -A INPUT -i $LAN -m state --state NEW -j ACCEPT
dmz:
$IPTABLES -A dmz -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A dmz -s $LAN_NET -m state --state NEW -j ACCEPT
wan:
$IPTABLES -A wan -m state --state ESTABLISHED,RELATED -j ACCEPT

The connections:
lantowan:
$IPTABLES -A lantowan -s $LAN_NET -j ACCEPT
lantodmz:
$IPTABLES -A lantodmz -s $LAN_NET -j ACCEPT
dmztolan:
$IPTABLES -A dmztolan -o $LAN -m state --state ESTABLISHED,RELATED -j ACC=
EPT
dmztowan:
$IPTABLES -A dmztolan -i $DMZ -o $WAN -p tcp --dport 25 -j ACCEPT
$IPTABLES -A dmztowan -o $WAN -m state --state ESTABLISHED,RELATED -j=20
ACCEPT
wantolan:
$IPTABLES -A wantolan -m state --state ESTABLISHED,RELATED -j ACCEPT
wantodmz:
## HTTP ##
$IPTABLES -t nat -A PREROUTING -d $WAN_IP -p tcp --dport 80 -j DNAT=20
--to-destination $ATLANTIS:80
$IPTABLES -A wantodmz -d $ATLANTIS -p tcp --dport 80 -j ACCEPT
## SSH ##
$IPTABLES -t nat -A PREROUTING -d $WAN_IP -p tcp --dport 22 -j DNAT=20
--to-destination $ATLANTIS:22
$IPTABLES -A wantodmz -s $SSH -d $ATLANTIS -p tcp --dport 22 -j ACCEPT
## SMTP ##
$IPTABLES -t nat -A PREROUTING -d $WAN_IP -p tcp --dport 25 -j DNAT=20
--to-destination $ATLANTIS:25
$IPTABLES -A wantodmz -d $ATLANTIS -p tcp --dport 25 -j ACCEPT
## IMAP ##
$IPTABLES -t nat -A PREROUTING -d $WAN_IP -p tcp --dport 143 -j DNAT=20
--to-destination $ATLANTIS:143
$IPTABLES -A wantodmz -d $ATLANTIS -p tcp --dport 143 -j ACCEPT

the masquerade:
$IPTABLES -t nat -A POSTROUTING -s $DMZ_NET -o $WAN -j SNAT --to-source=20
$WAN_IP
$IPTABLES -t nat -A POSTROUTING -s $LAN_NET -o $WAN -j SNAT --to-source=20
$WAN_IP

Apending the chains:
$IPTABLES -A INPUT -i $WAN -j wan
$IPTABLES -A INPUT -i $LAN -j lan
$IPTABLES -A INPUT -i $DMZ -j dmz
$IPTABLES -A FORWARD -i $WAN -o $DMZ -j wantodmz
$IPTABLES -A FORWARD -i $WAN -o $LAN -j wantolan
$IPTABLES -A FORWARD -i $DMZ -o $WAN -j dmztowan
$IPTABLES -A FORWARD -i $DMZ -o $LAN -j dmztolan
$IPTABLES -A FORWARD -i $LAN -o $DMZ -j lantodmz
$IPTABLES -A FORWARD -i $LAN -o $WAN -j lantowan

The funny part is that it was working earliere today - And afterwards=20
setting it all up - I did a reboot  and deleted the uncommented lines =20
-  (And perhaps  deleted an role) I have lost the look for where this=20
should be - and hopefully I'll be able to get some help here????
Thanks

--=20
-----------------------------
Med Venlig Hilsen
Per J=F8rgensen
Stud. datamatiker
Datamatiker udd. CEUS
pj4a@dmusyd.edu


