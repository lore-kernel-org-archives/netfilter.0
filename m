From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: question regarding netfilter usage
Date: Sat, 6 Mar 2004 09:09:51 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403060909.51699.Antony@Soft-Solutions.co.uk>
References: <40E631F174C41E4DBE52727E137AF92785BBDA@EXCHVS1.cs.cornell.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40E631F174C41E4DBE52727E137AF92785BBDA@EXCHVS1.cs.cornell.edu>
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
To: netfilter@lists.netfilter.org

On Saturday 06 March 2004 4:11 am, Hitesh Ballani wrote:

> I want to process incoming packets to one of my addresses and my ports to
> be forwarded to some other destination .. the complication arises due to
> the fact that the destination will be determined dynamically i.e based on
> the port on which the packet arrived, I need to communicate with some other
> machine using udp and determine the destination to which this is to be
> forwarded, this destination also needs to be cached so that any future
> packets on this port can directly be sent to the destination...

You might want to look into the way Linux Virtual Server works - this sounds 
something like what that does.

http://www.linuxvirtualserver.org

Antony

-- 
Documentation is like sex.
When it's good, it's very very good.
When it's bad, it's still better than nothing.

                                                     Please reply to the list;
                                                           please don't CC me.


