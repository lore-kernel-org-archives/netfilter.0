From: Michael Rash <mbr@cipherdyne.com>
Subject: Re: [PATCH] snort hex strings and libipt_string.c
Date: Mon, 17 Feb 2003 20:46:58 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030217204658.A2850@orthanc.gambrl01.md.comcast.net>
References: <20030216234709.A13902@orthanc.gambrl01.md.comcast.net> <1045467495.18515.109.camel@tux.rsn.bth.se>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1045467495.18515.109.camel@tux.rsn.bth.se>; from gandalf@wlug.westbo.se on Mon, Feb 17, 2003 at 08:38:15AM +0100
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
Content-Transfer-Encoding: 7bit
To: Martin Josefsson <gandalf@wlug.westbo.se>
Cc: Michael Rash <mbr@cipherdyne.com>, Netfilter <netfilter@lists.netfilter.org>

On Feb 17, 2003, Martin Josefsson wrote:

> On Mon, 2003-02-17 at 05:47, Michael Rash wrote:
> > The attached patch adds an option "--hex-string" to the string match
> > module to allow snort-style hex strings to be specified on the
> > command line.  This is useful because there are many signatures that
> > consist of non-printable characters and without this patch there is
> > no way to easily tell iptables to search for them.
> 
> Please send patches to the netfilter-devel@lists.netfilter.org list, not
> too many developers read this list on a regular basis and might miss
> patches.

Got it.  Will do.

> I've been working a little with a patch from Gianni Tedesco to speed
> things up (it really speeds up the stringmatch) and adding support for
> ranges to it (which bytes to search in the packet). I'll add your patch
> to the mix when I get some time to play with this stuff again (might be
> a while).

Ok, cool.

--Mike

Michael Rash
http://www.cipherdyne.com
Key fingerprint = 4EE3 816C 413A 41AA 72C8  4463 70C3 783C 1B91 F85E

