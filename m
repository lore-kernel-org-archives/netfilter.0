From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: "iptables: Invalid argument" with kernel 2.4.20
Date: Mon, 16 Dec 2002 14:35:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212161435.06101.netfilter@newkirk.us>
References: <Pine.LNX.4.44.0212161717490.11632-100000@flex.cs.kun.nl>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0212161717490.11632-100000@flex.cs.kun.nl>
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
To: cees-bart <ceesb@cs.kun.nl>, netfilter@lists.netfilter.org

On Monday 16 December 2002 11:25 am, cees-bart wrote:
> hi all,

> -A OUTPUT -d MYMACHINE -p udp -m udp --dport 27960 -j DNAT \
>                            --to-destination OTHERMACHINE:30000

> this setup works fine on kernel 2.4.19 with iptables 1.2.6a.
>
> BUT, the last rule (OUTPUT) fails with message "iptables: Invalid
> argument" when running under 2.4.20.
>
> i tried iptables 1.2.7a as well, but the result is the same.
>
> am i doing something wrong?

Have you tried manually creating the rule, or are you restoring from a=20
save made with the earlier version?  Since you list it in a save format,=20
(dated November 12) and said it won't load, this strikes me as likely. =20
I don't know, but it's possible this won't work.  Just try a:

/sbin/iptables -t nat -A OUTPUT -d MYMACHING -p udp --dport 27960 \
=09-j DNAT --to OTHERMACHINE:30000

and see if it accepts it.  If so, then there must have been some change=20
in the save file structure or handling (possibly fixing a flaw) that=20
prevents newer netfilter form restoring from the older save.

If you require the ability to use the same save under both versions, it's=
=20
possible that saving from the new will be restorable in the old, even if=20
the reverse turns out to be broken.

j

