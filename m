From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Creating a Hybrid Connection to Balance Traffic
Date: Sun, 27 Oct 2002 00:27:32 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210270027.32793.netfilter@newkirk.us>
References: <20021026190433.24795.qmail@web40607.mail.yahoo.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021026190433.24795.qmail@web40607.mail.yahoo.com>
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
To: Paul Aumer-Ryan <raptorion@yahoo.com>, netfilter@lists.netfilter.org

On Saturday 26 October 2002 03:04 pm, Paul Aumer-Ryan wrote: (snipped hea=
vily)
> I've got a peculiar situation that I hope you all
~
> discovered the joys of p2p file sharing (i.e., being
~
> to tone down my upload bandwidth usage on the DSL
~
> and a laptop.  The linux box currently uses ipchains

Well, that's not iptables, but you can set up with iptables and drop ipch=
ains=20
use... :^)

> So here comes the question: since I've got to reduce
> my upload usage, I'd like to try to use the linux box
> to do a special form of SNAT routing.  I would like
> all outgoing data to leave through the attached ppp0
> interface (the modem which I can hook up to a dialup
> ISP) and all incoming data to come back in through the
> eth0 interface (the broadband connection to my local
> ISP).  Basically, I need to do a form of SNAT routing

with IPTables, you would need to determine the IP of the DSL
(probably dynamic, but probably the same throughout a connection) and per=
form=20
a basic SNAT using it.  MASQ wouldn't work, since it automagically determ=
ines=20
the IP of the connection it's going out on, and you need to make it lie. =
 You=20
may find the dial-up ISP will not accept packets with an unexpected sourc=
e=20
IP, though.  I'd recommend testing with tcp port 80 settings first, and s=
ee=20
if your lan can browse the web, and which interface the packets go out/co=
me=20
in.

Presuming that the P2P is not running on the firewall machine:
in an iptables/ip script you could do something like this:
[disclaimer: I've never constructed an Iproute2 rule before, that part co=
uld=20
very easily be completely wrong... the rest too, but...:^]

# set DSLIP to the IP of the DSL (eth0)
DSLIP=3D$(/sbin/ifconfig "eth0" | grep inet | cut -d":" -f 2 | cut -d" " =
-f 1)
# set TOS (Type-Of-Service) for routing to mincost (appropriate :^)
/sbin/iptables -t mangle -A PREROUTING {matches} -j TOS --set-tos 0x02
# tell Iproute2 to route mincost packets out the dialup (I think)
/sbin/ip route add -tos 0x02 protocol static dev ppp0=20
# do SNAT in postrouting of any mincost packets, cross fingers
/sbin/iptables -t nat -A POSTROUTING -p tcp -m tos --tos 0x02 -j SNAT \=20
--to-source $DSLIP


For the prerouting {matches}, minimal would be "-i eth1" to handle only=20
packets coming in from your lan.  (again assumes the p2p node's there)  I=
'd=20
suggest, if this all works, to be a bit more selective: try passing only =
p2p=20
packets by setting a TOS only for packets with specified TCP source or=20
destination ports, something like:

/sbin/iptables -t mangle -A PREROUTING -i eth1 -p tcp --dport 4661:4666 -=
j TOS=20
--set-tos 0x02

to route outbound data from EDonkey.  The ip route add will fail if ppp0 =
isn't=20
up, not sure how to handle this.  I presume you're not using a PPPoE DSL?=
 =20
That would probably give you ppp0 for DSL and ppp1 for dialout. (or rever=
se,=20
or whatever, but not a hardware interface like eth0)

Now, with all that said, be sure to check if the p2p software itself offe=
rs=20
bandwidth limiting ability.  (many do)  That's probably the simplest thro=
ttle=20
available.

j

--=20
 "Redefining the role of the United States from enablers to keep the peac=
e to=20
enablers to keep the peace from peacekeepers is going to be an assignment=
=2E"=20
-George W. Bush

