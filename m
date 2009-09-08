From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Using IPTables to route both dynamic local address and static
 addresses provided by ISP?
Date: Tue, 08 Sep 2009 10:58:37 +0200
Message-ID: <4AA61CBD.8020003@plouf.fr.eu.org>
References: <2b4d96e00909061414v270d580i56e1613d75886f4@mail.gmail.com>	 <4AA4D2EC.4030801@plouf.fr.eu.org> <2b4d96e00909070951r2c2003f0of1c916b34877da0f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2b4d96e00909070951r2c2003f0of1c916b34877da0f@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Gregory Ray <gregr@seekmobileinteractive.com>
Cc: netfilter@vger.kernel.org

Gregory Ray a =E9crit :
> Yes, sorry for the confusion and my newbness, I am using a linux box
> (Ubuntu distro) as a DHCP server. I have eth0 to internet via pppoe
> (high speed fiber).
>=20
> The second option sounds best since I already have the public
> addresses assigned to the server but I don't know what to assign to i=
t
> for a gateway.
>=20
> The ISP provided us with 8 or 10 (I forget exactly how many) public
> IPs. I have the servers (two of them) plugged directly into the switc=
h
> (which is plugged into the linux box).

It is probably a block of 8 addresses, i.e. /29 (29-bit is the prefix
length, netmask 255.255.255.248). Minus the two reserved network and
broadcast addresses and one address for the router box, this leaves 5
addresses available for your servers.

Example with the block 192.0.2.0/29 :
Address range :  192.0.2.0 - 192.0.2.7
Network address : 192.0.2.0
Broadcast address : 192.0.2.7
Host range : 192.0.2.1 - 192.0.2.6
Router address : 192.0.2.1 (could be any address in the host range)
Server range : 192.0.2.2 - 192.0.2.6

On the router box, you add the address 192.0.2.1 with prefix length /29
or netmask 255.255.255.248 to the LAN interface. This address will be
used as the default gateway by servers. The router box LAN interface
will have two addresses, one in the private subnet used by the
workstations and one in the public subnet used by servers.

On each server, you add an available address in the range 192.0.2.2 -
192.0.2.6 with prefix length /29 or netmask 255.255.255.248 and default
gateway 192.0.2.1.

Make sure that the SNAT/MASQUERADE iptables rule matches only the
private addresses, not the public ones.

> I then have multiple wireless
> routers also plugged into the switch to provide internet access over
> wifi to different parts of the building (around 20 workstations in
> total).

Wireless routers or access points (transparent wireless-ethernet bridge=
s) ?
