From: John Miller <johnmill@brandeis.edu>
Subject: Re: Tree view for rules/chains?
Date: Wed, 5 Aug 2015 16:22:36 -0400
Message-ID: <CAGYMsbtD7fKUh+W9kK-vQyqqgz2j2cfNK8-nK_oKASvvDreajw@mail.gmail.com>
References: <CAGYMsbtfZWaFfE7XzKOhJCoSexZ50KBMmzngwhi4i3h_fUNYFA@mail.gmail.com>
	<20150805193040.GA14052@Mail.Linux-Consulting.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20150805193040.GA14052@Mail.Linux-Consulting.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alvin <alvin.sm@mail.linux-consulting.com>
Cc: netfilter@vger.kernel.org

On Wed, Aug 5, 2015 at 3:30 PM, alvin
<alvin.sm@mail.linux-consulting.com> wrote:
>
> hi ya john
>
> On Wed, Aug 05, 2015 at 12:50:43PM -0400, John Miller wrote:
>> Hi folks,
>>
>> We keep pretty simple firewall rulesets for the most part.  That said,
>> it'd be nice to be able to display chains and rules in a tree-based
>> format: it'd help to visualize more complex rulesets.  Do you all know
>> of any existing tools that'll let me display things in a tree
>> structure--sort of the iptables equivalent of the 'tree' command for
>> files and directories?
>
> how and what would you want to change for the output of "iptables -nvL"
>

Hi Alvin,

What I'd really like is something like (let's see how well this displays):

--filter table--

                  INPUT (policy reject)
PREROUTING, OUTPUT, FORWARD, user-defined top-level chains, etc.
                         |
     ---------------------------------------------
     |                   |                       |
   Rule1        INPUT_USERCHAIN1          INPUT_USERCHAIN2
   Rule2        |              |                 |
   Rule3      Rule1        SUBCHAIN1           Rule1
   Rule4      Rule2            |               Rule2
              Rule3          Rule1             Rule3
              Rule4          Rule2             Rule4
                             Rule3
                             Rule4

--nat table, mangle table, etc.--

This is definitely not something I expect to see from iptables -nvL,
but more as a shell script or separate standalone utility.  If I can
accomplish something like this with a simple pipe or two (like to
gnuplot, for example), that'd be fine, too.  I figured there might be
an existing tool for this, or a relatively simple shell script that
someone had run before.

John
