From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: more questions about kernel config options for iptables
Date: Tue, 8 Apr 2003 11:11:23 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0304081107590.11474-100000@dell>
References: <200304081109.42705.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304081109.42705.netfilter@newkirk.us>
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
To: Joel Newkirk <netfilter@newkirk.us>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

On Tue, 8 Apr 2003, Joel Newkirk wrote:

> OT - are there any plans to bring video card options together, instead of 
> the current scheme where they are scattered through Character Devices, 
> Multimedia Devices, and Console Drivers?

<sigh>.  i was looking at that and, as i mentioned, took a crack
at reorg'ing the filesystems menu in the most recent 2.5.6x
kernels.

sadly, that was pretty easy since the Kconfig files and associated
source files were in the same directory.  so cleaning up a *single*
menu or submenu is not hard.

but it's clear that there is stuff scattered all over the menu
structure that should be related.  the difficulty there is that
different people are responsible for different subsystems,
and look after their own directory structure.  so that makes it
*way* more difficult to bring together options in distant
menus.

i'm trying to do this a little at a time; hence the attempt
to deal with the netfilter stuff as a start.  one level higher
up, it's clear that the entire networking options menu could
stand some cleaning.

rday


