From: Greg Cope <gregcope@gmail.com>
Subject: Re: How to make a mutli-homed host use one IP for a NAT'ed host
Date: Thu, 21 Apr 2005 15:18:03 +0100
Message-ID: <c0e9781f0504210718566c4025@mail.gmail.com>
References: <c0e9781f0504202352240208e4@mail.gmail.com>
	<426753A3.7030800@riverviewtech.net>
	<c0e9781f05042102544437b319@mail.gmail.com>
Reply-To: Greg Cope <gregcope@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c0e9781f05042102544437b319@mail.gmail.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Taylor Grant <gtaylor@riverviewtech.net>, netfilter@lists.netfilter.org

Hi all,

Hum... not quite working for me yet, nearlt there but I get the error:

"MARK: can only be called from "mangle" table, not "nat""

So I used:

iptables -A PREROUTING -i eth0 -t mangle -s $DMZ_HOST_IP -p tcp
--dport 25 -j MARK --set-mark 2

Q: Is eth0 correct as this is the red/ INET IFACE and not the DMZ dev
IFACE (that would be eth1)

And then:

ip route add table $IPROUTE2_SMTP_TABLE dev $INET_IFACE src $MAIL_INET_ALIA=
S
ip route add table $IPROUTE2_SMTP_TABLE default via $INET_IP
ip rule add fwmark $SMTP_MARK table $IPROUTE2_SMTP_TABLE

Where $SMTP_MARK=3D2 and IPROUTE2_SMTP_TABLE=3Dsmtp.out

I have "echo 25 smtp.out >> /etc/iproute2/rt_tables"

Packets still come from the "wrong" ip address

Any suggestions.

Thanks.

Greg

On 4/21/05, Greg Cope <gregcope@gmail.com> wrote:
> Wow - Thanks!
>=20
> Your synopsis is correct.
>=20
> Here is my spin on your excellent advice:
>=20
> I've assumed that SMTP_MARK is just an integer label
> SMTP_MARK=3D999
>=20
> $IPTABLES -t nat -A OUTPUT -s $DMZ_MAIL_IP -p tcp --sport 25 -j MARK
> --set-mark $SMTP_MARK
>=20
> Quick question - this marks only packets from the DMZ_MAIL_IP that use
> TCP and are from sport 25, whereas my mailserver picks high ports to
> connect to exterior SMTP servers, so I might change this to:
>=20
> $IPTABLES -t nat -A OUTPUT -s $DMZ_MAIL_IP -p tcp --dport 25 -j MARK
> --set-mark $SMTP_MARK
>=20
> Ie if dest port (ie SMTP server) get marked
>=20
> ip route add table $IPRoute2_SMTP_Table dev $MAIL_INET_ALIAS_IFACE src
> $MAIL_INET_ALIAS
> ip route add table $IPRoute2_SMTP_Table default via $INET_IP
> ip rule add fwmark $SMTP_MARK table $IPRoute2_SMTP_Table
>=20
> Can you elaborate on $IPRoute2_SMTP_Table - I assume I need to add a
> line to /etc/iproute2/rt_tables like:
>=20
> 250     smtp
>=20
> Any good concise how to's on this?
>=20
> Again many thanks for the excellent and prompt reply!
>=20
> Greg
>=20
> On 4/21/05, Taylor Grant <gtaylor@riverviewtech.net> wrote:
> > Greg, if I understand you correctly you have a system that is multi hom=
ed with one of it's IP addresses being port forwarded to a DMZ server?  Wha=
t happens is that your DMZ server replies back to your router / firewall wh=
ich then in turn send the traffic out it's default route with a source IP o=
f something other than what you want your SMTP traffic to use?  If this is =
the case you need to so a few tings to get your traffic to go out the inter=
face that you want with the IP that you want.
> >
> > For starters you will need to use IPTables to mark the traffic that is =
coming in to your router / firewall from the DMZ mail server.
> > Second you will need to create a new routeing table for this traffic vi=
a something like the following:
> >
> > iptables -t nat -A OUTPUT -s $DMZ_Server_IP -p tcp --sport 25 -j MARK -=
-set-mark $SMTP_Mark
> > ip route add table $IPRoute2_SMTP_Table dev $DEV_of_SMTP_network_interf=
ace_or_alias src $IP_of_DEV_of_SMTP_network_interface_or_alias
> > ip route add table $IPRoute2_SMTP_Table default via $Default_INet_Gatew=
ay
> > ip rule add fwmark $SMTP_Mark table $IPRoute2_SMTP_Table
> >
> > Where:
> > $DMZ_Server_IP is the internal LAN ip of your SMTP server in the DMZ.
> > $SMTP_Mark is the value you want to use to mark the packets that need t=
o use the alternant route.
> > $IPRoute2_SMTP_Table is the name as it appears in /etc/iproute2/rt_tabl=
es or the number of the table that you want to use.
> > $DEV_of_SMTP_network_interface_or_alias is the device name or alias of =
your network interface that you want all SMTP traffic to use.
> > $IP_of_DEV_of_SMTP_network_interface_or_alias is the IP address of the =
device name or alias of your network interface that you want all SMTP traff=
ic to use.
> > $Default_INet_Gateway is the IP address of your internet gateway.
> >
> > This should cause any SMPT traffic (source port 25 from the SMTP server=
) to go out a different interface / alias and thus use a different source I=
P when the traffic is sent out to the world.  If you have any questions or =
need more help let me know and I'll see what I can do.
> >
> >
> > Greg Cope wrote:
> > > Hi All,
> > >
> > > I have a mutli-homed router/firewall.
> > >
> > > One IP address is the default router gateway address
> > >
> > > Three other (virtual) IP's are for applications (one of which is SMTP=
).
> > >
> > > My mailserver is on a NAT'ed DMZ.
> > >
> > > However when it sends mail the router uses the default gateway addres=
s
> > > as opposed to the SMTP IP address.
> > >
> > > This upsets reverse DNS lookups as it now appears to come from the
> > > router as opposed to the mail IP (that has the correct reverse IP
> > > address lookup).
> > >
> > > Any ideas?
> > >
> > > Greg
> >
>

