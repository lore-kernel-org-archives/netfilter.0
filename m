From: Vincent Lim <vincent.lim@nestac.com>
Subject: Re: patching iptables - how?
Date: Thu, 09 Jan 2003 10:11:44 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E1CDA60.D0512E54@nestac.com>
References: <20030108221616.1503.qmail@web12706.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Mladen Meduric <mladen_meduric@yahoo.com>
Cc: netfilter@lists.netfilter.org

Mladen Meduric wrote:
> 
> Hi all,
> 
> just joined the list.
> Pretty new to linux/iptables (on SuSE8.0). I'm trying to patch from 1.2.5
> to 1.2.6a and then to 1.2.7a.

Why not just use 1.2.7a instead?
Anyway, the patch command should be like this:
# cd /path/to/iptables/source
# patch -p1 < /path/to/patch

Do this for all remaining patches.

> Do have all patches. Tried "patch" command, but I seem can't figure it out
> properly. Would someone explain how to do this in couple of steps, please?
> Also, from reading other articles, after patching up or reinstalling
> iptables from scratch, is it necessary to recompile the kernel?

In most cases (AFAIK), no. If you're using the same kernel during the
compilation (of iptables), iptables will reference whatever libraries
that exist for the current kernel. If you decide to switch kernels, you
probably might need to recompile iptables as certain libraries might
have underwent a significant tweak/hack/modification and might render
iptables in-operable.

-- 
Vincent Lim
Software Engineer
NESTAC Solution Sdn Bhd
vincent.lim@nestac.com | +(6012) 659-6609

