From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: just a remind
Date: Fri, 13 May 2005 14:43:06 +0200
Message-ID: <200505131243.j4DCh9dc012817@smtp26.wxs.nl>
References: <1115987802.4561.49.camel@ngeza>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1115987802.4561.49.camel@ngeza>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi,

DROP =3D refuse the packets and do nothing.
REJECT =3D refuse the packets and send unreachable or other packet (what =
you
have set for REJECT target) to sender.
MIRROR =3D Reverse the source and destination IP and send the packet =
back to
sender.

All are terminating targets.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of =
Rakotomandimby
(R12y) Mihamina
Sent: 13 May 2005 14:37
To: netfilter@lists.netfilter.org
Subject: Re: just a remind

On Fri, 2005-05-13 at 17:35 +0530, hareram wrote:
> you need to Drop all and allow what are the services required that is=20
> the best practice

Yes, the policy is to drop.

But is REJECT a terminatig target?=20
(I just dont remember)

I know that ACCEPT is "terminating". I mean if a packet matches and is
ACCEPTed, it is not processed by the following rules.


--=20
ASPO Infog=E9rance       http://aspo.rktmb.org/activites/infogerance
Unofficial FAQ fcolc   http://faq.fcolc.eu.org/
LUG sur Orl=E9ans et alentours (France).
T=E9l : 02 34 08 26 04 / 06 33 26 13 14




