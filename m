From: Jack Bowling <jbinpg@shaw.ca>
Subject: Re: Help with invalid argument
Date: Sat, 06 Jul 2002 12:57:54 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <0GYU000BWFGLMP@l-daemon>
References: <0GYU00921BGS9X@l-daemon>
 <EPEHIDPIPEBFNAHLCHPGIEMHCEAA.dennis@core-enterprises.com>
Reply-To: Jack Bowling <jbinpg@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <EPEHIDPIPEBFNAHLCHPGIEMHCEAA.dennis@core-enterprises.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: netfilter@lists.samba.org

** Reply to message from Dennis Cardinale <dennis@core-enterprises.com> on Sat, 06 Jul 2002 15:20:24 -0400


> Thanks for the help, Jack.  Everything is working fine now.
> 
> In regard to the last message, I'll rephrase the question:
> 
> If the netfilter userspace tools that now occupy /sbin are compiled from
> current netfilter CVS source tree, will they still execute properly when
> called from within the framework of the prior kernel (before pomming it)?
> 
> You do not need to answer the question.  As soon as I have time, I'll reboot
> the old kernel and try it myself.
<snip>

I'll answer anyway: some of the modules may work but if any of them have been recoded in any way, then you run the risk of the modules not working, or even worse, not working such that it may leave you vulnerable somehow if it really breaks. It is always wise to recompile the kernel with the same version of netfilter code as your userspace iptables modules.

jb

