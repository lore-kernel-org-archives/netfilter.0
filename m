From: David Trott <linux@davidtrott.com>
Subject: Re: 3 part firewall
Date: Wed, 21 May 2003 03:35:04 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053513304.3ecb56581fbec@www.mailshell.com>
References: <200305202342.51581.robert.cole@support4linux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200305202342.51581.robert.cole@support4linux.com>
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
To: "robert.cole@support4linux.com" <robert.cole@support4linux.com>
Cc: netfilter@lists.netfilter.org

Hi Robert,

A strategy that might work is to get the NAT and routing working first
then lock everything down.

Assuming:
Your external IP range is: 1.2.3.*
Your internal IP range is: 10.*.*.*
Your DMZ IP range is: 192.168.1.*

And your interface addresses are:
eth0: 1.2.3.1
eth1: 10.1.1.1
eth2: 192.168.1.1

I would try the following.

--- Begin ---

#!/bin/sh

# Disable the filter till we get things working
iptables -t filter -F
iptables -t filter -P INPUT        ACCEPT
iptables -t filter -P FORWARD      ACCEPT
iptables -t filter -P OUTPUT       ACCEPT

# NAT Policy - do nothing
iptables -t nat -F
iptables -t nat -P PREROUTING   ACCEPT
iptables -t nat -P OUTPUT       ACCEPT
iptables -t nat -P POSTROUTING  ACCEPT

# Bi-directional nat (in then out) for one host in DMZ
iptables -t nat -A PREROUTING  -i eth0 -d 1.2.3.4     -j DNAT --to-destinat=
ion 1
92.168.1.4
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.1.4 -j SNAT --to-source  =
    1
.2.3.4

# All remaining outbound traffic will be nat'ed to the firewall address
# This is a catch all rule hence it must come after the host specific nats.
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 1.2.3.1

# Make sure forwarding is on
echo 1 > /proc/sys/net/ipv4/ip_forward

--- End ---

Assuming that works all you have to do is change the INPUT and FORWARD
filter policies to DROP (at your option you can also change the OUTPUT
filter). Then add the rules for the services you want to allow.

If you want to use a GUI to create your rules you may want to take out
any NAT information from the GUI and just use it to build your filter
rules. IP tables has a very clean design, so you should be able to lock
down your system without having to touch any of your NAT rules.

If this doesn=92t work either I have made a mistake or there is a problem
with your routing:
All of your internal hosts should have their default gateway set to 10.1.1.1
All of your DMZ hosts should have their default gateway set to 192.168.1.1

Hence if things aren=92t working it=92s probably a problem with your
upstream router not sending the packets to your firewall correctly.

I hope this gets you started,
David


From Robert Cole <robert.cole@support4linux.com> on 20 May 2003:

> Like David T I'm a bit frustrated myself. :)
>=20
> The flexiblity of iptables has got me pulling my hair out. Here's what I
> would=20
> like to do:
>=20
> I have a server that has 3 real interfaces (no aliases). eth0 is the
> public,=20
> eth1 is the private and eth2 is the DMZ interface. All the books and
> docs=20
> I've seen so far work with only two interfaces and trying to adapt those
>=20
> scripts is giving me a headache.
>=20
> I want to allow all private traffic out to the internet through PAT
> (port=20
> address translation). But when going from the LAN to the DMZ I want no
> nat or=20
> pat going on, only when leaving to the internet.=20
>=20
> Next I would like a strict rule that allows another public IP to be 1 to
> 1=20
> nat'd from the public interface to a server out the DMZ interface.
>=20
> I've got the new riders second edition of the linux firewalls book and
> tons of=20
> howto's and yet I'm having trouble putting together this simple
> firewall.
>=20
> I'm currently using narc to setup the firewall and it appears to work to
> get=20
> basic internet bound traffic from the lan and I can get to the DMZ from
> the=20
> LAN without translation so I'm close here but getting the 1 to 1 NAT
> working=20
> is causing me grief.
>=20
> Any ideas?
>=20
> Thanks,
> Robert
>=20
>=20
>=20

