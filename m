From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: vpn between networks with private ip network segment conflicts
Date: Wed, 28 May 2003 08:13:03 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A01924B@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Drew Einhorn <drew.einhorn@starband.net>, Ray Leach <raymondl@knowledgefactory.co.za>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

Nope, no better option.. Believe me, if you tried any funky iptables =
stuff (which I'll mention below) you will be thanking Ray for his =
option..


What you do is create a suedo IP network.. ie. as below (Hope this comes =
out on email)

192.168.0.0/24\_________________FW__FW__________________/192.168.0.0/24
192.168.1.0/24/  192.168.100.0/24    192.168.200.0/24   \192.168.1.0/24
                 192.168.101.0/24    192.168.201.0/24

You NAT both sides using a virtual network range and using p-o-m NETMAP =
module.

The Left tunnel server believes there is a network on the right side =
with 192.168.200.0 192.168.201.0 as routes the that network via the =
tunnel.
The Right tunnel server believes there is a network on the left side =
with 192.168.100.0 192.168.101.0 as routes the that network via the =
tunnel.

# Left Side Rules
iptables -t nat -A PREROUTING -d 192.168.100.0/24 -j NETMAP --to =
192.168.0.0/24
iptables -t nat -A PREROUTING -d 192.168.101.0/24 -j NETMAP --to =
192.168.1.0/24

# Right Side Rules
iptables -t nat -A PREROUTING -d 192.168.200.0/24 -j NETMAP --to =
192.168.0.0/24
iptables -t nat -A PREROUTING -d 192.168.201.0/24 -j NETMAP --to =
192.168.1.0/24

messy but it'll work... well it should!

Anybody thought of that?? Anybody tried it already?

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au


-----Original Message-----
From: Drew Einhorn [mailto:drew.einhorn@starband.net]
Sent: Wednesday, May 28, 2003 3:35 AM
To: Ray Leach
Cc: Netfilter Mailing List
Subject: Re: vpn between networks with private ip network segment
conflicts


Oooo ... I was afraid that was going to be the answer.

I'll wait a bit and see if someone has a better idea before starting
in on renumbering a network.

On Tue, 2003-05-27 at 10:30, Ray Leach wrote:
> On Tue, 2003-05-27 at 18:03, Drew Einhorn wrote:
> > My LAN uses network segments 192.168.0.0/24, 192.168.1.0/24, etc.
> > So does the remote network I need to vpn to (probably using some =
flavor
> > of pptp).
> >=20
> > Is there an odd nat variant that will solve this problem.
> > Probably need to do some kind of dns transformation on each side.
> >=20
> > Is there any easy solution.  Perhaps it would be easier (but not =
easy)
> > to get the network segments renumbered on one end or the other.
>=20
> Oooo ... I would go with the second option. Get one end renumbered.
--=20
Drew Einhorn <drew.einhorn@starband.net>



