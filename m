From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: PPTP+NAT+MASQ anyone?
Date: 11 Dec 2002 17:41:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039624902.20562.91.camel@tux>
References: <200212091226.23888.roy@karlsbakk.net>
	<200212111635.37659.roy@karlsbakk.net> <1039621206.20499.86.camel@tux> 
	<200212111701.39376.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212111701.39376.roy@karlsbakk.net>
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

On Wed, 2002-12-11 at 17:01, Roy Sigurd Karlsbakk wrote:

> seems like newnat-udp-helper.patch 
> [root@fw linux]# patch -p1 < 
> ../netfilter/patch-o-matic/pending/newnat-udp-helper.patch
> patching file include/linux/netfilter_ipv4/ip_nat_helper.h
> Hunk #1 succeeded at 36 (offset -14 lines).
> patching file net/ipv4/netfilter/ip_nat_helper.c
> Hunk #1 FAILED at 8.
> Hunk #2 succeeded at 18 (offset -7 lines).
> Hunk #3 succeeded at 53 (offset -2 lines).
> Hunk #4 succeeded at 75 (offset -7 lines).
> Hunk #5 succeeded at 174 (offset -2 lines).
> Hunk #6 succeeded at 203 with fuzz 2 (offset -7 lines).
> 1 out of 6 hunks FAILED -- saving rejects to file 
> net/ipv4/netfilter/ip_nat_helper.c.rej
> patching file net/ipv4/netfilter/ip_nat_standalone.c
> Hunk #1 FAILED at 358.
> 1 out of 1 hunk FAILED -- saving rejects to file 
> net/ipv4/netfilter/ip_nat_standalone.c.rej

This patch applies fine here after applying the other submitted patches
first.
 
-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat
you with experience.

