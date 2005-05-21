From: =?utf-8?b?0J/RkdGC0YAg0JLQvtC70LrQvtCy?=
	=?utf-8?b?INCQ0LvQtdC60YHQsNC90LTRgNC+0LLQuNGH?= <pvolkov@mics.msu.su>
Subject: Re: SSH Brute force attacks
Date: Sat, 21 May 2005 12:00:28 +0400
Message-ID: <200505211200.28314.pvolkov@mics.msu.su>
References: <427B93EE.3030905@eccotours.dyndns.org>
	<42898402.10507@eccotours.dyndns.org> <4289E72F.7020901@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4289E72F.7020901@wp.pl>
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
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

Hello Taylor and =C5=81ukasz.

Can anybody explain me you are using such combination of rules.

17 =D0=9C=D0=B0=D0=B9 2005 16:44 =C5=81ukasz Hejnak wrote:
> No problem, here's my variation, based on Taylor Grant's ruleset
> $ipt -A SSH_Brute_Force -m recent --set --name SSH
> $ipt -A SSH_Brute_Force -m recent ! --rcheck --name SSH --seconds 60
> --hitcount 3 -j RETURN=20

Why this update here (see below)?

> $ipt -A SSH_Brute_Force -m recent --name SSH --update
> $ipt -A SSH_Brute_Force -j DROP
=09
Every time packet passed --set rule it updates SSH. So if drop this rule,=20
nothing changes. Or am I wrong? Is there any idea behind this that I missed.

Thank you for you attention,
=2D-=20
Peter.

