From: Kiran Kumar <immidi_kiran@yahoo.com>
Subject: Re: Is this possible?
Date: Thu, 22 Apr 2004 04:45:08 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040422114508.44800.qmail@web14002.mail.yahoo.com>
References: <4087ACE0.1020006@uk.thalesgroup.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4087ACE0.1020006@uk.thalesgroup.com>
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
Content-Transfer-Encoding: quoted-printable
To: Fisher Alex <Alex.Fisher@uk.thalesgroup.com>, netfilter@lists.netfilter.org

--- Fisher Alex <Alex.Fisher@uk.thalesgroup.com>
wrote:

> I'll do my best to explain what I'm trying to
> acheive with a linux box=20
> and 3 NICS.

  I'll do my best too. :D

>=20
> I have two sets of systems.  Each system has about
> 30 IP addresses=20
> spread across various bits of hardware.  The two
> systems are identical=20
> (ie have the same 30 IP addresses).  The addresses
> are all part of the=20
> class C subnet 192.168.0.*
>=20
> The IP addresses for each system are now set in
> stone and can't be=20
> changed.  Furthermore, similar addresses are already
> in use on our network.
>=20
> I've been given a set of IP addresses I CAN use
> (172.26.158.*)
>=20
> A diagram might help here ...
>=20
>    -----------        -----------------
>    - System1 ---------|eth1            |
>    -----------        |                |
>                       |  Linux Router  |
>                       |          =20
> eth0|------------Rest of the network
>                       |                |
>    -----------        |                |
>    - System2 ---------|eth2            |
>    -----------        ------------------
>=20
> I also have an address I can use for eth0 which will
> make the router=20
> visible from machines on the rest of the network.=20
> This can be set as=20
> the default gateway for connections to the
> 172.26.158.* subnet.
>=20
> I would like PCs on the normal network to be able to
> connect with either=20
> system by addressing them with addresses off the
> 172.26.158 subnet.=20
> I'll assign 30 of these IPs to each system.
>=20
> For example. 172.26.158.10 might be mapped onto
> 192.168.0.2 on eth1
> whilst  172.26.158.50 might be mapped onto
> 192.168.0.2 on eth2
>=20
> Is this at all possible?  I assume I'll need to use
> at least DNAT but=20
> also apply some other trickery to route to the
> correct interface.  As a=20
> newbie to IPTables, I'm not sure how I might even
> begin to set up rules=20
> for this.

  I guess what you basically need to do is DNAT, as
you got it. In addition you also need a way to
distinguish packets to the two subnets. Since at eth2,
by the IP you know where that packet is destined, you
could use the MARK target to mark the packets
appropriately. Later on, you could use this mark and
appropriately force route the packets to the
appropriate interfaces using the ROUTE target.

  I guess this should work, though I may be totally
wrong.. being pretty new to iptables myself.

>=20
> Hopefully this is the sort of thing people want to
> do all the time and=20
> it will be easy :)
>=20
> Any help would be very much appreciated.


=3D=3D=3D=3D=3D
Regards,
Kiran Kumar Immidi


=09
	=09
__________________________________
Do you Yahoo!?
Yahoo! Photos: High-quality 4x6 digital prints for 25=A2
http://photos.yahoo.com/ph/print_splash

