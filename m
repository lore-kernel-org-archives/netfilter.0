From: "Aaron Smith" <snafflefu@hotmail.com>
Subject: --mark match/subsetting question
Date: Wed, 28 Apr 2004 13:15:58 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Sea2-F42Vd7cl4TlL8R0002b70a@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org


I've got a whole bunch of redirect rules in the PREROUTING table, but for=20
some
connections (say from one IP for examlpe) I want none of these redirects to=
=20
take effect.
I need to toggle this effect on and off easily. Inserting/Removing one rule=
=20
is ideal, but
I can't insert and remove all rules.
(Connections that exist when its toggled are unimportant)

I first way I thought to do this is with every REDIRECT rule use a --source=
=20
! <ipfoo>,
but then I have to delete all rules and reinsert (without the --source) to =

toggle.

Then I figured I'd put a mark rule out front to mark connections I don't=20
want redirected, and
every redirect rule would have a --mark ! 0x01, but the not operator doesnt=
=20
seem to work with mark.
(Is there a default mark? - If so that would work).

It seems this is a fairly simple thing to do, and I'm positive I can do it =

given the current tools,
but I can't see how.
Any ideas?

Thanks!

_________________________________________________________________
MSN Toolbar provides one-click access to Hotmail from any Web page =96 FREE=
=20
download! http://toolbar.msn.com/go/onm00200413ave/direct/01/


