From: "Hudson Delbert J Contr 61 CS/SCBN" <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: Two NICS with same IP and same client IP
Date: Wed, 2 Feb 2005 14:22:41 -0800
Message-ID: <186AC876521E0F46BDE77079A6567FD0F0DD97@la-ncc-ms1nsabb.losangeles.afspc.ds.af.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

jason,

sorry, but your gonna' hear this anyway...but its not negative..
i just wanna know why?

okay...here is what i'm sure will think is a dumb question.

why not make life simple for all concerned [servers, clients and =
routers, too...]

re-numbering the subnets...or just one and --- voila! problem gone   =
!!!!

this might be too simplistic for this list (he! he! he!) but lets say...
=20
eth0@server =3D 192.168.100.0/24=20
eth0@client =3D 192.168.100.1/24

eth1@server =3D 172.16.1.0/24=20
eth1@client =3D 162.16.1.1/24

or whatever...whats the problem?

i think also the statement below may be have some validity
if this is as easy as i think it is.

where's the difficiulty.

complex is bad.
simple is good.


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Jason
Opperisano
Sent: Wednesday, February 02, 2005 12:56 PM
To: netfilter@lists.netfilter.org
Subject: Re: Two NICS with same IP and same client IP


On Wed, Feb 02, 2005 at 09:35:31AM -0000, Herv=E9 wrote:
> Hello,
>=20
> I have a weird setup I would like to make work: I have two identical
> subnets connected to one machine via two different NICs, like this:
>=20
> Server             |         | Client 1
> eth0:192.168.100.1 |---------| 192.168.100.2
>                    |                              | Client 2
> eth1:192.168.100.1 |------------------------------| 192.168.100.2
>=20
> These two machines only access an NFS share on the server, but I =
assume
> this is irrelevant: the problem is to route the packets back through =
the
> interface the request came from (I am not trying to access the boxes
> _from_ the server).

aight--this comes with no warranty expressed nor implied, and no
guarantee that it won't burn down your house or that it will even work
at all...  this is off the top of my head, and other than typing the
commands on a test machine to validate the syntax, i have not tested
this one iota...  i also don't believe that you *_have_* to do this--i
think you secretly just want to do this, because you think you should be
able to...  ;-)

here goes--it obviously requires iproute2, and the CONNMARK patch from
POM:

---BEGIN STUFF I DON'T WANNA HEAR COMMENTS ABOUT---

# start fresh
ip addr flush dev eth0
ip addr flush dev eth1

	# add the same IP to each NIC
ip addr add 192.168.100.1/24 brd + dev eth0
=09
	# why not assign the diff subnets addy's here ?
ip addr add 172.16.1.1/24 brd + dev eth

..or..

ip addr add 172.16.1.1/24 brd + dev eth1
=20
ip addr add 192.168.100.1/24 brd + dev eth1
	# and here also...?

# add two new route tables to hold our local network routes
#   (this only needs to be done once)

echo 200 zero >> /etc/iproute2/rt_tables
echo 201 one >> /etc/iproute2/rt_tables

# start fresh
for t in mangle nat filter; do
  iptables -t $t -F
  iptables -t $t -X
  iptables -t $t -Z
done

# restore the connmark on each packet as it comes in off the wire
iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark

# if a packet isn't marked, mark it based off the inbound NIC
iptables -t mangle -A PREROUTING -i eth0 -m connmark --mark 0 -j =
CONNMARK --set-mark 1
iptables -t mangle -A PREROUTING -i eth1 -m connmark --mark 0 -j =
CONNMARK --set-mark 2

# restore the mark on locally-generated reply packets before the =
outbound route lookup

iptables -t mangle -A OUTPUT -j CONNMARK --restore-mark=20
	# add local network route for each NIC in its routing table

ip route add 192.168.100.0/24 dev eth0 src 192.168.100.1 table zero

	# here's another chance to NOT do the shenanigans
ip route add 172.16.100.0/24 dev eth1 src 172.16.100.1 table one # or =
here...

# ip route add 192.168.100.0/24 dev eth1 src 192.168.100.1 table one

# add rules to lookup routes based on the netfilter mark
ip rule add fwmark 1 table zero
ip rule add fwmark 2 table one

# disable reverse path filtering on the duplicate NICs
sysctl -w net.ipv4.conf.eth0.rp_filter=3D0
sysctl -w net.ipv4.conf.eth1.rp_filter=3D0

# start clean
ip route flush cache

---END STUFF I DON'T WANNA HEAR COMMENTS ABOUT---

just a thought--hope it doesn't lead you too astray.

i feel so dirty

...and rightly so...just kiddin...ceeyal8tr...

v/r,
~piranha

--
"You couldn't fool your mother on the foolingest day of your life if
 you had an electrified fooling machine."
        --The Simpsons


