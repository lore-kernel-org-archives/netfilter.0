From: <bmcdowell@coxhealthplans.com>
Subject: RE: IP Spoofing
Date: Wed, 5 Nov 2003 14:53:05 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D731011312D2@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org


This is similar (except FORWARD rather than INPUT) to what I do in my =
own environment.  In fact, I have layered firewalls that specify =
individual IPs.  Of course, my firewalls are bridges =
(bridge.sourceforge.net), so most of the traffic comes in one eth and =
goes out the other.

E.g.

iptables -A FORWARD -i eth0 -s 192.168.1.5 -j DROP
iptables -A FORWARD -i eth1 -s ! 192.168.1.5 -j DROP

...where 192.168.1.5 is the protected server, eth0 is in the DMZ and =
eth1 connects directly to said server.


Just chiming in again,

Bob

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of David C. Hart
Sent: Wednesday, November 05, 2003 2:08 PM
To: Antony Stone
Cc: Iptables Mailing List
Subject: Re: IP Spoofing


On Wed, 2003-11-05 at 14:51, Antony Stone wrote:
> On Wednesday 05 November 2003 7:31 pm, Leandro Takashi Hirano wrote:
>=20
> > Now I would like to know about the IP Spoofing rule, how does it =
works?
> >
> > -	iptables -A INPUT -s 192.168.1.0/24 -i ! eth0 -j DROP
>=20
> Any packet with a source address in the Class C range 192.168.1.x =
which does=20
> not come from eth0 will be DROPped.

Funny I was similarly confused. What happens to packets from the LAN
given that they don't originate from eth0?
>=20
> > I don=C2=B4t know how can it block ip spoofing attack...
>=20
> These rules assume that eth0 is your internal network, and your =
internal=20
> network range is 192.168.1.0/24.
>=20
> No packets with your own source address should come from outside (rule =
1) and=20
> all packets from inside should have your own source address (rule 2).
>=20
> Therefore these two rules stop people on the outside pretending that =
they=20
> live on your network, and people on the inside pretending that they =
don't.
>=20
> Antony.

