From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?=
	<leolistas@solutti.com.br>
Subject: Re: Target ROUTE
Date: Wed, 5 Jan 2005 09:31:10 -0300
Message-ID: <002801c4f322$70d1ece0$8b00000a@casa>
References: <20050105092351.2652e925@jcesar.fnde.gov.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"; reply-type="original"
To: =?iso-8859-1?Q?J=FAlio_C=E9sar_de_Magalh=E3es?= <jcesar@fnde.gov.br>, netfilter@lists.netfilter.org


    That means your kernel or/AND iptables doesnt have the ROUTE target=20
compiled and ready for use.

    Try the command:    iptables -j ROUTE --help

    If ROUTE target is compiled, you should see something like this:

ROUTE target v1.8 options:
    --oif       ifname          Route the packet through `ifname' network=
=20
interface
    --iif       ifname          Change the packet's incoming interface to=
=20
`ifname'
    --gw        ip              Route the packet via this gateway
    --continue                  Route the packet and continue traversing =
the
                                rules. Not valid with --iif.

    on the end of the help message. If you see only the iptables help, th=
at=20
means ROUTE is really not compiled.

    If that's the case, you'll need to get a patch-o-matic file, apply RO=
UTE=20
patch on your kernel source, recompile and install the new kernel and=20
probably recompile iptables also.


    Sincerily,
    Leonardo Rodrigues


----- Original Message -----=20
From: "J=FAlio C=E9sar de Magalh=E3es" <jcesar@fnde.gov.br>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, January 05, 2005 8:23 AM
Subject: Target ROUTE


i need all my network trafic to any host on 995 port goes to another gate=
way=20
then the default. So i execute the following iptables command:
iptables -t mangle -A OUTPUT -p tcp --dport  995 -j ROUTE --gw x.x.x.x
where x.x.x.x is my another gateway .

The problem  when i execute the iptables command above is this:
iptables: No chain/target/match by that name

thanks a lot

J=FAlio C=E9sar de Magalh=E3es
Analista de Suporte - Poliedro/FNDE
(61) 81177547 Bras=EDlia - DF



