From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: 'No Route: Rusty's brain broke' ??????
Date: Fri, 3 Sep 2004 15:10:21 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <62679.216.239.93.106.1094238621.squirrel@216.239.93.106>
References: <200409031401.i83E1R53004651@webmail2.magma.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409031401.i83E1R53004651@webmail2.magma.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: dravya <dravya@magma.ca>
Cc: netfilter@lists.netfilter.org

On Fri, September 3, 2004 10:01 am, dravya said:
>
> Hi all,
>
> I have two ppp connections setup and I want access the internet via the=
se
> links....
> However, I get the error message "kernel: No Route: Rusty's brain broke=
".
>
> Is there a patch associated with this.... or can you suggest any fixes.=
..
>

https://lists.netfilter.org/pipermail/netfilter-devel/2004-January/013695=
.html

> Why would something like this happen??? Is this a problem with the
> ipt_MASQUERADE.c code???
>

Kinda.

> any tips or suggestions are much appreciated.
>

Current ipt_MASQUERADE.c isn't supporting funky routing.

I got the same error when I was using the ROUTE target to
force some nodes to use ppp1 instead of ppp0.

Patrick's patch found in the URL below worked for me.

However, this is an active topic. You should follow that
thread:

https://lists.netfilter.org/pipermail/netfilter-devel/2004-August/016620.=
html

> Thanks
>

HTH

> Dravya


Samuel Jean
CookingLinux.org



