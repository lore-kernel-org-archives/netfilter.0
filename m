From: Jason Opperisano <opie@817west.com>
Subject: Re: [OT] dhcrelay
Date: Tue, 15 Feb 2005 16:20:46 -0500
Message-ID: <20050215212046.GA20525@bender.817west.com>
References: <200502152158.27275.lars@lhanke.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200502152158.27275.lars@lhanke.de>
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
To: netfilter@lists.netfilter.org

On Tue, Feb 15, 2005 at 09:58:27PM +0100, Dr. Lars Hanke wrote:
> Hi,
> 
> google told me that dhcrelay has been discussed quite a couple of times on 
> this list. However,I could not find a solution to my problem.
> 
> I want to set up a router, which distributes the DHCP configuration service to 
> all subnets attached (well currently only one subnet at eth0, 172.16.2.1). 
> Reading the dhcrelay man page
> #> dhcrelay -i eth0 adept.mgr

from man 8 dhcrelay:

       The -i flag can be used to specify the network interfaces on which
       the relay agent should listen.   In general, it must listen  not
       only  on those  network  interfaces  to which clients are attached,
       but also on those network interfaces to which  the  server  (or
       the  router that reaches  the  server)  is attached.

you only specified one interface--i'm guessing the one that the client
is on.  try using simply:

  dhcrelay adept.mgr

unless you have a reason to exclude some interfaces.

also--what does this have to do with netfilter?

-j

--
"Lisa, Vampires are make-believe, like elves, gremlins, and eskimos."
        --The Simpsons

