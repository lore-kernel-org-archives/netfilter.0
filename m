From: "Ian Latter" <Ian.Latter@mq.edu.au>
Subject: Re:rsh.patch
Date: Sat, 21 Dec 2002 19:33:33 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212210933.gBL9XYR06383@singularity.tronunltd.com>
Reply-To: "Ian Latter" <Ian.Latter@mq.edu.au>
Content-Type: text/plain; charset="us-ascii"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
To: Michael Musikhin <moderatto@cetus.farlep.net>
Cc: netfilter@lists.netfilter.org

Hello Michael,

  I am carboning the mailling list so that the response/solution is
publically archived.

  I managed to access to my development server, and have 
tested Kernel 2.4.19 with patch-o-matic-20020825.

  In my first patch attempt I failed with the same error you got.  But
what seemed to be missing was the newnat framework that they
asked me  to write the module for (I believe its absent in a clean 2.4.19
kernel, but may be standard part of the 2.4.20 kernel - ymmv).  If you
enable the following modules in the patch-o-matic;
  - conntrack+nat-helper-unregister.patch
  - conntrack.patch
  - z-newnat16.patch

.. then you should get the rsh.patch to apply cleanly;

  Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] y
  Testing patch extra/rsh.patch...
     Placed new Config.in line
     Placed new Configure.help entry
     Placed new Makefile line
     Placed new ip_conntrack.h line
     Placed new ip_conntrack.h line
     Placed new ip_conntrack.h line
     Patch extra/rsh.patch applied cleanly.
  Applying patch extra/rsh.patch...
     Patch extra/rsh.patch applied cleanly.
     Placed new Config.in line
     Placed new Configure.help entry
     Placed new Makefile line
     Placed new ip_conntrack.h line
     Placed new ip_conntrack.h line
     Placed new ip_conntrack.h line

  [Press enter to continue]


  I haven't compiled the kernel from there, but you should be
on a winner.  Let me know if you have any further problems
with the rsh.patch.



----- Original Message -----
>From: "Michael Musikhin" <moderatto@cetus.farlep.net>
>To: "Ian Larry Latter" <Ian.Latter@mq.edu.au>
>Subject:  rsh.patch
>Date: Fri, 20 Dec 2002 22:10:24 +0200
>
> Hello,
> 
> 	Sorry for disturbance. Just can't find answer in the net.
> 	I'm trying to apply rsh.patch and it consistently fails. I have kernel 
> 2.4.19, iptables-1.2.7a with patch-o-matic-20020825 and conntrack.patch 
> already applied. When I try to apply rsh.patch I have:
> 
> Testing patch extra/rsh.patch...
>    Placed new Config.in line
>    Placed new Configure.help entry
>    Placed new Makefile line
> Could not find place to slot in ip_conntrack.h line
> Could not find place to slot in ip_conntrack.h line
> Could not find place to slot in ip_conntrack.h line
> 
> 	Somebody in netfilter mail list advised to get latest CVS patch-o-matic. 
> This couldn't help too.
> 
> Please, can you help with this issue?
> 
> Best regards,
> 
> --------------------------------------
> Michael Musikhin.
> Farlep ISP. Ukraine.
>  
> mailto: moderatto@cetus.farlep.net
> phone : 380-48-7350273, 380-48-7150059
> 

--
Ian Latter
Internet and Networking Security Officer
Macquarie University

