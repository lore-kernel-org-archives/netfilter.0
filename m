From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: 3 part firewall
Date: 21 May 2003 21:15:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053544517.1913.24.camel@kermit.spenneberg.de>
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
Content-Type: text/plain; charset="iso-8859-1"
To: robert.cole@support4linux.com
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mit, 2003-05-21 um 08.42 schrieb Robert Cole:
> Like David T I'm a bit frustrated myself. :)
Ok. let's see.
>=20
> The flexiblity of iptables has got me pulling my hair out. Here's what I =
would=20
> like to do:
>=20
> I have a server that has 3 real interfaces (no aliases). eth0 is the publ=
ic,=20
> eth1 is the private and eth2 is the DMZ interface. All the books and docs=
=20
> I've seen so far work with only two interfaces and trying to adapt those=20
> scripts is giving me a headache.
>=20
> I want to allow all private traffic out to the internet through PAT (port=
=20
> address translation). But when going from the LAN to the DMZ I want no na=
t or=20
> pat going on, only when leaving to the internet.=20
Ok.
DMZ_DEV=3Deth2
PRV_DEV=3Deth1
PUB_DEV=3Deth0
# making up the network, replace as needed.
PRV_NET=3D192.168.0.0/24
DMZ_NET=3D192.168.1.0/24
# NAT rules
iptables -t nat -A POSTROUTING -s $PRV_NET -o $PUB_DEV -j MASQUERADE
>=20
> Next I would like a strict rule that allows another public IP to be 1 to =
1=20
> nat'd from the public interface to a server out the DMZ interface.
PUB_IP=3D128.176.0.12
DMZ_IP=3D192.168.1.15
iptables -t nat -A POSTROUTING -i $PUB_DEV -d $PUB_IP -j DNAT --to
$DMZ_IP

So far we have setup the NAT rules, now the filtering.
# Allow all established connections
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow traffic from the private network to the DMZ
iptables -A FORWARD -i $PRV_DEV -o $DMZ_DEV -s $PRV_NET -d $DMZ_NET -m
state --state NEW -j ACCEPT

# Allow traffic from the private network to the internet
iptables -A FORWARD -i $PRV_DEV -o $PUB_DEV -s $PRV_NET -d 0/0 -m state
--state NEW -j ACCEPT

# Allow traffic from the outside to the one machine on the DMZ
iptables -A FORWARD -i $PUB_DEV -o $DMZ_DEV -s 0/0 -d $DMZ_IP -m state
--state NEW -j ACCEPT

# Close everything else (you might want to move these rules to the
beginning
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# Be aware that you cannot access the firewall anymore and the firewall
cannot access any other machine.
# Turn on forwarding=20
sysctl -w net.ipv4.ip_forward=3D1


>=20
>=20
> Any ideas?
This should get you going. Email again if you've got problems.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                   =20
http://honeynet.spenneberg.org

