From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: Netfilter vs commercial
Date: Mon, 09 Aug 2004 12:02:52 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1092067371.18395.89.camel@localhost>
References: <20040809093022.5842e85e@mgalepc.utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040809093022.5842e85e@mgalepc.utilitran.com>
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
To: Michael Gale <michael.gale@utilitran.com>
Cc: netfilter@lists.netfilter.org

On Mon, 2004-08-09 at 11:30, Michael Gale wrote:
> Hello,
> 
> 	I know this question has most likely come up a few times and most people ask about performance and through put. But my
> question seems to me a little different.
> 
> I would like to know how people on this list ... which I know might be a biased opinion feel how a Netfilter firewall
> box .. properly configured would compare in security to a commercial firewall. 
> 
> I do not want to compare performance or stats on through put but the strength of the firewall. The reason I am asking is
> to at the moment we are using Netfilter based firewalls which I have setup Squid and Frox and many other application
> level filters.
> 
> Now some people in the company want to replace them with CheckPoints or WatchGuard firewalls. Which is fine ... security
> should be done in layers ... but the way I see it I will still need the linux boxes to run squid and frox unless the
> appliance allows you to install software from other sources (most likely not) or use custom config files (like my own
> squid.conf -- most likely not).

It's a difficult question to answer without access to the internals of
the proprietary products.  I would assume the basic stateful inspection
engine of netfilter is weaker than that of Checkpoint.  However, this
may very well be remedied when one adds the window tracking patch.

Other internals remain a bit of a mystery.  For example, if I remember
correctly, one can specify MSRPC as a protocol with Checkpoint and it
will properly handle the port shift.  One the other hand, one cannot do
this in netfilter.  One must open 135/tcp and then all high ports.  Yes,
I know that one should never do this on the Internet but what about
internal firewalling and VPN firewalls.  Now it could very well be that
is all Checkpoint does but they've simplified it in the user interface. 
I do know that we have had to do that with other commercially available
firewalls.

There are two other important issues of security that do not necessarily
relate to the actual internals.  One is how well the management
interface shields one from human error.  For example, this is one of the
chief advantages of the ISCS interface for netfilter
(http://iscs.sourceforge.net).  Not only does it reduce the time to
configure security by over 90% but it dramatically reduces the exposure
to human error.  Unfortunately, it has not yet been released.  On the
other hand, from what I recall, the WatchGuard and Checkpoint interfaces
are really just GUI rule configurators and do little to insulate the
administrator against human error (such as putting a rule in the wrong
order or making it conflict with another subsystem like NAT or VPN).  I
believe all of the other user interfaces for netfilter also fall into
this rule configurator category.

Finally, there is the degree of control.  This is where netfilter has a
distinct advantage.  The degree of flexibility that one has to configure
netfilter to do exactly what one wants it to do by command line or
script or even editing the source code is outstanding.  One can also
tinker with the related subsystems such as iproute2 or *swan to
coordinate various security and network activities to an extraordinary
level.  I do not recall such flexibility in other products.

I do hope this is the type of answer you were looking for - John
-- 
John A. Sullivan III
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevelopmentcorp.com


