From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ARP Requests/Replies
Date: Sun, 27 Jun 2010 01:17:14 +0200
Message-ID: <4C268A7A.6090207@plouf.fr.eu.org>
References: <4C26154B.8050008@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C26154B.8050008@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Jonathan Tripathy a =E9crit :
>=20
> I'm trying to set up ebtables on my Xen host. What I'm trying to do, =
is=20
> make sure that each guest can only access the bridge on the xen host=20
> using the "legal" mac address assigned to it.
>=20
> The 2 rules I'm using are this:
>=20
> ebtables -I FORWARD -d $legal_mac_of_guest -o $vif_of_guest -j ACCPET
> ebtables -I FORWARD -s $legal_mac_of_guest -i $vif_of_guest -j ACCPET

Note : s/ACCPET/ACCEPT/

> While the above 2 rules do allow normal IP traffic, they seem to bloc=
k=20
> ARP requests/replies working properly.

By allowing only the unicast host address as a destination, you block
any broadcast and multicast traffic. ARP requests use broadcast, IPv6
neighbour discovery uses multicast. Note that IP broadcast and multicas=
t
traffic is also blocked.

You must also allow broadcast/multicast addresses as a destination :

ebtables -I FORWARD -d multicast -o $vif_of_guest -j ACCEPT
