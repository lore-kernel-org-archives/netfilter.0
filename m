From: Arnt Karlsen <arnt@c2i.net>
Subject: OT: video cards, was: more questions about kernel config options
 for iptables
Date: Tue, 8 Apr 2003 20:27:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030408202700.1686bfde.arnt@c2i.net>
References: <200304081109.42705.netfilter@newkirk.us>
	<Pine.LNX.4.44.0304081107590.11474-100000@dell>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0304081107590.11474-100000@dell>
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
To: netfilter@lists.netfilter.org

On Tue, 8 Apr 2003 11:11:23 -0400 (EDT), 
"Robert P. J. Day" <rpjday@mindspring.com> wrote in message 
<Pine.LNX.4.44.0304081107590.11474-100000@dell>:

> On Tue, 8 Apr 2003, Joel Newkirk wrote:
> 
> > OT - are there any plans to bring video card options together,
> > instead of the current scheme where they are scattered through
> > Character Devices, Multimedia Devices, and Console Drivers?
> 
> <sigh>.  i was looking at that and, as i mentioned, took a crack
> at reorg'ing the filesystems menu in the most recent 2.5.6x
> kernels.
> 
> sadly, that was pretty easy since the Kconfig files and associated
> source files were in the same directory.  so cleaning up a *single*
> menu or submenu is not hard.
> 
> but it's clear that there is stuff scattered all over the menu
> structure that should be related.  the difficulty there is that
> different people are responsible for different subsystems,
> and look after their own directory structure.  so that makes it
> *way* more difficult to bring together options in distant
> menus.
> 
> i'm trying to do this a little at a time; hence the attempt
> to deal with the netfilter stuff as a start.  one level higher
> up, it's clear that the entire networking options menu could
> stand some cleaning.
> 

..ok, I the video newbie volonteer as guineapig with: 
Bus  1, device   0, function  0:
    VGA compatible controller: ATI Technologies Inc 3D Rage IIC AGP 
(rev 122).      
      IRQ 11.
      Master Capable.  Latency=64.  Min Gnt=8.
      Prefetchable 32 bit memory at 0xea000000 [0xeaffffff].
      I/O at 0xd000 [0xd0ff].
      Non-prefetchable 32 bit memory at 0xe9000000 [0xe9000fff].

...and:
Bus  0, device  15, function  0:
    VGA compatible controller: ATI Technologies Inc 3D Rage II+ 
215GTB  [Mach64 GTB] (rev 154).      
      Master Capable.  Latency=32.  Min Gnt=8.
      Non-prefetchable 32 bit memory at 0xe0000000 [0xe0ffffff].
      I/O at 0x6600 [0x66ff].
      Non-prefetchable 32 bit memory at 0xe1000000 [0xe1000fff].


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


