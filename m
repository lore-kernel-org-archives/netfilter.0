From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: PPTP+NAT+MASQ anyone?
Date: 09 Dec 2002 15:42:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039444945.28074.43.camel@tux>
References: <200212091226.23888.roy@karlsbakk.net>
	<1039436746.25961.15.camel@tux>  <200212091512.10109.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212091512.10109.roy@karlsbakk.net>
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

On Mon, 2002-12-09 at 15:12, Roy Sigurd Karlsbakk wrote:

> > And patch-o-matic from cvs works with at least 2.4.19 (2.4.18 and .20
> > should work aswell)
> 
> then what's this?
> 
> In file included from 
> /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:64,
>                  from extensions/libipt_conntrack.c:12:
> /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:6:2: #error 
> Only in kernel.
> In file included from 
> /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:65,
>                  from extensions/libipt_conntrack.c:12:
> /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_rsh.h:16:2: #error 
> Only in kernel.
> make: *** [extensions/libipt_conntrack_sh.o] Error 1

You said "the only one I've managed to patch-o-matic" which means the
only one you've managed to patch. What you are saying now is that you
indeed did manage to patch your kernel. Please use more accurate wording
in reports like these.

And you are NOT using patch-o-matic from cvs, I know this because these
problems were fixed some time ago (and doublechecking the files I see
that they were indeed fixed). The error you are seeing is _impossible_
with patch-o-matic from cvs (the #error lines doesn't even exist)

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat
you with experience.

