From: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Subject: Re: Load Balancing / Merging speed
Date: Sun, 22 May 2005 04:02:40 +0200
Message-ID: <fad9d484050521190232697369@mail.gmail.com>
References: <1116658510.2529.130.camel@debianbox>
	<fad9d48405052115331ed980d0@mail.gmail.com>
	<1116715548.2529.142.camel@debianbox>
	<fedfc2605052116003feb49b0@mail.gmail.com>
Reply-To: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <fedfc2605052116003feb49b0@mail.gmail.com>
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
To: =?ISO-8859-1?Q?Eduardo_Fern=E1ndez?= <efgonzalez@gmail.com>
Cc: netfilter@lists.netfilter.org

On 5/22/05, Eduardo Fern=E1ndez <efgonzalez@gmail.com> wrote:
> Hi,
>=20
> On 5/22/05, Sadus . <sadus@swiftbin.net> wrote:
> > I can't seem to find the archive, i searched untill June 2004?
> > link aggregation
> > Basicaly i knew that i could do such a thing using Bonding/Trunking/Lin=
k
> > Aggragation but is there a simpler way using iptables/iproute only and
> > using only 1 NIC (with 2 different IPs/Subnets)
>=20
> Bonding? You don't use that to merge two internet lines, that's for
> making two NIC's work as if they were only one, thus doubling the
> speed. With bonding linux "sees" one device where you had two. You can
> only set up bonding between two computers or between a computer and a
> switch which supports bonding (it's got different names depending on
> the brand).

Nope, this is not bonding. What Sadus is looking for is called link
equalization IIRC. It's where you use different links of varying
speeds and tie them up together for use as one connection.
Traditionaly you'd use a round-robin method of sending packets out
over multiple default routes. This is not always ideal, you'd need
some kind of intelligence to spread the load more realistically, and
the Linux EQL driver and TEQL device allows for that to happen. These
two know the speed of each link in the equation, and delivers better
control, albeit not perfect.

Now, Sadus, my apologies. The thread I was referring to was on the
LARTC list. The LARTC list is in any case the better list for these
kinds of questions. iptables cannot perform this task, you need the
iproute2 package, and LARTc is the definitive source for information
and discussions on the topic.

The website is http://lartc.org/ and http://lartc.org/howto. The
thread I was referring to is available at
http://marc.theaimsgroup.com/?l=3Dlartc&m=3D111429252500344&w=3D2

Hope this helps, and share your experiences if you don't mind!

>=20
> > thanks
> >
> > On Sun, 2005-05-22 at 00:33 +0200, Kenneth Kalmer wrote:
> > > On 5/21/05, Sadus . <sadus@swiftbin.net> wrote:
> > > > Hello,
> > > > If i want to search for HOWTOs that can enable me to merge the
> > > > connection speed of multiple providers (inboud/outbound), what shou=
ld i
> > > > search for?
> > >
> > > The nano howto if I'm not mistaken, and have a look at the eql qdisc
> > > and teql device.
> > >
> > > >
> > > > what i mean by merging is, lets say my connection is shaped at 100K=
 and
> > > > the other is also shaped at 100K, i want to be able using the 2 ISP=
s to
> > > > have 200K (in/out),
> > > >
> > > > Does anyone have a HOWTO or Article about that Matter?
> > >
> > > I asked a similar question in the list not too long ago. Search the
> > > archives for the subject "Spill over" and have a look. There was some
> > > excellent replies from other members on the topic. I have honestly no=
t
> > > had the chance to properly test the configurations myself, but from m=
y
> > > searching and discussions here it won't be an easy feat to achieve.
> > >
> > > Relative load balancing is not that difficult, but to fully maximize
> > > the utilization of each link is another story.
>=20
> Cheers!
>=20
> Edu
>=20


--=20

Kenneth Kalmer
kenneth.kalmer@gmail.com
http://opensourcery.blogspot.com

