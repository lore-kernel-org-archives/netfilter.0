From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: Netfilter meets PBR - I'm starting to tear my hairs out...
Date: Fri, 13 Aug 2004 21:52:30 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <33216.207.236.167.9.1092448350.squirrel@207.236.167.9>
References: <1092306809.2797.45.camel@forge.intermeta.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1092306809.2797.45.camel@forge.intermeta.de>
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
To: hps@intermeta.de
Cc: netfilter@lists.netfilter.org

On Thu, August 12, 2004 6:33 am, Henning Schmiedehausen said:
> Hi,

<snip..>

>
> Instead, the kernel starts to spit out:
>
> Aug 12 12:19:36 router kernel: MASQUERADE: Route sent us somewhere else=
.
> Aug 12 12:19:41 router kernel: NET: 4 messages suppressed.
> Aug 12 12:19:41 router kernel: MASQUERADE: Route sent us somewhere else=
.
> Aug 12 12:19:46 router kernel: NET: 4 messages suppressed.
> Aug 12 12:19:46 router kernel: MASQUERADE: Route sent us somewhere else=
.
> Aug 12 12:19:51 router kernel: NET: 4 messages suppressed.
> Aug 12 12:19:51 router kernel: MASQUERADE: Route sent us somewhere else=
.
> Aug 12 12:19:56 router kernel: NET: 4 messages suppressed.
> Aug 12 12:19:56 router kernel: MASQUERADE: Route sent us somewhere else=
.
>

This had been fixed by Patrick McHardy :
http://lists.netfilter.org/pipermail/netfilter-devel/2004-January/013695.=
html

> The fun thing now is, that if I flush the chain again and do
>
> /sbin/iptables  -t nat -A POSTROUTING -o ppp0 -s 192.168.8.0/24 -j SNAT
> --to-source=3D<dynamic DSL address>
> /sbin/iptables  -t nat -A POSTROUTING -j ACCEPT
>
> then the PBR works. I see the packets going out the ppp0 link:
>
> # tcpdump -i ppp0
> <dynamic dsl address> > internet_host: icmp: echo request
> internet_host > <dynamic dsl address>: icmp: echo reply
> <dynamic dsl address> > internet_host: icmp: echo request
> internet_host > <dynamic dsl address>: icmp: echo reply
>
> Unfortunately I cannot use this in production, because the link will
> have to go up and down and I cannot rewrite the configuration scripts
> (which use masquerade).
>
> So, what am I doing wrong? As far as I can understand, the MASQUERADE
> target is equal to the SNAT target, except that it takes the ip address
> for NATing from the interface and tears down the connections if the
> interface loses its link. Or not? Or have I simply stumbled over a well
> known bug in the RedHat kernel (which seems to be 2.4.22 + lots of
> patches from post-2.4.22)? Or am I just missing some concept that I nee=
d
> to add to my tables?

Initially, MASQUERADE was designed to work with basic & simple network
setup.  Funky routing such as using iproute2 or the ROUTE target isn't
simple networking.

Both are overwriting the already-made routing decision. When it's time to
MASQUERADE, that last one consults the routing table (again). Then, it
compares both output interface decisions and NF_DROP in case they aren't
equal.


For routing that iproute2 can't do, consider using the ROUTE target.
It rocks.

>
> I'd appreciate Cc'ing me as I am not a regular subscriber to this list.
>
> 	Regards
> 		Henning
>
> --

HTH,

Samuel Jean
CookingLinux.org


