From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: error building iptables from cvs
Date: 09 Dec 2002 15:52:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039445557.28074.45.camel@tux>
References: <200212091539.45341.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212091539.45341.roy@karlsbakk.net>
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
To: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Cc: Netfilter mailinglist <netfilter@lists.netfilter.org>

On Mon, 2002-12-09 at 15:39, Roy Sigurd Karlsbakk wrote:
> [root@fw iptables2]# make
> Making all in .
> make[1]: Entering directory `/usr/src/netfilter/iptables2'
> make[1]: Nothing to be done for `all-am'.
> make[1]: Leaving directory `/usr/src/netfilter/iptables2'
> Making all in include
> make[1]: Entering directory `/usr/src/netfilter/iptables2/include'
> make[1]: Leaving directory `/usr/src/netfilter/iptables2/include'
> Making all in libnfnetlink
> make[1]: Entering directory `/usr/src/netfilter/iptables2/libnfnetlink'
> cd . && aclocal
> /bin/sh ./config.status --recheck
> ./config.status: ./config.status: No such file or directory
> make[1]: *** [config.status] Error 127
> make[1]: Leaving directory `/usr/src/netfilter/iptables2/libnfnetlink'
> make: *** [all-recursive] Error 1
> [root@fw iptables2]#

What makes you think iptables2 is actually going to compile?

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat
you with experience.

