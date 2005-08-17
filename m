From: Leonardo Marques <surf3r0@gmail.com>
Subject: Re: Multirouting 2 ISP with public addresses
Date: Tue, 16 Aug 2005 21:03:40 -0300
Message-ID: <eb5ae9cc0508161703935ca6e@mail.gmail.com>
References: <eb5ae9cc05081611187210c11b@mail.gmail.com>
	<eb5ae9cc0508161122447fc95c@mail.gmail.com>
	<65aa6af905081613295e39edf3@mail.gmail.com>
	<430269CD.6080700@andycable.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <430269CD.6080700@andycable.com>
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
To: Wayne Alday <waynea@andycable.com>
Cc: netfilter@lists.netfilter.org

Hi Wayne,

Please send me this thousand examples wich you have about how to with NAT ;=
)

Thanks, for attention=20

[]s

On 8/16/05, Wayne Alday <waynea@andycable.com> wrote:
> List :
>=20
> I have a similar setup to this gentleman:
>=20
> eth0 connected with the LAN
> eth1 connected with the internet across ISP1
> eth2 connected with the internet acorss ISP2
>=20
> Although I can find a thousand examples on how to do this with NAT,
> there doesnt seem to be anyone wanting to do it with real IP addresses,
> or not that I have found in 3 days of searching.
>=20
> I read the following link :
>=20
> http://lartc.org/howto/lartc.rpdb.multiple-links.html
>=20
> Seems to be just what I need, except I do not wish to load balance or
> have servers avaiable everywhere, or have redundancy, but just for the
> box to do what i guess would be called source routing. My delimma is
> that living in a remote town bandwidth costs are moderate to high. I
> have a 6 meg bonded T-1 setup on a cisco 3640 router that we outgrew
> quickly. A DS-3 connection where I live would of cost nearly 15K / month
> because we live near no POP.So we put some fiber up, and needless to say
> we have 10 / mbit with the capability to turn it up as needed at a much
> cheaper cost. The problem is we are having to eat the monthly charges
> for our current bandwith and would like to utilize it for CPE. Im pretty
> sure with the research I have done that this is possible to put on our
> current linux router, but  I must be  missing a key somewhere, and I
> would like a fresh look on the problem.
>=20
> Here is what I wish to do.
>=20
> eth1 is connected to my 6mbit line thru the FE0/0 port on the
> router.(192.168.200.2)
> eth2 is connected to the fiber transceiver to 10 mbit (192.168.252.2)
> eth0 is connected to my lan. (12.150.243.129)
>=20
> I have route statements in the 3640 that route ALL traffic for the
> public addresses thru a private subnet
> ip route 12.37.169.0 255.255.255.0 192.168.200.2
> ip route 12.150.225.0 255.255.255.0 192.168.200.2
> ip route 12.150.243.128 255.255.255.224 192.168.200.2
> ip route 12.150.243.160 255.255.255.240 192.168.200.2
> ip route 12.150.243.176 255.255.255.240 192.168.200.2
> ip route 12.150.243.192 255.255.255.192 192.168.200.2
> ip route 12.175.45.0 255.255.255.128 192.168.200.2
>=20
> The linux box in turn hands it off to various other parts and routers
>=20
> What I would like to do is throw the following 4 Class C addresses onto
> eth2 and have them route according to what network.
> 70.158.60.0
> 70.158.61.0
> 70.158.62.0
> 70.158.63.0
> For instance if I assign a CPE an Ip address in the 12.150 range, i wish
> for all that traffic to route out eth1 to the wireline
> If I assign a CPE IP in the 70.158 ranges, I would like it to route out e=
th2
>=20
> The router on the other side of the fiber net has the exact same routes
> for the 70.158 ranges as the ones on my wireline with the exception
> they are routing to 192.168.252.2 instead of 192.168.200.2
>=20
> Ive seen suggestions on marking packets, setting up 2 routing tables,
> and others, but i have had limited success on getting this going.
>=20
> Could anyone provide some thoughts or input or an example? It would be
> greatly appreciated. If I havent been descriptive enough, will provide
> more details
>=20
> Thanks in advance
>=20
> --Wayne
>=20
>=20


--=20
------------------------------
Leonardo Marques
http://www.analyx.org
------------------------------

