From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: redirect a HTTP-connection only once
Date: Sat, 16 Nov 2002 12:11:31 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211161211.31119.netfilter@newkirk.us>
References: <200211152128.58239.sysadmin@hnoe1.sth.ac.at>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200211152128.58239.sysadmin@hnoe1.sth.ac.at>
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
To: Karl Gruber <sysadmin@hnoe1.sth.ac.at>, netfilter@lists.netfilter.org

On Friday 15 November 2002 03:28 pm, Karl Gruber wrote:
> Hi!
>
> I want to know if it is possible that an iptables-rule matches only onc=
e. I
> want to implement a redirection of the first http-request of an user.
>
> thanx,
>      Karl

disclaimer - I've never done this before...

Do you mean the first ever (IE only catch one, then never again) or the f=
irst=20
to a given destination, or what?=20

Matching TCP80 from a user with state NEW and TCP flag SYN without ACK or=
 RST=20
should catch the initial HTTP request in a given transaction, and repeat=20
every time a new request is initiated.  I believe a LIMIT match (1/day) w=
ith=20
no burst watching for these would catch only the first HTTP transaction=20
requested by a user each day. (or until the firewall is reset, whichever =
is=20
sooner) =20

But the packet itself will probably be effectively lost if you redirect o=
nly=20
the first, leaving the client to re-request.  If you divert a single pack=
et=20
then reinsert it somehow, I think netfilter will not properly handle=20
forwarding of subsequent packets that are part of the transaction.

Something like:

/sbin/iptables -A FORWARD -s w.x.y.z -p tcp --dport 80 --state NEW --tcp-=
flags=20
SYN,RST,ACK SYN -m limit --limit 1/day --limit-burst 1 -j {whatever targe=
t}

Should match ONLY the first request from w.x.y.z for an HTTP connection p=
er=20
day.  Would that suit your use?

j

