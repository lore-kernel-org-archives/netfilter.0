From: "Adam J. Richter" <adam@yggdrasil.com>
Subject: Re: Capitalization conflicts in netfilter code apparently break
	tortise subversion
Date: Tue, 14 Aug 2007 16:41:47 -0700
Message-ID: <20070814234147.GA6973@freya.hsd1.ca.comcast.net>
References: <20070814173337.GA9922@freya.hsd1.ca.comcast.net>
	<46C1FD8A.4050804@rchq.co.za>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <46C1FD8A.4050804@rchq.co.za>
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
Content-Transfer-Encoding: 7bit
To: Ray Leach <spoons@rchq.co.za>
Cc: netfilter@lists.netfilter.org

On Tue, Aug 14, 2007 at 09:07:54PM +0200, Ray Leach wrote:
> Adam J. Richter wrote:
[...]
> >	netfilter appears to be the only part of the linux kernel that
> >contains file names that differ only by capitalization. [...]
> >
> >	File names that collide when compared case insensitively
> >result in errors in the use of TortoiseSVN on Windows clients using a
> >subversion source tree that has a copy of the linux kernel checked in.
[...]
> 
> Thanks Adam
> 
> This appears to be an OS specific and not a subversion issue. The 
> subversion server allows you to check in duplicate filenames with 
> different case. The problem comes in when you try and check the code out 
> again on an OS which is case insensitive (ala Windows). See this link on 
> the Tigris website for more info :
> http://subversion.tigris.org/servlets/ReadMsg?listName=dev&msgNo=38144
> 
> Bottom line is, if the code was checked into the repository 
> successfully, then it would have been done from a client on an OS that 
> supports case sensitivity and probably was expected to be checked out on 
> a compatible OS.

	Thanks for the link to that discussion.

	The sitation arose with an automated merge someone was
attempting from Windows on a large source tree that included a linux
kernel source subtree.  If I understand correctly, it appears that
TortoiseSVN from Windows cannot currently safely do merges of Linux
source trees, due to the naming capitalization collisions in
netfilter.  It also may effect the ability of someone working on
Windows to quickly check the effected parts of the linux kernel source
tree from this version control system or, even without a version
control system, just unpacking a linux source tar file.

	For the purposes of the netfilter list, I just wanted to bring
the downsides of these caplitalization collisions to everyone's
attention in the hopes that they might be eliminated in the course of
future development, especially if some other occasion for renaming
things arises, as has occurred with the transition to "ip tools", and
the ipchains to iptables transition.

Adam Richter


P.S. Going a bit off topic for the netfilter list, TortoiseSVN is
designed to access a unix-supporting version control system
(subversion) from Windows.  I understand that the capitalization
collision problem is not limited to TortoiseSVN, but, fall back to
some name when such problems occur would be pretty central to
TortoiseSVN's purpose (as opposed to accomodating VMS naming support
as was mentioned in the thread you identified), regardless of whether
the netfilter capitalization collisions get fixed.

