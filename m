From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: mangle, filter & FORWARD
Date: Tue, 1 Jun 2004 10:58:39 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E320@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: "Kevin D. White" <web_crawlz@yahoo.com>, netfilter@lists.netfilter.org


> As you can see, there is no reference to either the
> mangle table or filter table...

The filter table is always implied if not explicitly stated otherwise

>so where does the
> system append the rule?  An obvious answer might be
> that the system appends the rule in both FORWARD
> chains, (if there is two chains).

Nope (thankfully)
The MANGLE table's are not for filtering data. Mangle's are typically
used for inline parameter modifications like changing the TOS/MSS/etc...
The order on any given chain is raw/mangle/filter/nat. Not all tables
are run on each chain. Eg. FORWARD table only has mangle/filter.

For a really good refreence on iptables in general, check out
http://iptables-tutorial.frozentux.net/

> *nix is not user friendly and it is because everyone
> who works on it likes to complicate things first, then
> simplify (a flaw most people have, myself included).
> *nix will NEVER be user friendly because that is the
> way we like it, raw output, difficult challenges and
> total control over everything.  The community must
> make up for the unfriendly nature of the OS by being
> friendly to people who are moving from Windows and
> looking for help, like me.  Ignoring people is just
> going to make everyone give-up on *nix and stick with
> microsoft, which means your *nix knowledge will only
> ever be a hobby and you will have to have M$
> certification to get work; which would be sad because
> this is a far more powerful and useful OS.

Yeah, but you can't exepect everyone on a public list to support you
just because your talking. It's too bad that nobody got back to you, but
it does happen from time to time. You may want to rethink your
questions, check external references for more info, make the theme
explicitly clear and resubmit. The questions usually get answered
eventually.

Also note, the questions asked here vary based on their difficulty. You
have questions from newbs (which is fine) asking pretty elementary
questions and you have the pros that generally aim to ask/solve very
technically challenging questions that may/may not involve developing
their own programs/modules to solve the problem. I've been on this ML
for a while and I can say personally that I'd answer a rare higher
difficulty question over a question that's been answered half a dozen
times before (I'm not criticizing, its just what happens to most ppl
learning).

I hope that gives you some insight on the dynamics of mailing lists like
this.

