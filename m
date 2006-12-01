From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: how do I set the MAC address in POSTROUTING?
Date: Fri, 01 Dec 2006 16:49:48 +0100
Message-ID: <45704F1C.7070703@plouf.fr.eu.org>
References: <eknslc$rpq$1@sea.gmane.org> <200612010153.55904.Daniel@musketa.de>
	<ekph22$1va$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ekph22$1va$1@sea.gmane.org>
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

sean a =E9crit :
> Daniel Musketa wrote:
>>
>> AFAIK MAC addresses are used in ethernet to address ethernet frames.=20
>> On ip routed ppp0 no ethernet frames arrive.
>=20
> OK. If that's the case, then the --mac-source target would only work on=
=20
> a LAN, not over the ethernet.

I guess you mean over the *in*ternet. Ethernet is a LAN technology.

> This would mean thatthe --mac-sourse=20
> target has very limited use - only on local LANs.

Indeed, the scope of a MAC address is link local, limited to the LAN.

> But there is still a place for a MAC address.

On an IP/PPP link ? No way. A PPP interface has no MAC address, it is=20
useless. There is a place only in the lines that the LOG target prints=20
because they have a fixed format.

> How can I  put one in the=20
> packet on the client side? This would allow me to use it over the inter=
net.

You cannot use MAC addresses over an IP/PPP link. You cannot rely on MAC=20
addresses over the internet either because this is layer 2 information=20
that is not routed by definition.

