From: Jason Opperisano <opie@817west.com>
Subject: Re: ULOGD and invalid timestamps
Date: Fri, 10 Sep 2004 09:53:07 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094824387.1900.84.camel@wolfpack.ljm.dom>
References: <00cd01c4968a$53c10b30$3c01a8c0@tftpd>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00cd01c4968a$53c10b30$3c01a8c0@tftpd>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 2004-09-09 at 12:30, Steve Melo wrote:
> Greetings list,
> 
> I'm using the ulogd to log information and everything works great except
> that everything that gets logged has a timestamp of "Dec 31 19:00:00".  I
> would like to have the correct timestamp.

from:
http://packages.debian.org/changelogs/pool/main/u/ulogd/ulogd_1.02-1/changelog

---------------------------------------------------------------
ulogd (1.02-1) unstable; urgency=low

  * New upstream release.
    - fixed timestamp printing in LOGEMU (closes: Bug#208506)
  * debian/patches/ulogd-version.patch:
    - this is really ulogd 1.02
---------------------------------------------------------------

The thread on bug 208506:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=208506

What I typed into google to find the above info:  ulogd timestamp

-j

-- 
Jason Opperisano <opie@817west.com>


