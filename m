From: "Kjetil Laasby" <Kjetil@laasby.com>
Subject: RE: ip_nat_pptp & ip_conntrack_pptp help appreciated.
Date: Tue, 1 Oct 2002 01:22:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0EB90DD25728C04CBD401CDCD72D2A655A8B@homer.no.laasby.com>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, Sneppe Filip <Filip.Sneppe@cronos.be>
Cc: netfilter@lists.netfilter.org

Anthony, Filip,

Thank you very much for your comments.=20

It might be a good idea as you say, Anthony, to use a 'dual-nat' to
fake the valid-ip address on the internal LAN. I really don't need
NAT support on the RedHat box, it could just routing capabilities, and
the cisco could do the NATing.

Then you might ask why I'm want to do some (D)NATing on the RedHat box.=20
This is because if I don't do anything, just let's the packets hit on
the external interface on the RedHat - the GRE protocol encounters
some errors that are beyond my understanding. This I assume is because
of the nat _all_ rule on the cisco - and as you say, the whole point
for PPTP support in netfilter.=20

(Thanks Filip, I did forget the nat_proto_gre - and I got a little
closer to the goal! ip_nat_pptp works ok! ;-) )

Thank you both !
Regards
Kjetil Laasby

-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]=20
Sent: 30. september 2002 23:22
To: netfilter@lists.netfilter.org
Subject: Re: ip_nat_pptp & ip_conntrack_pptp help appreciated.

On Monday 30 September 2002 10:10 pm, Kjetil Laasby wrote:

> Hello !
>
> I've got a little problem thats disrupting my nightsleep - and I
>  hope someone could point me into where I'm doing wrong.
>
> My configuration is like this :
> ---------------------------------------------
> 80.x.x.x  (Valid IP)
> Cisco DSL router
> (one rule - NAT all to 10.0.2.1)
>
> 10.0.2.1 - RedHat 7.3 - kernel-2.4.20-pre8   (this Iface will receive
> 							     all data
> from valid-IP)
> 	(Routing enabled, Netfilter 1.2.7a)
> 10.0.0.1 - RedHat 7.3 - kernel-2.4.20-pre8
>
> 10.0.0.2 - Windows box (Client)
>
> My goal is to have a PPTP server (with PoPToP).

If you need to build NAT support for PPTP into the Linux box, then you
would=20
need to do the same thing on the Cisco box if you're going to do NAT
there as=20
well.

The whole point of netfilter support for PPTP through NAT is that PPTP=20
doesn't work through NAT without it - therefore it won't work through
NAT on=20
the Cisco box either.

Your best bet might actually be to perform the opposite NAT on the Linux
box=20
that you're doing on the Cisco, put the same 80.x.x.x valid IP on the
Windows=20
client as you have on the outside of the Cisco router, and see whether
PPTP=20
will work, thinking there's no NAT going on at all (because the two
cancel=20
each other out).

Antony.

--=20

The difference between theory and practice is that
in theory there is no difference, whereas in practice there is.


