From: Mike Kimmick <mkimmick@district70.org>
Subject: load balancing and realm modules question
Date: Thu, 16 Feb 2006 11:39:56 -0700
Message-ID: <1140115197.16042.22.camel@localhost.localdomain>
Reply-To: mkimmick@district70.org
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

My specific question is how to use the realm module to accomplish the
same thing that could be done with the nexthop module (proposed here 
https://lists.netfilter.org/pipermail/netfilter-devel/2003-November/013216.html ).

Here's our setup and some info.

We're currently attempting to load balance our Internet traffic over
three low-cost dsl lines and one high-cost fiber connection.  We're
currently using multipath routing to accomplish this by setting multiple
default routes, equalized, and with same weights.  The problem is with
connections that last a while (i.e. downloading large files); they get
terminated after some time.  It's my understanding that what is actually
happening is that we're load-balancing packets rather than connections,
and after some amount of time, the connection is broken because some of
it's packets take on a different route.

Our current setup is a linux box acting as our firewall with one
external NIC, is connected to the dsl modems/routers and the fiber
connection through a switch...thus, all Internet traffic goes out one
interface on the firewall box.  Therefore, I cannot mark any packets
based on which interface it goes out, and thus I need to be able to mark
packets based on the nexthop, which in turn will allow me to keep all
packets of one connection using the same route (hopefully).

The nexthop patch noted above looks like the answer to our situation,
but I do not have support for this on my box, nor do I want to customize
our kernels.  Reading the posts regarding the nexthop module, it seems
that the realm module can do the same as the nexthop and more, but I am
quite unclear as to how to use the realm module.

And finally to my question.  How do I use the realm module to accomplish
matching and marking packets based on nexthop?  I can certainly setup a
realm in my /etc/iproute2/rt_realms file, but at this point it appears
that I must set specific routes that are part of this realm rather than
having multiple default routes via a specific gateways each part of a
different realm.  Here's the most I've found for realm
http://www.netfilter.org/projects/patch-o-matic/pom-submitted.html#pom-submitted-realm

Can anyone enlighten me as to how to use the realm module for this task,
or at least where I might find more in-depth docs or examples for using
the realm module?


Thanks,

-- 
Michael Kimmick
Software Administrator
Pueblo School District No. 70
Pueblo, CO 81006
(719)295-6531


