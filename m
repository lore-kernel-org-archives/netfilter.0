From: "Andrew Kraslavsky" <andykras@hotmail.com>
Subject: Where to get SIP conntrack and nat for pre-2.6.18 kernel?
Date: Wed, 22 Nov 2006 14:57:47 -0800
Message-ID: <BAY119-F8D5AF68C7D422EA54C475D6E30@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hello,

I see that the netfilter SVN includes a version of SIP conntrack and NAT fo=
r=20
2.6.11, 2.6.12 and 2.6.13 but nothing after that.  If my kernel version is =

higher (e.g. 2.6.15) should I use the 2.6.13 source from the netfilter SVN =

or is there some other repository I should use?

Also, assuming the 2.6.13 source is the best choice, are there patches to=20
that source that reside in some other standard location that I should revie=
w=20
to decide if any of them are necessary for me?

I found some mailing list discussion suggesting that SIP source will be=20
included in the kernel repository as of 2.6.18 but, even assuming that is=20
not just a rumor, it seems a bit risky to try to use 2.6.18 versions of the=
=20
SIP conntrack and NAT modules on an older kernel.

So, in summary, if my kernel is something like version 2.6.15, from where=20
should I obtain SIP conntrack and NAT module source?

Thanks,

- Andrew Kraslavsky

_________________________________________________________________
View Athlete=92s Collections with Live Search=20
http://sportmaps.live.com/index.html?source=3Dhmemailtaglinenov06&FORM=3DMG=
AC01


