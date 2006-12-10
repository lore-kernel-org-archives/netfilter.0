From: sean <seandarcy2@gmail.com>
Subject: Re: how do I set the MAC address in POSTROUTING?
Date: Sun, 10 Dec 2006 11:44:15 -0500
Message-ID: <457C395F.1000702@gmail.com>
References: <eknslc$rpq$1@sea.gmane.org>
	<200612010153.55904.Daniel@musketa.de>	<ekph22$1va$1@sea.gmane.org>
	<45704F1C.7070703@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45704F1C.7070703@plouf.fr.eu.org>
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

Pascal Hambourg wrote:
> Hello,
>=20
> sean a =E9crit :
>> Daniel Musketa wrote:
>>>
>>> AFAIK MAC addresses are used in ethernet to address ethernet frames.=20
>>> On ip routed ppp0 no ethernet frames arrive.
>>
>> OK. If that's the case, then the --mac-source target would only work=20
>> on a LAN, not over the ethernet.
>=20
> I guess you mean over the *in*ternet. Ethernet is a LAN technology.
>=20
>> This would mean thatthe --mac-sourse target has very limited use -=20
>> only on local LANs.
>=20
> Indeed, the scope of a MAC address is link local, limited to the LAN.
>=20
>> But there is still a place for a MAC address.
>=20
> On an IP/PPP link ? No way. A PPP interface has no MAC address, it is=20
> useless. There is a place only in the lines that the LOG target prints=20
> because they have a fixed format.
>=20
>> How can I  put one in the packet on the client side? This would allow=20
>> me to use it over the internet.
>=20
> You cannot use MAC addresses over an IP/PPP link. You cannot rely on MAC =

> addresses over the internet either because this is layer 2 information=20
> that is not routed by definition.
>=20
>=20

But I don't want to use the MAC address to route anything. I=20
just want to stick it in the packet so _iptables_ will see it.

The internet routers just look at the ip address, so I=20
wouldn't think they'd strip out the MAC address, do they?

If not, then if the client inserts a MAC address, couldn't=20
iptables use it when it finally arrives.

sean


