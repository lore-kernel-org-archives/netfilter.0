From: "Joe Clark" <joeclark@iastate.edu>
Subject: Re: Problems Compiling userspace NF_QUEUE handler
Date: Sun, 12 Sep 2004 23:00:34 -0500 (CDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <3402312810402551@webmail.iastate.edu>
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JC <solemnphoenix@yahoo.co.uk>, Joe Clark <joeclark@iastate.edu>, netfilter@lists.netfilter.org

Well, this will be like the blind leading the blind here, but... this site was
helpful to me: http://www.linuxjournal.com/article.php?sid=7184 (although it
didn't address the NF_QUEUE issues that I needed to know about).  My end goal
here, by the way, is to introduce artificial delay in all outgoing packets to
simulate a slow link, so I don't need to do any mangling of anything, so I
didn't look into that very much.

I have noticed too that the documentation for netfilter seems to
be...um...scattered a little, and not exactly complete.  Maybe I'm just looking
in the wrong places.  But a good page with a simple description of what the
absolute basic necessities are would be nice (kernel_module.c & userspace.c
files, for example, including dependencies on, say, libipq).
- Joe

> Hi,
>  
> I couldnt help replying to this message, although it is not really to offer any
help but to ask for help myself...
>  
> I am currently trying to implement a kernel module that does some packet
mangling and all I can say is that I'm really lost in some issues.
>  
> Could you please point out some references? 
> Maybe there are some code snippets/examples of how to read things off the packet
header (like source/destination port)?
>  
> thanx for any help in advance
>  
> regards,
> JC
>  
> 
> 
> Destroying all hope... one line of code at a time.
> 		
> ---------------------------------
>  ALL-NEW Yahoo! Messenger - all new features - even more fun!  






