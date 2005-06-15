From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: NAT  ONE-TO-ONE or FULL NAT
Date: Wed, 15 Jun 2005 13:11:20 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0506151300150.25078@darkstar.sysinfo.com>
References: <963D966FFE3FA84FA239605E9E0297FC02CE896F@SPEMEN08.icetel.ice>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="1028002384-1471294695-1118855480=:25078"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <963D966FFE3FA84FA239605E9E0297FC02CE896F@SPEMEN08.icetel.ice>
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
To: =?iso-8859-1?Q?Gonz=E1lez_Sandoval_Luis_Rolando?= <lgonzalezsa@ice.go.cr>
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1028002384-1471294695-1118855480=:25078
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by darkstar.sysinfo.com id
	j5FHBjon025264

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


We found all docs realting to 1:1 NAT to be lacking, most are geared for =
a=20
org to try and connect with 2 other orgs that have grabbed the same=20
private address space  thus renumbering one or both on the fly to allow=20
mutual access to resources of the org sharing tose resources <which at=20
first glance here seems to resemble your needs, and those docs might have=
=20
some value for you>  None did we find that covered a single sites need of=
=20
1:1 nat for purposes such as we needed here.  so we filtered those docs=20
and many others and grabbed this tidbit of info and fused it with that=20
tidbit, and got some majik we missed in our POST/PRE routing chains from=20
Jason Opersainion <sorry if I mangled ya sir>, the majik under the hood=20
and out of the iptable realm were the ip addr add comands to add the=20
external, pulic address's being NAT to the internal provate side onto the=
=20
external interface.  Once that was up and set, we had the functionality w=
e=20
lacked in other regards, with caveates, and we have not taken the time to=
=20
see if those caveates can be remidied in other ways, though we will look=20
into this again in short order as work and time permit;

caveats;

FORWARD rule chains require ACCEPT in the default policy, turning off=20
ACCPET breaks the bank, youi have yers set to DROP, might be part of the=20
problem you need to hash on presuming you have the ip addr add majik=20
already setup on the external interface.

to pass from public space to private space outside -> in requires one=20
first connect and have an account on the FW.  this is likely due to our=20
use or, for the most lart old rules iin place prior to the 1:1 NAT setup.=
=20
Might take some tinkering with additional POST/PRE routing rules and=20
DNAT/SNAT to allow those few we do to pass through to the systems they=20
need access to.  As of now, it works in our favor to drmatically limit wh=
o=20
can go where but  requires that we place hight levels of trust to folks a=
s=20
they are accessing the FW directly first.

Hope this helps, will follow along here as well as I might become more=20
enlightened as well.

Thanks,

Ron DuFresne

On Wed, 15 Jun 2005, Gonz=E1lez Sandoval Luis Rolando wrote:

>
> I'm looking information about one to one NAT and his configuration whit=
 IPTABLES v1.2.7a.
>
> My requirements are:
> 1.	Map IP address for the segment 10.129.41.0/24 for an IP address of 1=
92.168.20.0/24
>
> My firewall machine has three NIC:
> 1.	NIC eth0 for the segment 10.129.41.0/24
> 2.	NIC eth1 for the segment 192.168.20/24
> 3.	NIC eth2 for the segment 10.149.50.0/22
>
>
> Please if someone can help me, I appreciate that... I'm reading Firewal=
l Linux book, chapter seven, I research in the web, but I failed in my sc=
ript.
> If you can guide me about my requirement, thanks
>
>
> I'm using the follow iptables script:
>
> #!/bin/bash
> IPTABLES=3D/usr/sbin/iptables
>
> echo "Cargando Modulos Espere..."
>
> /sbin/depmod -a
>
>
> /sbin/modprobe ip_conntrack_ftp
> /sbin/modprobe ip_tables
> /sbin/modprobe ip_conntrack
> /sbin/modprobe iptable_filter
> /sbin/modprobe iptable_nat
> /sbin/modprobe ipt_LOG
>
> echo "Modulos ARRIBA"
>
>
>
> echo "IP Forward habilitado"
>
> echo "1" > /proc/sys/net/ipv4/ip_forward
>
>
> #$IPTABLES -P INPUT DROP
>                #Politica por defecto del INPUT   ---> DROP
> #$IPTABLES -P FORWARD DROP
>                #Politica por defecto del VALID_IO ---> DROP
> #$IPTABLES -P OUTPUT DROP
>                #Politica por defecto del OUTPUT  ---> DROP
>
> $IPTABLES -t nat -P PREROUTING  ACCEPT
> $IPTABLES -t nat -P OUTPUT      ACCEPT
> $IPTABLES -t nat -P POSTROUTING ACCEPT
>
>
> $IPTABLES --flush
> $IPTABLES --flush
> $IPTABLES -t nat --flush
>
> $IPTABLES --delete-chain
>
> echo "Politica por defecto arriba"
>
> $IPTABLES -A INPUT  -i lo -j ACCEPT
>                #A la interfaz de loopback se permite todo
> $IPTABLES -A OUTPUT -o lo -j ACCEPT
>                #A la interfaz de loopback se permite todo
>
> #LISTA DE DIRECCIONES AUTORIZADAS PARA ENTRAR A LA RED PROTEGIDA
> $IPTABLES -A FORWARD -s 10.129.41.123       -m state --state NEW -j ACC=
EPT
> $IPTABLES -A INPUT   -s 10.129.41.123       -m state --state NEW -j ACC=
EPT
> $IPTABLES -A FORWARD -s 10.129.48.43        -m state --state NEW -j ACC=
EPT
> $IPTABLES -A INPUT   -s 10.129.48.43        -m state --state NEW -j ACC=
EPT
>
>
> #NAT 1:1
> $IPTABLES -t nat -A POSTROUTING -o eth0 -s 192.168.20.183/32 -j SNAT --=
to 10.129.41.242
> $IPTABLES -t nat -A PREROUTING -i eth1 -d 10.129.41.242/32 -j DNAT --to=
 192.168.20.183
>
> # Allow forwarding to each of the servers configured for 1:1 NAT
> # (For connections originating from the Internet. Notice how you
> # use the real IP addresses here)
>
> $IPTABLES  -A FORWARD -p tcp -i eth0 -o eth1 -d 192.168.20.183 \
>    -m state --state NEW -j ACCEPT
>
> # Allow forwarding for all New and Established SNAT connections
> # originating on the home network AND already established
> # DNAT connections
>
> $IPTABLES -A FORWARD -t filter -o eth0 -m state \
>         --state NEW,ESTABLISHED,RELATED -j ACCEPT
>
> # Allow forwarding for all 1:1 NAT connections originating on
> # the Internet that have already passed through the NEW forwarding
> # statements above
>
> $IPTABLES -A FORWARD -t filter -i eth0 -m state \
>         --state ESTABLISHED,RELATED -j ACCEPT
>
>
>
> Ing. Luis Gonz=E1lez Sandoval
> Ingenier=EDa de Sistemas - Cx UEN GRM
> Tel. 2838030
> LGonzalezSa@ice.go.cr
>
>
>

- --=20
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint =3D 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFCsGE8st+vzJSwZikRAo3HAJ9/6k4PIyod6TLxZxL/jKnZhDOAVwCg1lg+
Eg/L6Pg/DRNs5dJOLAA7Oxc=3D
=3DyvfH
-----END PGP SIGNATURE-----
--1028002384-1471294695-1118855480=:25078--

