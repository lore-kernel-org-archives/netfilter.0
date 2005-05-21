From: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Subject: Re: Load Balancing / Merging speed
Date: Sun, 22 May 2005 00:33:02 +0200
Message-ID: <fad9d48405052115331ed980d0@mail.gmail.com>
References: <1116658510.2529.130.camel@debianbox>
Reply-To: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1116658510.2529.130.camel@debianbox>
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
Content-Type: text/plain; charset="us-ascii"
To: "Sadus ." <sadus@swiftbin.net>
Cc: netfilter@lists.netfilter.org

On 5/21/05, Sadus . <sadus@swiftbin.net> wrote:
> Hello,
> If i want to search for HOWTOs that can enable me to merge the
> connection speed of multiple providers (inboud/outbound), what should i
> search for?

The nano howto if I'm not mistaken, and have a look at the eql qdisc
and teql device.

>=20
> what i mean by merging is, lets say my connection is shaped at 100K and
> the other is also shaped at 100K, i want to be able using the 2 ISPs to
> have 200K (in/out),
>=20
> Does anyone have a HOWTO or Article about that Matter?

I asked a similar question in the list not too long ago. Search the
archives for the subject "Spill over" and have a look. There was some
excellent replies from other members on the topic. I have honestly not
had the chance to properly test the configurations myself, but from my
searching and discussions here it won't be an easy feat to achieve.

Relative load balancing is not that difficult, but to fully maximize
the utilization of each link is another story.

>=20
> Thanks
>=20

Only a pleasure

>=20
>=20
>=20


--=20

Kenneth Kalmer
kenneth.kalmer@gmail.com
http://opensourcery.blogspot.com

