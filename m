From: Elver Loho <kernelpenguin@hot.ee>
Subject: Possible dangerous flaw in the NAT howto
Date: Sun, 22 Jun 2003 05:44:49 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030622024450.19E60105939@hot.ee>
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

I was on #netfilter (irc.freenode.net) earlier and asked about a possible f=
law in the NAT howto, but got no reply (people sleeping?) so I'm just going=
 to paste what I said here and go to sleep. (nearing 6am currently)


<elver> I have a question about masquerading. The NAT howto gives an exampl=
e like this: "iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE", but si=
nce it masks the packets that are outgoing on ppp0 (by the destination IP, =
interface IP and netmask) then could that rule also be exploited by outside=
 hosts tunneling?
<elver> For example, we have host A on subnet where the gateway to the inte=
rnet is B (running that same rule) and then there are external hosts on the=
 internet C and D. A's packets to C and D are masq'ed by B, but can't C and=
 D also use B as a IP-level proxy to communicate to eachother?
<elver> Over LAN the routing is done on the ethernet level usually, but ove=
r the internet this could possibly done by IP encapsulation (RFC 2003 and R=
FC 1853)
<elver> Coming back to the example, C tunneling through B to D would look s=
omething like [ IP layer: from C to B [ IP layer: from C to D [ TCP layer [=
 Data ] ] ] ]
<elver> RFC 2003 does however define that if the source IP is the same as a=
ny interface on itself, then it should drop it. So therefore, C can't fake =
the address part to be B. However, with masquerading, it would NAT the conn=
ection and thus to D it would appear as if the data was coming from B.
<elver> Since Netfilter does NAT in the POSTROUTING table, then it only car=
es about the outgoing interface, which would be ppp0 or whatever your inter=
net link might be.
<elver> The problem would be delivering the packet to B so that B would thi=
nk that it is outgoing on it's internet link.
<elver> Since routing is done at a higher layer (Ethernet layer above the I=
P layer for example) then IP encapsulation could possibly used to deliver i=
t to host B.
<elver> The quick and dirty masquerading part of the NAT howto at netfilter=
.org (http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-4.html#ss4.1)=
 does not build any safeguards against this.
<elver> Sensible way would be denying all forwarding requests coming in ove=
r the internet link.
<elver> Potentially this could mean that there are hundreds of Linux gatewa=
ys out there that could be used as anonymous proxies.
<elver> Funny. The Masquerading Simple Howto (http://www.linuxdocs.org/HOWT=
Os/Masquerading-Simple-HOWTO/summary.html) DOES address that specific secur=
ity hole by adding "iptables -A FORWARD -i eth0 -o eth0 -j REJECT".
<elver> So I would say that anyone using just netfilter.org howto could be =
vulnerable. (http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-4.html=
#ss4.1)


This inconsistency between howtos was pointed out by Peter Johansson (x-g@g=
amleby.net) when he was looking for docs while setting up his Linux gateway=
. I did the additional research into the subject.


Elver Loho
kernelpenguin@hot.ee

-----------------------------------------
Hot Mobiil - helinad, logod ja pilts=F5numid!
http://portal.hot.ee


