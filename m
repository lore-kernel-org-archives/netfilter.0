From: "Ruiyuan Jiang" <Ruiyuan_Jiang@liz.com>
Subject: RE: IPTables for Sun Solaris
Date: Thu, 11 Aug 2005 18:03:31 -0400
Message-ID: <5AD6E09C3CB0BE4E83BDABFBF560EA0002C2B9E5@usanbrmbx01.ds.liz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: Tim Evans <tkevans@tkevans.com>, dufresne@sysinfo.com, codeslinger@gmail.com
Cc: netfilter@lists.netfilter.org

Does IP Filter contains "libipq library that allows snort_inline to
interface with iptables. Also, you must build and install LibNet, which
is available from http://www.packetfactory.net."?=20

I don't think I installed IP Filter on Solari 10 but I can install it no
problem. Once I installed IP Filter, if I follow the rest instruction to
install snort_inline, will it work? Thanks, Tim.

Ryan=20

-----Original Message-----
From: Tim Evans [mailto:tkevans@tkevans.com]=20
Sent: Thursday, August 11, 2005 5:57 PM
To: tkevans@tkevans.com; dufresne@sysinfo.com; codeslinger@gmail.com;
Ruiyuan Jiang
Cc: netfilter@lists.netfilter.org
Subject: RE: IPTables for Sun Solaris


>So Tim, does ipfilter satisfy all the Snort_inline requirement? I mean=20
>can I install it on Solaris 10? Thanks.

If you did a full Solaris 10 install, you already have it.  If not, it's
on the Solaris CD's

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
http://www.come-here.com/News/	|   =20

