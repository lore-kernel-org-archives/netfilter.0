From: Rob Verduijn <rverduij@dds.nl>
Subject: Re: simple newbie question
Date: Mon, 11 Aug 2003 23:19:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060636743.2828.42.camel@vimes.localdomain>
References: <000101c35ebe$9504e8f0$0401a8c0@pc2>
	 <1060516426.3f36324a87d76@webmail.dds.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1060516426.3f36324a87d76@webmail.dds.nl>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset=; charset="iso-8859-9"
To: netfilter@lists.netfilter.org

Hi there,

The script I mentioned before.
It's pretty simple and certainly could do with improvement.
But it keeps the very basic nasty stuff outside and lets you do your
stuff.

ie let everything from the local network through to the internet , and
keep the bad internet out.

Also don't allow anything but the tunnel traffic and if needed the dhcp
traffic on the external interface through.

EXTERNAL_INT=3D"eth?"	# your external interface the one connected to
			# your adsl modem
INTERNAL_INT=3D"eth?"	# your internal network interface

VPN_INT=3D"ppp?"		# this is your pppoe interface (probably ppp0)

INTERNAL_IPADDR=3D"1.2.3.4"# your internal network interface ip address
			# asuming it is static or else cut and paste a
			# bit below
EXTERNAL_IPADDR=3D"1.2.3.4"# your external interface ip address
			# uncomment this line and uncomment below if
			# it is dynamic
# the 3 lines below should all three be unremarked if you got dynamic ip
# EXTERNAL_IPADDR=3D \
#`ifconfig eth1 | \
#sed -ne's/.*addr:\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\).*/\1/p'`

VPN_IPADDR=3D"1.2.3.4"     # if you got static ip on the vpn interface
# also unremark 2 lines below if your ppp address is dynamic
#VPN_IPADDR=3D`ifconfig ppp0| \
#sed -ne 's/ .*addr:\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\).*/\1/p'`

DHCP_SERVER=3D"1.2.3.4"	# if you have dhcp on your external interface

IPTABLES=3D"/path/to/iptables" 	# use `which iptables` as root to find
				# out what this should be

PPP_PORT=3D"????"			# fill in the port adsl uses (beats me 				# what tha=
t
is)
				# this script asumes it connect from the
				# same port to the same port
				# if not adjust the proper source and
				# destination ports

BROADCAST_SRC=3D"0.0.0.0"                 # broadcast source address
BROADCAST_DEST=3D"255.255.255.255"        # broadcast destination address

PRIVPORTS=3D"0:1023"                      # well-known, privileged port
range
UNPRIVPORTS=3D"1024:65535"                # unprivileged port range


# flush all excisting chains and erase all personal chains
CHAINS=3D`cat /proc/net/ip_tables_names 2>/dev/null`
for I in $CHAINS; do $IPTABLES -t $I -F; done
for I in $CHAINS; do $IPTABLES -t $I -X; done
                                                                         =
                                                   =20
# default policies
$IPTABLES -t filter -P INPUT DROP
$IPTABLES -t filter -P OUTPUT DROP
$IPTABLES -t filter -P FORWARD DROP

# accept local traffic
$IPTABLES -A INPUT -i lo -d 127.0.0.1 -j ACCEPT
$IPTABLES -A OUTPUT -o lo -d 127.0.0.1 -j ACCEPT

# connection tracking and some logging for the INPUT OUTPUT and
# FORWARD chain
# this allows tracking of excisting connections
# this does not allow new traffic
$IPTABLES -A INPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A INPUT -m state --state INVALID -j LOG \
        --log-prefix "INVALID input: "
$IPTABLES -A INPUT -m state --state INVALID -j DROP
$IPTABLES -A OUTPUT -m state --state INVALID -j LOG \
        --log-prefix "INVALID ouput: "
$IPTABLES -A FORWARD -i $INTERNAL_INT -m state --state INVALID -j DROP
$IPTABLES -A FORWARD -i $INTERNAL_INT -m state --state INVALID -j LOG \
        --log-prefix "INVALID ouput: "

