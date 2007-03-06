From: "Daniel De Graaf" <danieldegraaf@gmail.com>
Subject: Re: iptables-retore very slow
Date: Tue, 6 Mar 2007 14:32:08 -0600
Message-ID: <427c54c0703061232v56d082dbn50f42c14a11af873@mail.gmail.com>
References: <45EC5CFF.5000209@rackage.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=TcFD271c0MLMd5VkvvwP6JhKHBYtp1xRfMCYt0wUQdcwrqCW/Zf3YFfTRoE67vYlo3dubg7oGmWFuKCTZ93SmmWDH2oTBU9TiEmieoZ41bFd3dTdon79C/D47Gma1A9wF7Fn2Jgh6cGdb+v1yBk8krkj7JSpstyT74qpzmRk8+k=
In-Reply-To: <45EC5CFF.5000209@rackage.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

iptables-restore has some flags that could be useful: --verbose,
--test (to prevent the actual sending back to the kernel), --noflush
(to prevent flushing already existing chains)

If that doesn't help at all, you could either use strace to find if it
is hanging on a syscall, or add #define DEBUG to the top of
iptables-restore.c and recompile to enable more debugging output.

Are there rules on tables other than filter? Those aren't flushed by
iptables -F and could possibly be slowing it down if there were many
of them.

Hope that helps,
Daniel De Graaf

On 3/5/07, Rackage | Randles <randles@rackage.com> wrote:
> Hi,
>
> I recently noticed that one of my firewalls was taking a very long time
> to reboot. Which was odd as its a very new  machine.
>
> On investigation is seemed to be the iptables-restore command that was
> adding 10+ minutes to the boot-up times.
>
> I ran iptables-restore from a terminal and found that it was indeed
> taking an amazingly long time.
>
> Obviously I assumed it was related to the rules on the server, so I
> flushed all rules and all user defined tables from the firewall (nat,
> mangle and filter) and used iptables-save which took less than 1
> millisecond :) on the empty rule set.
>
> However iptables-restore is still taking 10+ minutes even with no rules
> to read / apply.
>
> Has anyone seen the behaviour before?  or has anybody got some bright
> ideas on how I might continue debugging this issue?
>
> Thanks in Advance
>
> Regards
>
> Ben
>
>
>

