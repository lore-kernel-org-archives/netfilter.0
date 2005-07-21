From: "curby ." <curby.public@gmail.com>
Subject: Re: Bridge DNAT
Date: Thu, 21 Jul 2005 17:26:58 -0600
Message-ID: <5d2f3791050721162626fc3b4b@mail.gmail.com>
References: <Pine.LNX.4.61.0507211846500.32348@yvahk01.tjqt.qr>
Reply-To: "curby ." <curby.public@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0507211846500.32348@yvahk01.tjqt.qr>
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: Netfilter User Mailing List <netfilter@lists.netfilter.org>

On 7/21/05, Jan Engelhardt <jengelh@linux01.gwdg.de> wrote:
> The redirection works as expected when someone from the internet<eth0>
> connects to the server.
> But within the internal network, the following happens:
>   .44.2 telnets to .44.1:9000
>   .44.1 rewrites the destination and sends it to .44.3 (SYN)
>   .44.3 replies with SYN ACK
>   .44.2 replies with RST - it does not know the connection

This looks like the NAT onto same network problem, which the howto
recommends you take care of using SNAT in addition to DNAT.  Does that
work?

http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html

>=20
>=20
> What have I done wrong? Or is this just that the bridge code does not ful=
ly
> handle layer3 DNAT?
>=20
>=20
> Jan Engelhardt
> --
>=20
>

