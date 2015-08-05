From: alvin <alvin.sm@Mail.Linux-Consulting.com>
Subject: Re: Tree view for rules/chains?
Date: Wed, 5 Aug 2015 13:52:35 -0700
Message-ID: <20150805205235.GA14241@Mail.Linux-Consulting.com>
References: <CAGYMsbtfZWaFfE7XzKOhJCoSexZ50KBMmzngwhi4i3h_fUNYFA@mail.gmail.com>
 <20150805193040.GA14052@Mail.Linux-Consulting.com>
 <CAGYMsbtD7fKUh+W9kK-vQyqqgz2j2cfNK8-nK_oKASvvDreajw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGYMsbtD7fKUh+W9kK-vQyqqgz2j2cfNK8-nK_oKASvvDreajw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Miller <johnmill@brandeis.edu>
Cc: netfilter@vger.kernel.org


hi ya john

On Wed, Aug 05, 2015 at 04:22:36PM -0400, John Miller wrote:
> On Wed, Aug 5, 2015 at 3:30 PM, alvin
> <alvin.sm@mail.linux-consulting.com> wrote:
...
> > how and what would you want to change for the output of "iptables -nvL"
> >
> 
> Hi Alvin,
> 
> What I'd really like is something like (let's see how well this displays):
> 
> --filter table--
> 
>                   INPUT (policy reject)
> PREROUTING, OUTPUT, FORWARD, user-defined top-level chains, etc.
>                          |
>      ---------------------------------------------
>      |                   |                       |
>    Rule1        INPUT_USERCHAIN1          INPUT_USERCHAIN2
>    Rule2        |              |                 |
>    Rule3      Rule1        SUBCHAIN1           Rule1
>    Rule4      Rule2            |               Rule2
>               Rule3          Rule1             Rule3
>               Rule4          Rule2             Rule4
>                              Rule3
>                              Rule4
> 
> --nat table, mangle table, etc.--

doesn't look/sound like a "simple firewall" anymore :-)

reformatting the rules seems to be a job for perl or c :-)
i have "no immediate solution"

pixie dust
alvin
# IPtables-BlackList.net

> This is definitely not something I expect to see from iptables -nvL,
> but more as a shell script or separate standalone utility.  If I can
> accomplish something like this with a simple pipe or two (like to
> gnuplot, for example), that'd be fine, too.  I figured there might be
> an existing tool for this, or a relatively simple shell script that
> someone had run before.
> 
> John
