From: Aaron Clausen <maureen-taocow@alberni.net>
Subject: (no subject)
Date: Mon, 9 Dec 2002 09:02:08 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0212090859290.8234-100000@ts1.alberni.net>
References: <wazza.874r9nzdtt.fsf@message.id>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <wazza.874r9nzdtt.fsf@message.id>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: laurent.ml@linuxfr.org
Cc: netfilter@lists.netfilter.org

On Mon, 9 Dec 2002 laurent.ml@linuxfr.org wrote:

>
> Hi,
>
> I'm trying to use netfilter/patch-o-matic on 2.5 kernel tree.
> I can't get patches to be applied.
> I've tried with the cvs patch-o-matic runme and the patch-o-matic_2.5 one.
> That's the kind of error I get:
>
> Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] Y
> Testing patch base/REJECT.patch.ipv6...
> Warning - no help text file could be found in either
> /usr/src/linux-2.5/../c62c99fc67edd58b0e489365f0396b196d35894ae90feca146dd16320f5b08b4/net/ipv6/netfilter/Config.help
> or /usr/src/linux-2.5/../c62c99fc67edd58b0e489365f0396b196d35894ae90feca146dd16320f5b08b4/Documentation/Configure.help
> fgrep: /usr/src/linux-2.5/../c62c99fc67edd58b0e489365f0396b196d35894ae90feca146dd16320f5b08b4/net/ipv6/netfilter/Config.in: No such file or directory
> Could not find place to slot in Config.in line
> TEST FAILED: patch NOT applied.
>
> I've tried a runme patch from netfilter-devel mailing list, but it does not solve the problem.
> Could you give me some advice or tell me where to find a working 2.5 runme ?

I'll give you my experience.  I tried patching both 2.4.5 and 2.4.9, and was
able to put in only a few iptables features, and none that I wanted.  At
the end of the day, I finally through in the towel, downloaded the vanilla
2.4.19 kernel, and managed to get all the patches I wanted to work.  I would
still like to hear if anybody out there has successfully patched some of the
later kernels.

-- 
Aaron Clausen



