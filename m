From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Destination_IP Field in packets coming from QUEUE
Date: Wed, 12 Oct 2005 23:10:06 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510122305270.31374@filer.marasystems.com>
References: <20051002185830.61776.qmail@web52811.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051002185830.61776.qmail@web52811.mail.yahoo.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Lore <skizzo82@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Sun, 2 Oct 2005, Lore wrote:

> I'm writing (tonight/tomorrow it will be finally
> tested on different networks) a daemon for linux that
> keeps tcp connections alive on multihoming devices.
> It works as follows: when a linux box with multiple
> network interfaces creates a tcp connection with
> another host (both running the daemon), for instance
> via an ethernet adapter, it can leave the current
> media and keep up the tcp connection using one of the
> others adapters available (fiber, wireless, gprs) or
> (in the case of simple ip reconfiguration) it can
> simply move from an access point with a particular
> subnet to another (with a completely different
> subnet), without interrupting the connection.

In the simplest case where only the media changes but the IP network is 
the same no changes at all is required other than to bring up/down the 
different network connections.

For the more complex case where one has to be able to move between 
different IP networks with preserved connectivity one normally implements 
something like this by using tunnelling by IPIP, GRE, IPSec, OpenVPN or 
similar.

How does your approach compare to these alternatives?

Regards
Henrik

