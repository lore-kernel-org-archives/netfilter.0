From: "Shazad Malik" <smalik@vistawiz.com>
Subject: H323..... and getting close! anyone tell me whats going wrong!
Date: Tue, 4 Jun 2002 19:55:53 -0400 (EDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <3051.24.168.132.35.1023234953.squirrel@mail.vistawiz.com>
Reply-To: smalik@vistawiz.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hello -

I have the following settings:
iptables 1.2.6a
linux kerbel 2.4.18
pwlib (latest)
and openh323 (latest)

This is the error messages I'm getting, which I have seen from other sites
but not sure how to tackle the problem:

=======================================================================
Testing... 0-newnat13.patch NOT APPLIED (98 rejects out of 100 hunks)
The newnat/0-newnat13 patch:
   Author: Harald Welte <laforge@gnumonks.org>,
   Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
   Status: Pending for kernel inclusion

   Implementation of the new nat API for kernel 2.4.18 and above.

   - enables us to have multiple related expectations
   (necessarry for H.323, real IRC and PPTP tracking, ...)
   - allows expectations to have timeouts
   - adds full SACK support to the NAT code (we no longer strip
   SACKPERM option out of all SYN patckes for ftp/irc connections)

-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] y
Testing patch newnat/0-newnat13.patch...
Failed to patch copy of /usr/src/linux
TEST FAILED: patch NOT applied.

Aonther ERRROR:

 1731         Audio call control (TCP)
   Dynamic              H.245 call control (TCP)
   Dynamic              RTCP/RTP streaming (UDP)

   The H.323 conntrack/NAT modules support the connection tracking/NATing of
   the data streams requested on the dynamic ports. The helpers use the
   search/replace hack from the ip_masq_h323.c module for the 2.2 kernel
   series.

   At the very minimum, H.323/netmeeting (video/audio) is functional by
letting
   trough the 1720 port and loading these H.323 module(s).

   The H.323 conntrack/NAT modules do not support

   - H.245 tunnelling
   - H.225 RAS (gatekeepers)
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] y
Testing patch newnat/h323-conntrack-nat.patch...
   Placed new Config.in line
   Placed new Config.in line
   Placed new Configure.help entry
   Placed new Makefile line
Could not find place to slot in ip_conntrack.h entry
Could not find place to slot in ip_conntrack.h entry
Could not find place to slot in ip_conntrack.h entry

===================================================================

This is what I have done:
1) I have grabbed the latest newnat from the CVS directory which is
newnat13 from the samba.netfiler web site.

2) With iptables under patch-o-matic/newnat, there is newnat8, h323, and
talk files residing.  I bundled the h323, talk, and the latest newnat13 as
tgz files in the patch-o-matric box.

3) I grabbed the convert and convert-patch-o-matic
http://www.kfki.hu/~kadlec/sw/netfilter/newnat-suite webs site.  I modified
the convert script to see all the new tgz file thats I created which  are:
h323.tgz talk.tgz and newnat13.tgz

4) Then I run ./runme; ./runme suite and then I jump onto ./runme newnat
and thats when I get the error.

Is this the right? or something major missing......?? Help would be
appreciated!

-- 
Shazad Malik
work: (845)623-2161
fax: (845) 623-1154



