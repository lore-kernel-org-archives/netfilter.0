From: "Rob M" <c4blem0nkey@gmail.com>
Subject: Possible Bug? /proc/net/ip_tables_targets listing problem?
Date: Sat, 8 Oct 2005 15:18:46 -0700
Message-ID: <434845cc.3c4ac938.1fcf.ffffeab3@mx.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Issue:  When you cat out `/proc/net/ip_tables_targets' the MARK target is
listed twice

 

uname -a

Linux nao 2.6.12-gentoo-r9 #1 Tue Aug 23 23:45:26 PDT 2005 i586 AMD-K6(tm)
3D processor AuthenticAMD GNU/Linux

 

I checked through bugzilla and didn't find anything listing this particular
issue.  Also dug through my machine to make sure for some weird reason I
didn't have 2 version of this module. (I don't know why I might have since
it's a newly installed box).  Has anyone else noticed this problem?  If this
something that others are seeing, I'll crank out a bug report on it, but if
not I'll smack my box around a little to see if I can make it talk.  Maybe
both. ;)

 

Cheers,

-- Rob

"I won't forget the things before, so what's going on and I can not let go"

 

