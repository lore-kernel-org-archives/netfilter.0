From: Florent Guiliani <fguiliani@perinfo.com>
Subject: Re: DNAT for two external NIC
Date: Wed, 30 Aug 2006 09:15:35 +0200
Message-ID: <44F53B17.5040309@perinfo.com>
References: <007301c6cbb4$0aa38c00$4764a8c0@mhsystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <007301c6cbb4$0aa38c00$4764a8c0@mhsystems.com>
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
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: netfilter@lists.netfilter.org

$> echo "2 ISP2" >> /etc/iproute2/rt_tables
$> ip route add default via gatewayISP2 dev devISP2 table ISP2
$> ip rule  add from IPISP2 lookup ISP2 prio 1000
$> ip route flush table cache

so ping will be ok on the ISP2, you will able to connect any services on=20
your router throuht ISP2 but DNAT will only work with ISP1. I'm working=20
on this problem. I think I will use Shorewall to so that automatically

Mikhail a =E9crit :
>   I have Linux gateway/firewall with 3 NIC: eth0 =96 LAN, eth1 =96 ISP1=
, eth2 =96
> ISP2.
> I=92ve got separate static IPs from each of the ISP (IP1 & IP2) which I
> statically assigned to eth1 and eth2.
> My default route points to ISP1 gateway via eth1. I need to provide ext=
ernal
> access to a few computers on the LAN using different IPs and port numbe=
rs
> (no load balancing and target machines are IP-specific).=20
>   Everything works fine if I use IP1 address but I was unable to get to=
 the
> corresponding LAN machine through IP2. Ping requests are also not respo=
nded
> if they=92re made to IP2. They do reach eth2 and I can see them using t=
cpdump
> but then nothing goes out on any NIC. The same goes for TCP/IP requests=
 =96
> I=92ve managed to trace them to the nat table PREROUTING chain but they=
 could
> not be found in either INPUT or FORWARD chain of the mangle table. If I=
 make
> default route through eth2 =96 everything starts working through that N=
IC and
> stops through eth1. I seem to be missing something simple. Any help is
> greatly appreciated.
>=20
> Mikhail.
>=20
>=20
>=20

--=20
     	*  Florent GUILIANI - D=E9veloppement Syst=E8me*
41, avenue Jean Jaur=E8s - 67100 STRASBOURG
/Tel :/ 03.88.44.96.00 /- Fax :/ 03.88.44.96.29
/E-mail :/ fguiliani@perinfo.com <mailto:fguiliani@perinfo.com>
/Site Web :/ http://www.perinfo.com


