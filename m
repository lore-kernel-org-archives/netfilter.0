From: "Elmshauser, Erik" <erike@pbgnw.com>
Subject: RE: Restrictions + Transparent Proxy
Date: Mon, 17 Mar 2003 10:20:20 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0FD2E5E35F0C0D41AEA66C9C6F39F30D086ADB@HERMES.pbgnw.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: phantom@colombianet.net, netfilter@lists.netfilter.org

> -----Original Message-----
> From: Camilo Echeverry [mailto:phantom@colombianet.net]
> Sent: Saturday, March 15, 2003 6:46 AM
> To: netfilter@lists.netfilter.org
> Subject: Restrictions + Transparent Proxy
>=20
> Hi.
> I have an Invalid network which access internet through a linux server
with
> iptables, I've tried many times to do this but isnt working:
<SNIP>
> But when I activate the transparent Proxy, all the people inside the
internal
> network can access internet (via web)
>=20
> What order of ideas must I use ?
> I'm using the correct iptables rules ..?
>=20
> something like:
>=20
> #Grant complete acces to this IP
> /sbin/iptables -A FORWARD --in-interface eth0 -s \
> 192.168.3.252/255.255.255.255 -d 0.0.0.0/0.0.0.0 --out-interface eth0
-j \
> ACCEPT
>=20
> #permit access to all the internal network to only one subnet
> sbin/iptables -A FORWARD --in-interface eth0 -s
\192.168.3.0/255.255.255.0 \
> -d XX.YY.ZZ.0/255.255.255.0 --out-interface eth0 -j ACCEPT
>=20
> #Block the rest
> /sbin/iptables -A FORWARD --in-interface eth0 -s
192.168.3.0/255.255.255.0  \
>  -d 0.0.0.0/0.0.0.0 -j REJECT
>=20
> #Then Activate Transparent Proxy
> /sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
REDIRECT \
> --to-port 8080
>=20
> #Now masquerade packets
> /sbin/iptables --table nat --append POSTROUTING --out-interface eth0
-j \
> MASQUERADE
>=20

try this (my shell is rusty, correct for syntax):

# the whole LAN
$LAN=3D'192.168.3.0/24'

# system(s) that get full internet access
$FULL=3D'192.168.3.252'

# system(s) that get limited access
$PART=3D'192.168.3.0/24'

# the networks that limited access systems can access
$PARTOK=3D'XX.YY.ZZ.0/24'

# where is the iptables program?
$IPT=3D'/sbin/iptables'

# set the default policy on forward table to drop
# now we need to explicitly allow packets to be forwarded.
$IPT -P FORWARD DROP

# add a NAT rule to give full access to one system
$IPT -t nat -A PREROUTING -i eth0 -s $FULL -j MASQ

# I'm a little confused, do you want to give one
# remote network access to your whole LAN?
#  this is *much* harder, and should be avoided anyway.

# what do you *REALLY* want to accomplish?
# do you have a static external(Internet) IP, or do you really use
MASQUERADE?
#  If you have static IP, use snat not MASQ, then you can use dnat
#  to redirect incoming internet traffic on some ports to LAN systems
#  that listen on those ports.

# give whole LAN access to a single network
$IPT -t nat -A PREROUTING -I eth0 -s $PART -d $PARTOK -j MASQ

# Redirect all other web traffic from LAN to a Transparent Proxy
$IPT -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT
--to-port 8080

# add a rule to forward table to let LAN traffic out.
$IPT -A FORWARD -s $LAN -j ACCEPT

	--Erik

Rev. Dr. Erik C Elmshauser D.D.
Head of I.T.
Pacific Benefits Group NW LLC
erike@pbgnw.com
Phone  - 800.259.0455
Fax    - 800.662.0082
 There are 10 kinds of people in the world,
Those that can do binary arithmetic, and those that can't.