#DHCP this bit is for dhcp traffic (if you need it)
# if you don't need it comment it
$IPTABLES -A OUTPUT -o $EXTERNAL_INT -p udp \
             -s $BROADCAST_SRC --sport 68 \
             -d $DHCP_SERVER --dport 67 -j ACCEPT
$IPTABLES -A INPUT -i $EXTERNAL_INT -p udp \
             -s $DHCP_SERVER --sport 67 \
             -d $BROADCAST_DEST --dport 68 -j ACCEPT

#allow ppp traffic on external interface
$IPTABLES -A OUTPUT -o $EXTERNAL_INT -p udp \
        -s $EXTERNAL_IPADDR --sport $PPP_PORT \
        -d $VPN_SERVER --dport $PPP_PORT \
        -m state --state NEW -j ACCEPT
$IPTABLES -A INPUT -i $EXTERNAL_INT -p udp \
        -s $VPN_SERVER --sport $PPP_PORT \
        -d $EXTERNAL_IPADDR --dport $PPP_PORT \
        -m state --state NEW -j ACCEPT

# at this point the gateway accepts only dhcp traffic on
# its external interface and ppp traffic
# the next rule allows all the traffic on the internal
# interface to be forwarded to another interface
# ie no traffice can come in via your external interface=20
# or ppp interface (unless it's a reply on your traffic from
# the internal interface

$IPTABLES -A FORWARD -i $INTERNAL_INT -s $INTERNAL_NETWORK \
        -m state --state NEW -j ACCEPT

# no connections to your gateway are allowed in this script
# you need to open up a port for that or log in on the console

# example for ssh connections via the internal interface
# to the gateway machine
$IPTABLES -A INPUT -i $INTERNAL_INT -p tcp \
        -s $INTERNAL_NETWORK --sport $UNPRIVPORTS \
        -d $INTERNAL_IPADDR --dport 22 \
        -m state --state NEW -j ACCEPT

# end script

note if you have dhcp on your external int or ppp
connection this script will only work after the ppp
connection and external interface are up

Regards
Rob


On Sun, 2003-08-10 at 13:53, rverduij@dds.nl wrote:


> Hi there,
>=20
> I used to have adsl I got cable now.
>=20
> You need to set up a firewall configuration on your ppp0 interface.
> (asuming ppp0 is the interface you tunnel through)
>=20
> Because if you blok on your eth1 and/or eth0 all the traffic still get'=
s=20
> through to you machine, unless you have issued global rules which blok =
all=20
> interfaces.
>=20
> On your eth1 card you could set up filtering rules if you don't thrust =
network=20
> the eth1 network card is connected to.
>=20
> If you do remember to allow the traffice that builds the vpn (your pppo=
e=20
> tunneling).
> And if you use a dynamic ip on your eth1 device to allow dhcp traffic a=
s wel.
>=20
> I'm currently not at my own pc, but I'll post anexample tomorrow for yo=
u.
>=20
> Regards
> Rob
>=20
>=20
> Citeren Mario Mer=C3=ADngolo <mmeringolo@arnet.com.ar>:
>=20
> > Im starting with this iptables stuff and trying to manage a home netw=
ork
> > trough linux and adsl + pppoe=20
> >=20
> > I have two simple questions.
> >=20
> > =20
> >=20
> > I have my adsl router conected to my eth1
> >=20
> > =20
> >=20
> > When im setting my iptables rules, should I think that eth0 routes pa=
ckages
> > through eth1 to ppp0 ?
> >=20
> > =20
> >=20
> > Because, if that is, my drop rules should be defined on eth1, and my =
input
> > ones on eth0
> >=20
> > =20
> >=20
> > Our should i think that eth1 does not matter and my reliable is eth0 =
and my
> > unreliable ppp0 ?
> >=20
> > =20
> >=20
> > Please forgive my crude english
> >=20
> > =20
> >=20
> > Thanx=20
> >=20
> > =20
> >=20
> > =20
> >=20
> >=20
>=20
>=20
>=20
>=20


