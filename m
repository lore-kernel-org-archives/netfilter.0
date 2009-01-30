From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ebtables filtering inside vlan.
Date: Fri, 30 Jan 2009 16:28:48 +0100
Message-ID: <49831CB0.80400@plouf.fr.eu.org>
References: <8ffbf9ad0901300309g6b063d43v48de5ced397f4bb9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8ffbf9ad0901300309g6b063d43v48de5ced397f4bb9@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: aras as <arunelis007@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

aras as a =E9crit :
>=20
> Is it possible to use ebtables to filter arp or ip packages in
> different vlan's. I don't wont to create seperate vlan interface like
> eth0.2 eth0.3 ....  for every VLAN going through the bridge because i
> have 148 vlans going through it.

man ebtables
/vlan

says it is possible using the vlan match extensions. However it may not=
=20
be possible to use IPv4 or ARP specific match extensions. For IPv4 or=20
ARP-specific filtering you may enable bridge-nf to pass VLAN-tagged IPv=
4=20
and ARP packets to iptables and arptables respectively.
