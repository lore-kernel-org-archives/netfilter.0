From: "Baake, Matthias" <m.baake@porta.de>
Subject: RE: smtp/pop and NAT only
Date: Wed, 18 May 2005 17:37:03 +0200
Message-ID: <201E6F5AC48C274996A5AD8304FAEF869ABB@p001ex03.porta.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Jason Opperisano <opie@817west.com>
Cc: "Netfilter (E-Mail)" <netfilter@lists.netfilter.org>

well i understood that he has a dynamnic ip address.
the=20

"> No static IP"

statement was from the original poster afaik. correct me if iam wrong.

Greets,
Matthias

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Jason
Opperisano
Sent: Wednesday, May 18, 2005 5:29 PM
To: netfilter@lists.netfilter.org
Subject: Re: smtp/pop and NAT only


On Wed, May 18, 2005 at 02:21:50PM +0200, Baake, Matthias wrote:
> No static IP
>=20
> in this case this should work.
>=20
>   $IPT -t nat -A POSTROUTING -o eth0 -s 192.168.0.0/24 -j MASQUERADE

MASQUERADE is for dynamic IP situations, SNAT is for static IP
situations.  why are we recommending MASQUERADE in a static IP
situation?

-j

--
"Stewie: Now look here...  Jo-LENE. I have an army to raise and I must
 get to Managua at once. I require a window seat and an in-flight Happy
 Meal. BUT NO PICKLES. OH, GOD HELP YOU IF I FIND PICKLES."
        --Family Guy


