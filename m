From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: delay after [time patch] rule's expire
Date: Fri, 25 Jun 2004 18:57:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406251857.03349.Antony@Soft-Solutions.co.uk>
References: <20040625173249.26447.qmail@web14007.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040625173249.26447.qmail@web14007.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Friday 25 June 2004 6:32 pm, m.bar=FD=FE demiray wrote:

> Hi all!
> This is not a technical problem in fact, only my
> curiousty. I applied the time patch with patch-o-matic
> and test it with a rule like
>
> iptables -A INPUT -p icmp -m time --timestart 14:44
> --timestop 14:55 --days Fri -j DROP
>
> When the current time is passing the start time
> (packages will be matched and dropped soon) and the
> stop time (they'll be free to pass again) there is
> about 1 min. delay between these two process. For
> example, when it's 14:55, then the icmp packages
> shouldn't be matched anymore but they are dropped till
> it's about 14:56. Why?

I think the timestart will match as long as the hours=3D14 and the minute=
s=3D44=20
(ie at 14:44:00), and the timestop will match until after the hours=3D14 =
and=20
the minutes=3D55 (ie: just gone 14:55:59).

If you want exactly ten minutes of blocked packets, specify --timestart 1=
4:44=20
--timestop 14:54 (ie: ten minutes' difference between the two times)

Regards,

Antony.

--=20
Anything that improbable is effectively impossible.

 - Murray Gell-Mann, Nobel Prizewinner in Physics

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


