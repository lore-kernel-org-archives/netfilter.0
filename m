From: Tim Evans <tkevans@tkevans.com>
Subject: RE: IPTables for Sun Solaris
Date: Thu, 11 Aug 2005 17:56:57 -0400 (EDT)
Message-ID: <200508112156.j7BLuvcV028025@osprey.tkevans.com>
Reply-To: Tim Evans <tkevans@tkevans.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-MD5: h0vgu47SPbtTx3iR66h5Pg==
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tkevans@tkevans.com, dufresne@sysinfo.com, codeslinger@gmail.com, Ruiyuan_Jiang@liz.com
Cc: netfilter@lists.netfilter.org


>So Tim, does ipfilter satisfy all the Snort_inline requirement? I mean
>can I install it on Solaris 10? Thanks.

If you did a full Solaris 10 install, you already have it.  If not, it's on the 
Solaris CD's

$ uname -a
SunOS osprey 5.10 Generic_118822-08 sun4u sparc SUNW,Sun-Blade-1500

$ uname -a
SunOS osprey 5.10 Generic_118822-08 sun4u sparc SUNW,Sun-Blade-1500

$ pkginfo | grep "IP Filter"
system      SUNWipfr                         IP Filter utilities, (Root)
system      SUNWipfu                         IP Filter utilities, (Usr)
--
Tim Evans, TKEvans.com, Inc.	|    5 Chestnut Court
tkevans@tkevans.com		|    Owings Mills, MD 21117
http://www.tkevans.com/		|    443-394-3864
http://www.come-here.com/News/	|    


