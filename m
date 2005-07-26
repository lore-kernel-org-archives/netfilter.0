From: "curby ." <curby.public@gmail.com>
Subject: Re: rc.local
Date: Tue, 26 Jul 2005 09:38:15 -0600
Message-ID: <5d2f379105072608385caaee15@mail.gmail.com>
References: <42e607e9.6446401e.6174.46a7SMTPIN_ADDED@mx.gmail.com>
	<9927912d0507260430275d8239@mail.gmail.com>
Reply-To: "curby ." <curby.public@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9927912d0507260430275d8239@mail.gmail.com>
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
To: Visham Ramsurrun <vishamr2000@gmail.com>
Cc: netfilter@lists.netfilter.org

On 7/26/05, Visham Ramsurrun <vishamr2000@gmail.com> wrote:
> Here is my rc.local file:
[snip]

I think this is a shell scripting problem, not an iptables problem.=20
You seem to be forwarding pings to different interfaces per script
invocation (usually during boot time)?  What are you trying to
accomplish?  If you state your goal, the list might be able to come up
with a solution using iptables.

Other things:

Usually if you accept pings in one direction (say -i eth0 -o eth1) you
want pongs to go in the other direction (-i eth1 -o eth0).

I'm not exactly sure why you are forwarding from an interface to
itself, though I don't have much experience with this kind of thing.

