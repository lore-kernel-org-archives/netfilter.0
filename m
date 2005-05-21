From: "Sadus ." <sadus@swiftbin.net>
Subject: Re: Load Balancing / Merging speed
Date: Sun, 22 May 2005 02:01:58 +0300
Message-ID: <1116716518.2529.144.camel@debianbox>
References: <1116658510.2529.130.camel@debianbox>
	<fad9d48405052115331ed980d0@mail.gmail.com>
	<1116715548.2529.142.camel@debianbox>
	<fedfc2605052116003feb49b0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <fedfc2605052116003feb49b0@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-9"
To: Eduardo =?ISO-8859-1?Q?Fern=E1ndez?= <efgonzalez@gmail.com>
Cc: netfilter@lists.netfilter.org

So what I am exactly looking for?

On Sun, 2005-05-22 at 01:00 +0200, Eduardo Fern=E1ndez wrote:
> Hi,
>=20
> On 5/22/05, Sadus . <sadus@swiftbin.net> wrote:
> > I can't seem to find the archive, i searched untill June 2004?
> > link aggregation
> > Basicaly i knew that i could do such a thing using Bonding/Trunking/L=
ink
> > Aggragation but is there a simpler way using iptables/iproute only an=
d
> > using only 1 NIC (with 2 different IPs/Subnets)
>=20
> Bonding? You don't use that to merge two internet lines, that's for
> making two NIC's work as if they were only one, thus doubling the
> speed. With bonding linux "sees" one device where you had two. You can
> only set up bonding between two computers or between a computer and a
> switch which supports bonding (it's got different names depending on
> the brand).
>=20
> > thanks
> >=20
> > On Sun, 2005-05-22 at 00:33 +0200, Kenneth Kalmer wrote:
> > > On 5/21/05, Sadus . <sadus@swiftbin.net> wrote:
> > > > Hello,
> > > > If i want to search for HOWTOs that can enable me to merge the
> > > > connection speed of multiple providers (inboud/outbound), what sh=
ould i
> > > > search for?
> > >
> > > The nano howto if I'm not mistaken, and have a look at the eql qdis=
c
> > > and teql device.
> > >
> > > >
> > > > what i mean by merging is, lets say my connection is shaped at 10=
0K and
> > > > the other is also shaped at 100K, i want to be able using the 2 I=
SPs to
> > > > have 200K (in/out),
> > > >
> > > > Does anyone have a HOWTO or Article about that Matter?
> > >
> > > I asked a similar question in the list not too long ago. Search the
> > > archives for the subject "Spill over" and have a look. There was so=
me
> > > excellent replies from other members on the topic. I have honestly =
not
> > > had the chance to properly test the configurations myself, but from=
 my
> > > searching and discussions here it won't be an easy feat to achieve.
> > >
> > > Relative load balancing is not that difficult, but to fully maximiz=
e
> > > the utilization of each link is another story.
>=20
> Cheers!
>=20
> Edu


