From: Phil Howard <phil-netfilter@ipal.net>
Subject: generic proxying, and source/port routing
Date: Thu, 3 Oct 2002 11:56:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021003115644.A11590@hamal.ipal.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Here are a couple of things I am trying to do for which many people keep
pointing me to netfilter/iptables, but so far no one can say how it is
done, or even prove it can be done.  I can't figure it out based on what
I have read and at this point have doubts, but still hoping.

1.

I want to do generic proxying via a user space process.  By this I mean
not HTTP proxying as all the documentation I currently find describes.

The generic proxying process would be listening for TCP connections on a
specific port in the usual manner a server would do.  But when these
proxied connections are made, which would be routed to or through the
machine running this program, the end point will be completed here and
that process gets the new connection, just as if the destination IP
address were local.  And that means that getsockname() needs to show
the original destination IP address.

To do the generic proxying, the process involved does need to know the
original destination IP address.  Since it will not be doing HTTP it
does not have the benefit of a "Host:" header in the request.  This is
not Squid.  It only seems reasonable to use getsockname() to find out
the destination IP address, but since this is a custom program, it is
also possible to code in some other means.

The problem I see is that the existing methods that might do this in
netfilter use address modifications to achieve their end.  But it does
seem that an appropriately designed, and probably simple, target in
netfilter, should be able to do this by treating the packet as local
without changing its destination address.  The problem is, making sure
it is treated local by the stack and socket layer API even though the
destination address is not one of the local interfaces.

It also needs to be possible to make sure that connections originating
on this machine are not intercepted this way.  The proxying process I
need to do will be making its own connection to the originally intended
destination.

2.

I want to do some very much like source routing, but I call it port
routing.  That is, I want to make routing decisions on the basis of what
the port number is.  Source routing would be nice to have, too.  Since
certain netfilter tests are done right after the routing decision, what
about the possibility of rewriting that decision, or otherwise override
it to force a route specifically established by the rule?

-- 
-----------------------------------------------------------------
| Phil Howard - KA9WGN |   Dallas   | http://linuxhomepage.com/ |
| phil-nospam@ipal.net | Texas, USA | http://ka9wgn.ham.org/    |
-----------------------------------------------------------------

