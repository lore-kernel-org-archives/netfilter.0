From: Stephen Touset <stephen@touset.org>
Subject: RE: Problems w/ Linux firewall and Windows VPN
Date: Fri, 02 Jan 2004 16:36:41 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073079401.728.1.camel@localhost>
References: <E131E9F1848D0148813EAF06A846608F01C677ED@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-AIA5ugh17Q3gF6PmkhLA"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E131E9F1848D0148813EAF06A846608F01C677ED@w2ks-e2k.iconos.be>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Sneppe Filip <Filip.Sneppe@uptime.be>
Cc: netfilter@lists.netfilter.org


--=-AIA5ugh17Q3gF6PmkhLA
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-01-02 at 08:51, Sneppe Filip wrote:
> Hi Stephen,
> =20
> I am replying privately because I currently have only MS Outlook Web
> Access to my
> mailbox and hence am replying with html mail. My appologies. I don't
> want to annoy
> the list with this, so ...

Fair 'nuff ;)
=20
> What IP adress and subnet mask is your mother getting from the pptp
> server ?

She gets an IP in the 10.0.58.0/24 range it seems. I just tried now, and
her IP address was 10.0.58.101, with a subnet mask of 255.255.255.255.

> Are you using dhcp on your local subnet (192.168.0.0/16 or whatever).

Yes.
=20
> After a quick peek at the captures, some intriguing things are:
> =20
> - the dhcp traffic that needs several attempts on the local network.

Yeah--I'm currently in the process of adding things to the network.
Right now, my firewall is handing out DHCP leases. However, there's an
awkward interaction between iptables and DHCP. I'm not quite sure what's
causing it. Want a copy of my iptables script?

>   It should be interesting to use a static ip address 192.168.1.102
> just to
>   test.

I'll try that in a few minutes. Thanks for the suggestion.

> - more intriguing: after the tunnel is set up, after you've renewed
> your dhcp
>   address 192.168.1.102, your mother's machine repeatedly tries to
>   contact 10.... addresses (dns and kerberos servers), but there is no
>   reply. I assume those are IP adresses from your mother's company's
> network ?

They seem to be.

>   The internal and external capture show that this traffic is not
> going through the
>   pptp tunnel.

You know, I'd noticed that but no flags had popped up in my head. I
should have realized that that sort of traffic ought to be in the GRE
tunnel.

>   I think this may be the cause to your (mother's) problems.
>   Could this be because your mother's computer is not using the=20
>   gateway given by the pptp server to route packets to the 10....
> network ?

You know, that sounds awfully feasible. The tunnel is being connected,
she refreshes the DHCP lease, and then traffic supposed to go through
the tunnel starts going through our gateway rather than her PPTP one.

>   Can you go to the properties of the pptp connection of your mother's
> machine,
>   then go to the "networking" tab, select "tcp/ip" and click on
> "properties".
>   then click on "advanced". there, on the general tab, does it say
> "use default gateway
>   on remote network" ?

It does.
=20
>   This setting may be the cause of your problems.

Alright, I'll give that a whirl, too.
=20
>   If not, can you give a little more info, like the output
> fro; "ipconfig /all" and=20
>   "route print" when you've established a pptp tunnel.

C:\Documents and Settings\stouset>ipconfig /all

Windows 2000 IP Configuration

        Host Name . . . . . . . . . . . . : STouset-W2KHT
        Primary DNS Suffix  . . . . . . . : usatlnt.com
        Node Type . . . . . . . . . . . . : Hybrid
        IP Routing Enabled. . . . . . . . : No
        WINS Proxy Enabled. . . . . . . . : No
        DNS Suffix Search List. . . . . . : mapics.com

Ethernet adapter Local Area Connection:

        Connection-specific DNS Suffix  . : advlog.com
        Description . . . . . . . . . . . : 3Com EtherLink XL 10/100 PCI
TX NIC
(3C905B-TX) #3
        Physical Address. . . . . . . . . : 00-10-5A-0C-25-E0
        DHCP Enabled. . . . . . . . . . . : Yes
        Autoconfiguration Enabled . . . . : Yes
        IP Address. . . . . . . . . . . . : 192.168.1.102
        Subnet Mask . . . . . . . . . . . : 255.255.255.0
        Default Gateway . . . . . . . . . : 192.168.1.1
        DHCP Server . . . . . . . . . . . : 192.168.1.1
        DNS Servers . . . . . . . . . . . : 205.152.37.254
                                            205.152.144.235
        NetBIOS over Tcpip. . . . . . . . : Disabled
        Lease Obtained. . . . . . . . . . : Friday, January 02, 200
3:29:19 PM
        Lease Expires . . . . . . . . . . : Friday, January 02, 200
3:39:19 PM

C:\Documents and Settings\stouset>route print
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Interface List
0x1 ........................... MS TCP Loopback interface
0xf000003 ...00 10 5a 0c 25 e0 ...... 3Com EtherLink PCI
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Active Routes:
Network Destination        Netmask          Gateway       Interface
Metric
          0.0.0.0          0.0.0.0      192.168.1.1  192.168.1.102     =20
1
        127.0.0.0        255.0.0.0        127.0.0.1      127.0.0.1     =20
1
      192.168.1.0    255.255.255.0    192.168.1.102  192.168.1.102     =20
1
    192.168.1.102  255.255.255.255        127.0.0.1      127.0.0.1     =20
1
    192.168.1.255  255.255.255.255    192.168.1.102  192.168.1.102     =20
1
        224.0.0.0        224.0.0.0    192.168.1.102  192.168.1.102     =20
1
  255.255.255.255  255.255.255.255    192.168.1.102  192.168.1.102     =20
1
Default Gateway:       192.168.1.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Persistent Routes:
  None

C:\Documents and Settings\stouset>

> Hope this helps somehow. Either way, the packets going to the 10....
> network
> via the internet is definately something wrong you want to have
> fixed...

I appreciate the help. I'm CCing it back to the Debian list, so others
will have a chance to see this.

--=20
Stephen Touset <stephen@touset.org>

--=-AIA5ugh17Q3gF6PmkhLA
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQA/9eRo+fMdKwQeHvYRAscGAKCxnxBVcHh3lPFkdofLrEOEeXKTeACgkgrb
RfFGKY633YVPiTq+2vDt6YA=
=q18B
-----END PGP SIGNATURE-----

--=-AIA5ugh17Q3gF6PmkhLA--


