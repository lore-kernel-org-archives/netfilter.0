From: Rob Verduijn <rverduij@dds.nl>
Subject: RE: rp-l2tpd iptables and rh9 but no google
Date: 28 Jul 2003 22:49:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059425353.2893.7.camel@rincewind>
References: <200307282031.h6SKVejX019011@discmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200307282031.h6SKVejX019011@discmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset=; charset="utf-8"
To: "Aldo S. Lagana" <alagana@discmail.com>, netfilter@lists.netfilter.org

Hi there,

Sorry that's not it, either that or my ISP is handing out incorrect
subnet masks with it's dhcp server :P

I saw that part of my problem fell off the last message

Short version
Turned on Ip forwarding
Brought up eth1 (dhcp)
Brought up ppp0 (also dhcp)
Turned on masquerading
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

On the gateway I can surf to www.redhat.com and www.google.com
On the client I can only surf to www.redhat.com
I cannot surf to www.google.com on the client

maximum packetsize with ping -s =3D 1472 (on gateway)
ping -s 1472 www.google.com
with bigger packets I get no answer

Maximum packetsize with ping -s on client is even smaller

I've been told to check the tunnel with tcpdump, but I get no output
when surfing to www.google.com

Regards
Rob


On Mon, 2003-07-28 at 22:30, Aldo S. Lagana wrote:
> I had a funky issue that was similar and it turned out that I had the w=
rong
> subnet mask on my internet interface.  Coincidentally, my network also
> started with 64. (I think) - the same as google; but because my subnet =
mask
> was wrong, I could not see google!
>=20
>=20
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Rob Verduijn
> Sent: Monday, July 28, 2003 4:19 PM
> To: netfilter@lists.netfilter.org
>=20
> Hi again,
>=20
> I've set my MTU on eth0 eth1 and ppp0 to 1472
> Ive been playing around with tcpdump
> I gave the following command
> tcpdump -i ppp0 -w dumptcp
> When I surf to www.redhat.com everything goes wel and I get all kinda o=
utput
> in my file
> But when I surf to google I get nothing, no output whatsoever.
> Did I give in the wrong syntax?
>=20
> Regards
> Rob
>=20
>=20
>=20
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Eric Leblond
> Sent: vrijdag 18 juli 2003 21:49
> To: netfilter@lists.netfilter.org
> Subject: Re: rp-l2tpd iptables and rh9 but no google
>=20
>=20
> Le ven 18/07/2003 =C3=A0 21:01, Rob Verduijn a =C3=A9crit :
> > Hi there,
> >
> > I've got this curious problem with netfilter.
>=20
> > I did
> > echo 1 > /proc/sys/net/ipv4/ip_forward
>=20
> >
> > I can ping google so icmp seems to work but I can't surf the web for
> google.
> > Neither windows nor linux will work.
>=20
> You may have look to the MTU, with encapsulation in L2TP you loose some
> bytes.
> To test try increase your ping size with the -s option.
>=20
> If it is working with -s 1500 then try to look at tcpmss.
>=20
> BR,
> --
> Eric Leblond <eric@regit.org>
>=20
>=20
>=20
>=20
>=20


