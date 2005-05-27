From: Jason Opperisano <opie@817west.com>
Subject: Re: netfilter Digest, Vol 10, Issue 74
Date: Fri, 27 May 2005 16:30:06 -0400
Message-ID: <20050527203005.GA25168@bender.817west.com>
References: <42971843.64531163.6abe.2deeSMTPIN_ADDED@mx.gmail.com>
	<9927912d05052707311500514d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <9927912d05052707311500514d@mail.gmail.com>
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

On Fri, May 27, 2005 at 06:31:55PM +0400, Visham Ramsurrun wrote:
> What I actually want is that, whether it is TCP traffic or that of any
> other protocol, the traffic be treated in the same way. I read in the
> Iptables Tutorial that there is a default connection tracking
> mechanism. There are specific protocol helper modules for handling
> specific protocol traffic (TCP, FTP are some examples). So, for the
> traffic of any particular protocol, either you use a a conntrack
> helper module (if it exists), or you use the default connection
> tracking of ip_conntrack which actually handles traffic from any
> protocol in the same way.

i think your misunderstanding is that there is some user-level choice
made here, where there is not.  ip_conntrack decides what to do based
on the protocol of the received packet.  to modify this behavior, modify
the net/ipv4/netfilter/ip_conntrack_*.c files in the kernel source tree.

<-- snip the same questions i have already answered -->

if you didn't like my answer the first time, re-asking will not a) make
me tell you what you want to hear or b) make it true even if i did tell
you what you want to hear.

-j

--
"Kevin: Dad, the fish got away.
 Joe Swanson: The hell it did. You get in there and you kick that
 fish's ass."
        --Family Guy

