From: Patrick Petermair <captain.nuke@gmx.at>
Subject: Re: Url not found ....
Date: Sun, 7 Jul 2002 00:49:56 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207070049.56748.captain.nuke@gmx.at>
References: <EPEHIDPIPEBFNAHLCHPGAEMJCEAA.dennis@core-enterprises.com> <200207070003.11633.captain.nuke@gmx.at> <20020706220349.HAZV16050.mta01-svc.ntlworld.com@there>
Reply-To: captain.nuke@gmx.at
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020706220349.HAZV16050.mta01-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Mailing List <netfilter@lists.samba.org>

Am Sonntag, 7. Juli 2002 00:03 schrieb Antony Stone:

> What are the logging rules on your firewall ?

[....]
$IPTABLES -P INPUT DROP
$IPTABLES -F INPUT=20
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT=20
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD=20
$IPTABLES -t nat -F

#Allow only existing and related to INPUT
$IPTABLES -A INPUT -i $EXTIF -m state --state ESTABLISHED,RELATED -j ACCE=
PT

#Allow int. LAN to access firewall
$IPTABLES -A INPUT -i $INTIF -j ACCEPT

#Allow ADSL modem to talk to firewall (authentication)
$IPTABLES -A INPUT -i eth0 -s 10.0.0.138 -d 10.0.0.150 -j ACCEPT

#Allow loopback
$IPTABLES -A INPUT -i lo -s 127.0.0.1 -d 127.0.0.1 -j ACCEPT

#Log the rest
$IPTABLES -A INPUT -j LOG

#FWD: Allow all connections OUT and only existing and related ones IN
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state ESTABLISHED,REL=
ATED=20
-j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -j LOG

#Enable masquerading
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE


The thing is that I get those log entries only at that specific page=20
(stud4.tuwien.ac.at)...

Regards,
Patrick




