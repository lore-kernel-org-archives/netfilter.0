From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: DNAT for two external NIC
Date: Wed, 30 Aug 2006 00:00:02 +0200
Message-ID: <44F4B8E2.7030409@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Mikhail a =E9crit :
>   Everything works fine if I use IP1 address but I was unable to get to=
 the
> corresponding LAN machine through IP2. Ping requests are also not respo=
nded
> if they're made to IP2. They do reach eth2 and I can see them using tcp=
dump
> but then nothing goes out on any NIC. The same goes for TCP/IP requests=
 -
> I've managed to trace them to the nat table PREROUTING chain but they c=
ould
> not be found in either INPUT or FORWARD chain of the mangle table. If I=
 make
> default route through eth2 - everything starts working through that NIC=
 and
> stops through eth1.

Maybe you need to disable rp_filter (reverse path filtering) on the=20
interface that has not the default route.

sysctl -w net/ipv4/conf/eth2/rp_filter=3D0

