From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: 2.5 kernel and patch-o-matic
Date: 09 Dec 2002 12:50:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039434621.25961.12.camel@tux>
References: <wazza.874r9nzdtt.fsf@message.id>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: laurent.ml@linuxfr.org
Cc: Netfilter <netfilter@lists.netfilter.org>

On Mon, 2002-12-09 at 11:28, laurent.ml@linuxfr.org wrote:
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

The thing is that 2.5 has changed the configuration/makefile system.
Nobody has updated patch-o-matic yet, so either wait until someone does
or investigate yourself and create a patch, and then of course mail it
to netfilter-devel :)

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat
you with experience.

