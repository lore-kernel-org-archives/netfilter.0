From: "Andrew Smith" <nfml@k1k2.com>
Subject: Re: ip_conntrack
Date: Sat, 19 Oct 2002 12:31:20 +1000 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <32929.192.168.7.14.1034994680.squirrel@iw.k1k2.com>
References: <1034849553.13111.2.camel@elendil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1034849553.13111.2.camel@elendil>
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

> Le jeu 17/10/2002 =E0 11:37, jrw@ngi.be a =E9crit :
>> How could I remove a connection listed in the ip_conntrack file?
>> Because, now, I must wait until the timeout...
>=20
> See ipconntrack thread : you can't.
>=20
>> And if it's not possible, is there a way to change the timeout?
>=20
> Apply patch-o-matic tcp-window-tracking patch which provide a set of
> sysctl (/proc/sys/net/ipv4/netfilter/) to tweak conntrack behaviours,
> such as timeout. As far as I can remember, this feature has been
> released separatly from TCP windows tracking and posted to devel
> mailing list, but I can't find related post :/
>=20
> Another way is to directly hack kernel sources to modify thoses
> timeouts into header files.
>=20
> --=20
> C=E9dric Blancher  <blancher@cartel-securite.fr>

Actually, the real problem is that according to the dev team,
noone needs to change the timeout so they will not code to allow
that
I'm interested to see if there really was a patch-o-matic patch
to do this - but maybe it got removed by the dev team?

Below is my 'argument' with Harald regarding this earlier in the year
where he effectively said that the current value handles all cases
and should not be tuneable:

> On Thu, Jun 27, 2002 at 12:21:45PM +1000, Andrew Smith wrote:
>> This gives a good example when being able to set the timeout dependant
>> upon specific factors (e.g. port/protocol) would be good rather than a
>> global timeout that suits specific cases and does not match many cases
>> - and causes a severe problem for a limited set of cases
>=20
> Sorry, but we've had this discussion over and over again. Go to the
> list archives and look for tuneable timeouts.
>=20
> The conclusion of this discussion was, that we need to cope with all
> cases without any tuning being necessarry.=20

Well either there is a language mistake or that statement is rubbish.
It does NOT cope with all cases.
If fails dismally with the case I've given.
It is not POSSIBLE to cope with all cases without any tuning being
necessary unless the code tuned itself.

Pity that the conclusion is flawed.

> btw: For the 'ping' case, the icmp echo reply is closing the connection
> anyway.

So I guess I need to look in detail what is happening in my case
- but at a guess the problem might be that a large number of the
connections fail to get a fast enough response and thus do not get
closed for a 'long' time.

> conntrack is mostly about tracking layer 3+4 protocol state.  And this
> should happen as transparent as possible, so assumptions about the
> application are made.  [conntrack helpers are an exemption, and be sure
> I would be much happier if we didn't need to have them].
> - Harald Welte / laforge@gnumonks.org             =20

Yes but the problem is that it causes problems at a higher protocol
level and though it works for most cases - it fails on at least a
few specific cases.

Anyway - this argument will not get anywhere.
I guess some time (in the far distant future :-) when I have the
time and inclination I'll fix it myself and then just have to keep
patching it every time it's updated - coz the comments certainly
suggest that a patch would not be accepted here.

--=20
-Cheers
-Andrew

MS ... if only he hadn't been hang gliding!


