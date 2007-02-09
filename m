From: "Andrus, Mr. Brian \(Contractor\)" <brian.andrus@nrlmry.navy.mil>
Subject: RE: Iptables proxy to a different network
Date: Fri, 9 Feb 2007 08:04:28 -0800
Message-ID: <D392D4803D14354CBC49D772E19DD0CD45660B@zeus.w2k.nrlmry.navy.mil>
References: <D392D4803D14354CBC49D772E19DD0CD45660A@zeus.w2k.nrlmry.navy.mil>	<45CC5A91.4090200@plouf.fr.eu.org><Pine.LNX.4.61.0702091338030.31955@yvahk01.tjqt.qr>
	<45CC919C.7030104@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <45CC919C.7030104@plouf.fr.eu.org>
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

Hmmm.

So to properly do this, I _must_ SNAT the connection and route them back =
from system C via system B?
I was afraid of that. Not sure how I would route them because System C =
is on a different subnet than system B.

Diagram:

+---------------+
|   System A    |
+-------+-------+
        |
{=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D}
{    Internet   }
{=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D}
        |
+---------------+        +---A.B.C.x-----+
|    Router     +--------|   System B    +
+-------+-------+        +---------------+
        |
+-------+-------+
|   System C    |
+---X.Y.Z.x-----+


To make matters worse, System C runs Windoze. I am trying to have =
A.B.C.x be my DMZ with System B as my proxy for various services.

Brian



-----Original Message-----
From: netfilter-bounces@lists.netfilter.org =
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Pascal =
Hambourg
Sent: Friday, February 09, 2007 7:22 AM
To: netfilter@lists.netfilter.org
Subject: Re: Iptables proxy to a different network

Jan Engelhardt a =E9crit :
> On Feb 9 2007 12:27, Pascal Hambourg wrote:
>=20
>>>-----------
>>>*nat
>>>-A PREROUTING -p tcp --dport 80 -j DNAT --to x.y.z:80 COMMIT
>>>-----------
>>
>>If you cannot or do not wish to prevent direct routing between the=20
>>client and the server, you must SNAT the forwarded connections in the =
POSTROUTING chain.
>=20
> Or make it so that any packets from C pass B.

This is what I meant when I wrote "prevent direct routing between the =
client and the server".

> For example, by setting up
> your proxy box as a router or bridge (both approaches work) in the =
middle.

I may be wrong, but doing IP NAT on a bridge seems to me quite unnatural =
and troublesome.

