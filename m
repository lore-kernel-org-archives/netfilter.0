From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: [PATCH] snort hex strings and libipt_string.c
Date: 17 Feb 2003 08:38:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045467495.18515.109.camel@tux.rsn.bth.se>
References: <20030216234709.A13902@orthanc.gambrl01.md.comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030216234709.A13902@orthanc.gambrl01.md.comcast.net>
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
To: Michael Rash <mbr@cipherdyne.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Mon, 2003-02-17 at 05:47, Michael Rash wrote:
> The attached patch adds an option "--hex-string" to the string match
> module to allow snort-style hex strings to be specified on the
> command line.  This is useful because there are many signatures that
> consist of non-printable characters and without this patch there is
> no way to easily tell iptables to search for them.

Please send patches to the netfilter-devel@lists.netfilter.org list, not
too many developers read this list on a regular basis and might miss
patches.

I've been working a little with a patch from Gianni Tedesco to speed
things up (it really speeds up the stringmatch) and adding support for
ranges to it (which bytes to search in the packet). I'll add your patch
to the mix when I get some time to play with this stuff again (might be
a while).

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat you with experience.

