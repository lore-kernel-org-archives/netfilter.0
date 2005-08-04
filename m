From: "curby ." <curby.public@gmail.com>
Subject: Re: blocking irc + botnets
Date: Thu, 4 Aug 2005 15:59:38 -0600
Message-ID: <5d2f3791050804145926b9c143@mail.gmail.com>
References: <bc5becf6050802084137a7ad69@mail.gmail.com>
	<Pine.LNX.4.61.0508040943350.27293@yvahk01.tjqt.qr>
	<bc5becf6050804100426d8357a@mail.gmail.com>
Reply-To: "curby ." <curby.public@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <bc5becf6050804100426d8357a@mail.gmail.com>
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
To: hbeaumont hbeaumont <ahlist@gmail.com>
Cc: netfilter@lists.netfilter.org

On 8/4/05, hbeaumont hbeaumont <ahlist@gmail.com> wrote:
> I want to find a way to make sure that we have an extra layer of protecti=
on
> to make sure our servers weren't DOS'ing other boxes - even if it was
> only for a short time until an admin logged in to check the source of the
> outgoing traffic spike.

I'm a big fan of layers . =3D)

Even though there's only so much that netfilter can do as it generally
only looks at the lower half of the network stack, you can restrict a
lot.  For example, servers don't usually need originate much traffic
at all.  Trust and allow a few IPs for patch servers, time servers,
and DNS servers as opposed to allowing general outgoing traffic out to
ports 21,80,123,53,etc.

Log (with flood limits) dropped outbound traffic.  /dev/rob0 makes a
good point that logging is often useless.  If you have log analysis
tools that are monitored, they can possibly detect everything from
misconfigured software to malicious and mischevious users.

Something else you can do is proxy whatever small subset of external
services your servers can reach.  This can help prevent someone from
tunneling random things over port 80, for example (popular since it's
seldomly filtered).

You might also set netfilter to allow certain programs or users to go
out of certain ports.  I.e. root can go out on port 123 to synchronize
the clock, but a user cannot.  Of course, the more you restrict users,
the more unhappy they get!

