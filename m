From: Tobias DiPasquale <codeslinger@gmail.com>
Subject: Re: conntrack records not going away?
Date: Wed, 22 Dec 2004 07:37:55 -0500
Message-ID: <876ef97a041222043743ee9a5c@mail.gmail.com>
References: <876ef97a041220111947fbeff5@mail.gmail.com>
	<1103596432.6589.8.camel@hubcap.ljm.dom>
Reply-To: Tobias DiPasquale <codeslinger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1103596432.6589.8.camel@hubcap.ljm.dom>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

On Mon, 20 Dec 2004 21:33:52 -0500, Jason Opperisano <opie@817west.com> wrote:
> once a TCP connection gets to ESTABLISHED [ASSURED] state--it will not
> be removed from conntrack until it times out (after 5 days by default
> (432000 seconds)), or one side sends a FIN-ACK packet requesting that
> the connection be torn down.
> 
> it sounds like you're shutting down endpoints after the connections are
> setup, but before they have a chance to close them.

I wasn't able to get a capture that expressed this particular problem.
Every time I did a capture, the FINs were sent properly and the
conntrack records were removed. But I have another question: is what
you're telling me above that the kernel will sometimes not correctly
close a socket that a process has open when it gets killed? Where is
the code in the kernel that governs that behavior?
linux/net/ipv4/tcp_*?

-- 
[ Tobias DiPasquale ]
0x636f6465736c696e67657240676d61696c2e636f6d

