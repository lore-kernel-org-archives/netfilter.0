From: Eric Leblond <eric@inl.fr>
Subject: Re: resetting/clearing of conntrack table?
Date: Tue, 18 Oct 2005 22:01:32 +0200
Message-ID: <1129665693.5889.7.camel@localhost.localdomain>
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
To: edvin.seferovic@kolp.at
Cc: netfilter@lists.netfilter.org

> Maybe Ive missed a discussion about how to reset conntrack, but Ive googled
> a little bit, and haven't found anything that would allow me to reset
> conntrack. 

It will possible with 2.6.14. A major rewrite netfilter
kernel<->userspace interaction has been done and it will now be possible
to modif or flush conntrack from userpace.

The conntrack tool is the userspace program that do the stuff, but a
library is available if you need it. Both are available from netfilter
svn :
	https://svn.netfilter.org/netfilter/trunk/
(its libnfnetlink, libnfnetlink_conntrack, conntrack)

An official release is available as well :

http://netfilter.org/downloads.html#conntrack

BR,

> 
>  
> 
> Is this possible anyhow? If yes - what is the best solution or way to do it?
> 
> 
>  
> 
> Thank you in advance !
> 
>  
> 
> Regards,
> 
>  
> 
> Edvin Seferovic
> 
>  
> 
> 
> 
> 
> 


