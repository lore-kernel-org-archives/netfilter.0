From: "tinozaure" <tinozaure@netcourrier.com>
Subject: multilink using Cable and ADSL.
Date: Thu, 12 Dec 2002 16:00:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <015a01c2a1ef$3cb166b0$c800a8c0@tino>
References: <1039684623.4085.47.camel@rayw.knowledgefactory.co.za> <3DF86BDD.2090505@istitutocolli.org>
Mime-Version: 1.0
Content-Transfer-Encoding: Quoted-Printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello
I try to use a Cable ISP and ADSL ISP together on the same gateway to hav=
e
benefit from low latency cable and High Bandwith ADSL at the same time.

In this way I read lot of docs and essentialy the advanced routing HOWTO
which explain how to mark packets to route them on an interface or anothe=
r.

I tried the examples but these doesn't work.

My Goal is to use Cable for low latency application and ADSL for all othe=
r
applications.

I need some help to understand how to proceed to realise this.


This is my actual situation.
eth0=3D 192.168.1.254 (DMZ )
eth1=3D 192.168.0.254 (LAN)
eth2=3D dynamic public ip (Cable ISP)
ppp0=3D dynamic public ip (ADSL ISP)

This is my simple iptables script for NAT

----------------START---------------
IPTABLES=3D"/sbin/iptables"

echo "1" > /proc/sys/net/ipv4/ip_forward
echo "1" > /proc/sys/net/ipv4/ip_dynaddr
# Remise a Zero des regles du firewall au cas ou
$IPTABLES -F
$IPTABLES -t nat -F

echo Init des regles par defaut
$IPTABLES -P INPUT ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT


echo Debut des regles de filtrage

$IPTABLES -t nat -A POSTROUTING -s 192.168.0.0/23 -o ppp0 -j MASQUERADE

#Fin des regles de routage
echo "Firewall install=E9."
----------------END---------------

Thanks.


