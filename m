From: Evan Cofsky <evan@theUNIXman.com>
Subject: Re: Can't block DHCP with iptables?
Date: Tue, 28 May 2002 09:33:39 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020528163339.GO17794@hack.home.theunixman.com>
References: <Pine.LNX.4.21.0205280845400.11566-100000@colargol.tihlde.org> <FLEKIPPLAEDMJMOOBBDPCELCCEAA.stewart.thompson@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <FLEKIPPLAEDMJMOOBBDPCELCCEAA.stewart.thompson@shaw.ca>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Stewart Thompson <stewart.thompson@shaw.ca>, netfilter@lists.samba.org

Derrik Pates touched on this earlier in the thread, but I'll try and
clarify a bit.

The DNCP server of the ISC (Internet Software Consortium,
http://www.isc.org) uses a different type of network access in Linux,
so to speak.  Normally, when programs need network access, they open
up an Internet socket of the correct protocol (TCP/UDP), which gets
any packets destined for it and can send packets after the kernel has
applied all IP Tables rules to them.  So if you have a policy of
DROP/REJECT or you have a rule that matches a packet to.from this
socket that DROP/REJECTs it, the socket will not receive or be able to
send that packet.

However, the ISC DHCP server uses an Internet Socket of protocol Raw
instead of TCP or UDP.  This facility, naturally, is only available to
root (uid 0, really), and receives packets before the IP Tables
processing.  It also receives all Internet packet headers as well, so
it gets to do additional processing.

But because Raw sockets get packets before the IP Tables processing,
the ISC DHCP server is able to obtain an IP address through DHCP.

More information (possibly not in a useful state) can be found in the
man pages for socket, ip, tcp, udp,
http://nodevice.com/sections/ManIndex/man1275.html, and, of course,
the source code.

On Tue, May 28, 2002 at 12:43:04AM -0700, Stewart Thompson wrote:
> Roar:
>=20
> 	You are absolutely right. I just tried on one of my machines.
> It still manages to get an ip and start up with ifup. I don't have an
> explanation for it. Time for the  Guruz to chime in.
>=20
> Stu......
>=20
>=20
> -----Original Message-----
> From: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org]On Behalf Of Roar Bj=F8rgum Rotvik
> Sent: May 27, 2002 11:58 PM
> To: netfilter@lists.samba.org
> Subject: RE: Can't block DHCP with iptables?
>=20
> On Mon, 27 May 2002, Stewart Thompson wrote:
>=20
> >       Normally the iptables script runs after the interfaces have been
> brought up
> > by the system.
> > By that time blocking DHCP is kind of irrelevant. A default policy of d=
rop
> > should block everything
> > all right, but it is kind of closing the barn door after the horse has
> left.
> > Why not just set up the
> > interface so it doesn't make a DHCP request? If there are special
> > circumstances, you will have to
> > give us some more details of what you are trying to accomplish.
>=20
> I can see I didn't explain good enough.
>=20
> I'm on a local machine with interface eth0 down. I manually enter the
> iptables policy DROP for all three "normal" chains, and then start up
> interface eth0 with 'ifup eth0' (eth0 is configured with dhcp and
> ONBOOT=3Dn).
>=20
> In this scenario, the policy DROP exists before DHCP client starts up, but
> still the DHCP client manages to assign a new IP-address.
>=20
> ifconfig shows shows that eth0 has been assigned new IP-address. ping or
> any network traffic after that does not work, as expected.
>=20
> What I want to accomplish is to block all network traffic in/out up until
> a certain point, and that includes DHCP.
>=20
> --
> Roar Bj=F8rgum Rotvik
>=20
>=20
>=20
>=20

--=20
In a display of perverse brilliance, Carl the repairman mistakes a room
humidifier for a mid-range computer but manages to tie it into the network
anyway.
                -- The 5th Wave
Evan Cofsky, The UNIX Man, unix@theunixman.com

