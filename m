From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: Iptables, nat, and IPSec
Date: Wed, 06 Apr 2005 19:03:12 +0200
Message-ID: <42541650.1080206@lopsch.com>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4wwL6DwAQAAAA+1cYJf7sR0Sh2A7HkLkwFgEAAAAA@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4wwL6DwAQAAAA+1cYJf7sR0Sh2A7HkLkwFgEAAAAA@rogers.com>
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

dave beach schrieb:
>  > It=B4s an IPSec problem. I don=B4t want to go into detail but you pr=
obably
> should try NAT-Traversal.
>  > For the theory http://www.ipsec-howto.org/x180.html
>=20
> Okay, I've read the reference. If I understand correctly, I need to use=
 a
> NAT methodology that implements "NAT Traversal" (the reference is a lit=
tle
> vague on this; in fairness, it does say "There are no RFCs at the momen=
t").
> It might be therefore fair to say that the Linksys implementation inclu=
des
> NAT Traversal, enabling it to handle multiple IPSec passthrough connect=
ions.
>=20
> Which leads me to what I suppose was the original question, now slightl=
y
> modified: does iptables support NAT Traversal?
>=20
>=20
from the webpage:
"What does NAT traversal do to help? NAT-traversal again encapsulates=20
the ESP packets in UDP packets. These can easily be handled by a NAT=20
device since they provide ports."

So you have to activate on your clients the NAT-T "feature" and be sure=20
the other side supports it too.

And to answer your question, yes every NAT device should be able to=20
handle multiple IPSec NAT-Ted connections because they are wrapped=20
within UDP packets and so every connection can be tracked. Essentially=20
is that both sides which use IPSec are aware of NAT-T and it is=20
correctly configured.

