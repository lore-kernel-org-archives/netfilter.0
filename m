From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: ipt_string and Kernel 2.6 !!URGENT!!
Date: Wed, 12 Jan 2005 08:34:39 -0500 (EST)
Message-ID: <27087.142.169.215.10.1105536879.squirrel@142.169.215.10>
References: <20050112083023.42281.qmail@web26109.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050112083023.42281.qmail@web26109.mail.ukl.yahoo.com>
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
To: Roland Kaeser <roli8200@yahoo.de>
Cc: netfilter@lists.netfilter.org

On Wed, January 12, 2005 3:30 am, Roland Kaeser said:
> Hi all

Hi!

> [...]
> Some of the web sources speaks about a patch-o-matic-ng-20041229 but I
> could not see
> any download by that name. Can somebody give me REALLY working howto fo=
r
> enabling
> this function in a kernel 2.6.9?

Since 2.6, the networking stack broke ipt_string and there's no way by
now to reintroduce ipt_string with 2.6.

However, Harald and Pablo are working on a 'string search' infrastructure=
.
Which means every match needing it, including ipt_string, will do.

>
> This is for a very large firewall project.
Out of curiosity, why do you need this match ?

>
> Kind Regards
>
> Roland Kaeser
> Systems Administrator

HTH,

Samuel


