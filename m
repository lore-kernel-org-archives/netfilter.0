From: "curby ." <curby.public@gmail.com>
Subject: Re: IP forwarding
Date: Wed, 3 Aug 2005 23:02:44 -0600
Message-ID: <5d2f3791050803220225ab8670@mail.gmail.com>
References: <286cf082050803183749d1f514@mail.gmail.com>
	<200508040415.j744FBjF040033@fenyo.mail.t-online.hu>
Reply-To: "curby ." <curby.public@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508040415.j744FBjF040033@fenyo.mail.t-online.hu>
Content-Disposition: inline
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
To: =?ISO-8859-1?Q?G=F6m=F6ri_Zolt=E1n?= <suf@freemail.hu>
Cc: netfilter@lists.netfilter.org

On 8/3/05, G=F6m=F6ri Zolt=E1n <suf@freemail.hu> wrote:
> Hi,
>=20
> > -----Original Message-----
> > From: netfilter-bounces@lists.netfilter.org
> > [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of
> > Ricardo J. M=E9ndez
> > Sent: Thursday, August 04, 2005 3:38 AM
> > To: netfilter@lists.netfilter.org
> > Subject: IP forwarding
> >
> > Hi,
> >
> > I've got a network setup where the internal router is a Linux box
> > running iptables.  External interface is eth0, internal eth1.  I'm
> > attempting to forward an external IP address (say, 1.2.3.4) to an
> > internal machine.
> >
> > The rule I added is:
> >
> > iptables -t nat -A PREROUTING -d 1.2.3.4 -p tcp --dport 80 -j DNAT
> > --to 192.168.1.202
>=20
> The roule should look like this:
>=20
> iptables -t nat -A PREROUTING -d 1.2.3.4 -p tcp --dport 80 -j DNAT
> --to-destination 192.168.1.202

Actually, I believe that --to is a valid unique prefix for
--to-destination.  The fact that it didn't flag as a syntax error
supports this.

The problem is that locally generated packets (from the firewall
itself) to 1.2.3.4 never pass through filter.PREROUTING.  Each
forwarded port may need up to four rules to NAT all access.  The
script I use (at http://www.curby.net/doc/curbywall ) is an example of
using all four, though it may be difficult to understand.  The general
principle but applied to the SNAT-ed network as opposed to localhost=20
is described in

http://netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html

Other folks here are proponents of running a local DNS server so you
don't have to do such NAT contortions.

--Curby

