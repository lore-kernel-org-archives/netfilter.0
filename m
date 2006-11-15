From: "former03 | Baltasar Cevc" <baltasar.cevc@former03.de>
Subject: Re: opening up an ipchain
Date: Wed, 15 Nov 2006 18:33:48 +0100
Message-ID: <03434c655e56283b951b71b3aeb8315a@former03.de>
References: <200611142055.kAEKt2IY017525@alexandrite.boisestate.edu>
	<5950b335a1ae99d1fb0593c324f4b67b@former03.de>
	<200611151434.kAFEYZvn019639@alexandrite.boisestate.edu>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200611151434.kAFEYZvn019639@alexandrite.boisestate.edu>
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
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Alex Feldman <alex@alexandrite.boisestate.edu>
Cc: netfilter@lists.netfilter.org

Hi Alex,

On 15.11.2006, at 15:34, Alex Feldman wrote:
> iptables --policy INPUT   DROP
> iptables --policy OUTPUT  ACCEPT
> iptables --policy FORWARD DROP
>
> So I begin by dropping everything, and then pick up a few things I=20
> want,
> like this mac address.  Could any rule I put in before the one that
> accepts the mac address interfere with this one?  If so, how?  And is
> this the kind of thing where it makes a difference if you use -A or =
-I?
> I'm all but certain there are no other iptables rules around - if I
> remove the file that has these in them, my computer appears to be open
> to the whole world.

That comes near to what it does. when a packet comes in (.to a builtin
chain), it will be matched against the first rule, then the second and
so on. This processing stops at the first rule where all the matches
apply; the packet will be sent to the target - either a user-created
rule (then processing will continue there), or to a builtin target (then
the packet will be ACCEPTed, DROPped, REJECTEd, etc.). Note: there are
some builtin targets that don't stop processing the packet, too - e.g.=20=

LOG.

In the case we go to a user-defined chain, the results of a match of one
rule will be the same if the target is builtin. If it's userdefined, we
go one rule 'deeper' (we chain the chains ;-)
If none of the rules in the user-defined chain match, the process goes
one chain back (e.g. our INPUT chain again) and is matched against the
next rule there.

When it gets to the end of INPUT (or any other builtin chain), the
policy gets it's work - the packet will be treated as specified there,
in your example dropped (input or forward - thus packets that come in
from network with the destination of the local host (INPUT) or with a
destination or some other host (FORWARD); the OUTPUT traffic (all=20
locally
generated traffic) will be accepted, meaning it can pass.


What this means for you:
- If you search an error, you can start at the beginning and manually
   go trough all the rules and see whether the packet would match.
- You can add some debugging (LOG targets), normally it's convenient
   to add it before every DROP and REJECT (if you have multiple LOGs,
   specify --log-prefix XYZ with some different strings in order to make
   the outputs distinguishable).

Hope that helps,
Baltasar



Baltasar Cevc

_____ former 03 gmbh
_____ infanteriestra=DFe 19 haus 6 eg
_____ D-80797 muenchen

_____ http://www.former03.de


