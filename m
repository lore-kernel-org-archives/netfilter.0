From: "Iptables" <Iptables@InterCept.Net>
Subject: RE: REDIRECT vs. DNAT (Was: HELP! Transparent Proxy
	usingbridging...)
Date: Thu, 24 Mar 2005 13:12:32 -0500
Message-ID: <3BEC0FC090F538409A0736B2D37DA0ED013D355A@icptex02.corp.icpt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

You could possible tunnel the traffic to the remote squid box. I have
some remote servers at customers sites, and I have stunnel running on
them listening on port 80, which sends them to a squid proxy here at my
location.

you can use ssh -L feature and forward port 3128 to port 80 or 3128 on
the squid box. I.e. ssh -L 3128:remoteip:80 -l squid 172.16.3.42

http://www.linuxjunior.org/cgi-bin/pet/pet.cgi?SUBMIT=3DDisplay&id=3D106


you could also, maybe use the netfilter-pom-ng route feature and do
something like this..

iptables -A PRETROUTING -i eth1 -t mangle -p tcp --dport 80 -j ROUTE
--gw squid-ip --continue

so the squid box is the gateway for port 80 traffic..

I may have to come up with something similar, as we were bought by
another company and they use websense to filter out unique(smile)
websites.

Thanks,
Michael Brown

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Grant Taylor
Posted At: Thursday, March 24, 2005 11:09 AM
Posted To: Iptables
Conversation: REDIRECT vs. DNAT (Was: HELP! Transparent Proxy
usingbridging...)
Subject: Re: REDIRECT vs. DNAT (Was: HELP! Transparent Proxy
usingbridging...)

Yes, REDIRECT redirects traffic passing through the system to it's self,
but it does not give you an option to send the traffic any where else.
If you want to send the traffic passing through the system to a
different one on the LAN or where ever you need something other than
redirect.  DNAT will send the packets to the other system but appear as
if it is still coming from the original client system, thus SNAT makes
the traffic appear to the system that you are sending the traffic to as
if it is coming from the system that is doing the redirection.  The
reason the traffic has to appear as if it is coming from the system
doing the redirection is b/c the traffic must travel the same path (host
IPs) in reverse as to not confuse the client system with the response
coming from a different IP than the request was sent too.



Grant. . . .

Toby wrote:

> Jason Opperisano wrote:
>=20
>>REDIRECT is a whole different beast from DNAT.
>=20
>=20
> As in?
>=20
> Doesn't REDIRECT just do a DNAT to the machine's own address?
>=20
>=20
> Toby
>=20




