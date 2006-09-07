From: Danny Rathjens <gmane@rathjens.org>
Subject: Re: Newbie question about NAT and forwarding
Date: Thu, 07 Sep 2006 12:27:20 -0400
Message-ID: <45004868.40501@rathjens.org>
References: <20060906205232.GA23980@crowfix.com> <ednhr3$pjc$1@sea.gmane.org>
	<44FF5F42.4050605@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44FF5F42.4050605@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: netfilter@lists.netfilter.org

Pascal Hambourg wrote:
> Danny Rathjens a =C3=A9crit :
>> ip route add default via $dialup_gateway dev eth0 table mail
>=20
>                                            ^^^^^^^^
> "dev ppp0" would be better IMHO.

Yeah, was just a mistake.  I had cut and paste from my own setup
where eth0 is the alternate route to world and missed that when I
changed the paste to fit his setup.


