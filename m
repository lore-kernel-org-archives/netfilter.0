From: "Jean-Michel CARICAND" <CARICAND.Jean-Michel@wanadoo.fr>
Subject: Iptables don't understand network address
Date: Tue, 09 Jul 2002 09:03:00 +0200 (MET DST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <agduba$sv8$2@main.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
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
To: "netfilter@lists.samba.org" <netfilter@lists.samba.org>

I have a local network with 10.0.2.0 address and 255.255.254.0 netmask. 
 
My firewall have IP 10.0.2.130 on eth0. 
My station have IP 10.0.2.2.

I configure my firewall for drop the ping from the station with 1 rules :=


# iptables -A INPUT -i eth0 -s 10.0.2.2 -p icmp -j DROP 

When I ping the firewall from my station (ping 10.0.2.130) , I receive an=
 response from the serveur 

Why =3F
 
What is the problem =3F My netmask =3F
 
If i modify my netmask to 255.0.0.0 on firewall and my station, the ping =
doesn't work. Normal !
 
Iptables don't understand network address not in class A, B or C 
 
HELP ME !!!




