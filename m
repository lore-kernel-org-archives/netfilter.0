From: hbeaumont hbeaumont <ahlist@gmail.com>
Subject: Re: blocking irc + botnets
Date: Thu, 4 Aug 2005 12:04:12 -0500
Message-ID: <bc5becf6050804100426d8357a@mail.gmail.com>
References: <bc5becf6050802084137a7ad69@mail.gmail.com>
	<Pine.LNX.4.61.0508040943350.27293@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0508040943350.27293@yvahk01.tjqt.qr>
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
To: netfilter@lists.netfilter.org

On 8/4/05, Jan Engelhardt <jengelh@linux01.gwdg.de> wrote:
>=20
>=20
> >We have servers that could get infected via poorly wrote user scripts. I
>=20
> Fix the servers. Don't let arbitrary scripts in.
>=20
>=20
please take this in a friendly manner :)

When I wrote my initial message, I knew somebody would give me this type of=
=20
reply (ie. secure your servers, smack the bad users)

However the fact is that in REAL LIFE, you will have users that use bad=20
scripts or even "good" script that have bugs (phpbb, etc, etc.).

I want to find a way to make sure that we have an extra layer of protection=
=20
to make sure our servers weren't DOS'ing other boxes - even if it was
only for a short time until an admin logged in to check the source of the=
=20
outgoing traffic spike.

Bottom line :

I simply want to get a good ruleset to share so that anyone who might ever=
=20
have a server compromised (even non-root, php-apache based stuff running as=
=20
nobody) could help
stop the outgoing bad traffic.=20

There is a lot of discussion on stopping things from coming into a server.=
=20
If those of us who run servers (I'm pointing the finger at myself!) would=
=20
take the extra effort to stop what can
possibly go out, it would solve a lot of the problems.=20

I don't have the knowledge to set this up in the best method. That's why I=
=20
asked here.

Thanks to all!
