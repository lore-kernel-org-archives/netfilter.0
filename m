From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: problem reach the internal.
Date: Fri, 29 Nov 2002 21:20:41 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211292120.41544.netfilter@newkirk.us>
References: <20021130010348.58897.qmail@web14507.mail.yahoo.com> <3DE815EA.9040303@fugmann.dhs.org>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DE815EA.9040303@fugmann.dhs.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Anders Fugmann <afu@fugmann.dhs.org>, "james.Q.L" <shijialeeee@yahoo.ca>
Cc: netfilter@lists.netfilter.org

On Friday 29 November 2002 08:35 pm, Anders Fugmann wrote:
> james.Q.L wrote:
> > sorry, i forgot mention that the request from outside my local networ=
k to
> > the INET_IP:8888 is fine. only the internal request to it fails.
> >
> > i do not see what is wrong in the rules, anyone ?
>
> It cannot be done, as the webserver will try to give an answer to the
> query directly, and not back through your router, and thus the client
> will not accept the reply.
>
> For a more complete explanation, search the email archives. This
> question has been asked and answered numerous times.

That's what his SNAT rule should handle: (snippet from original message)

> the rules i added to try to make it work are :
>=20
> iptables -t nat -A PREROUTING -p tcp -i eth1 --dport 8888 \
>       -j DNAT --to-destination 192.168.0.3:80
> iptables -A FORWARD -p tcp --dport 80 -d 192.168.0.3 -j ACCEPT
> iptables -t nat -A POSTROUTING -p tcp -s 192.168.0.0/24 -d 192.168.0.3 =
\
>     --dport 80 -j SNAT --to-source 192.168.0.1

port 80 requests heading out to the server (192.168.0.3) from anywhere on=
 the=20
lan (already DNATted in prerouting) are SNATted to appear to come from th=
e=20
firewall/router (192.168.0.1) so that they return through it properly.  Y=
es,=20
this has been answered before, and is covered in the DNAT section of Osca=
r's=20
tutorial, but the rules he has here appear to be correct. (well, along wi=
th=20
the FORWARD EST/REL rule I didn't include in this snippet)

James - I'd recommend that you try:
iptables -z
to clear counters, then try accessing the server from the LAN, then
iptables -L -v -n
to list your ruleset along with the packet/byte counts which matched.  Th=
is=20
will often show where unexpected things are happening.  IE, if the counts=
 in=20
the FORWARD rules accepting ESTABLISHED/RELATED and packets destined for =
the=20
server are both zero, then the problem is at PREROUTING.  If the FORWARD=20
count for server-bound shows your request, but your POSTROUTING SNAT is z=
ero,=20
or if those both show counts but nothing coming back from the server=20
(EST/REL) those can narrow things down.  (of course if the DNAT rule in=20
PREROUTING counts 0 that pretty much nails the problem down... :^) Extrem=
e=20
Logging can help as well, where you insert a LOG rule as the first rule i=
n=20
each chain, try to connect, then check the logs.  This can generate a LOT=
 of=20
logging if there is other activity through the firewall, though.  If you =
do=20
this, you should log nat PRE and POST, FORWARD, and INPUT.  The first thr=
ee=20
are where it should be, the fourth is where it shouldn't but might, if th=
e=20
DNAT isn't matching.

I'd also suggest you reconsider FORWARD rule #2, which accepts EVERYTHING=
, and=20
limit your MASQUERADE to traffic outbound to the internet, simply with=20
-o $eth0 or whatever interface connects to the world.

j


