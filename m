From: =?ISO-8859-1?Q?Antonio_P=E9rez?= <aperlu@telefonica.net>
Subject: Re: nat/masquerade with kernel 2.6.x
Date: Sat, 11 Dec 2004 15:18:13 +0100
Message-ID: <41BB01A5.5000406@telefonica.net>
References: <41BAEBD4.8080401@alu.umh.es> <20041211133145.GA3027@utanet.at>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041211133145.GA3027@utanet.at>
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
To: Andreas Grabner <andi@vnc.at>
Cc: netfilter@lists.netfilter.org

Andreas Grabner wrote:

>Hi
>
>On Sat, Dec 11, 2004 at 01:45:08PM +0100, Antonio P=E9rez wrote:
> =20
>
>>   iptables --table nat --append POSTROUTING --out-interface=20
>>$ifc_internet -j MASQUERADE
>>the hosts of the internal network can do ping to internet, and this is=20
>>normal, but they can not open any web or conection the msn , they
>>only can do ping. This is very stranger. I try the kernels=20
>>2.6.7,2.6.7,2.6.8 and 2.6.9 and they do no work.
>>   =20
>>
>You can ping so NAT and routing seems to work.
>Are there any other rules in the FORWARD chain?=20
>
><try>
>maybe you should check if DNS is working?
></try>
>
> =20
>
>>Can somebody help me, please?
>>   =20
>>
>send more Info e.g. output of=20
>iptables -L -nvx
>iptables -t nat -nvx
>
> =20
>
>>Sorry for my bad english.
>>   =20
>>
>me too ;-)
>
>
>Andreas Grabner
>
>
> =20
>
I know that the dns is working because when I do "ping www.google.es"=20
from  internal host  this  work.
There are not other rules in the FORWARD chain, look:

    Chain INPUT (policy ACCEPT 2 packets, 100 bytes)
        pkts      bytes target     prot opt in     out    =20
source               destination

    Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
        pkts      bytes target     prot opt in     out    =20
source               destination

    Chain OUTPUT (policy ACCEPT 5958 packets, 2480411 bytes)
        pkts      bytes target     prot opt in     out    =20
source               destination

and if i do iptables -t nat -L -nvx, then:

    Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
        pkts      bytes target     prot opt in     out    =20
source               destination

    Chain POSTROUTING (policy ACCEPT 1 packets, 60 bytes)
        pkts      bytes target     prot opt in     out    =20
source               destination
           0        0 MASQUERADE  all  --  *      eth1   =20
0.0.0.0/0            0.0.0.0/0

    Chain OUTPUT (policy ACCEPT 1 packets, 60 bytes)
        pkts      bytes target     prot opt in     out    =20
source               destination

And this is all, :)



