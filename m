From: Phil C <flah@hell.com>
Subject: Re: help accepting unbound addresses
Date: Fri, 14 May 2004 23:32:49 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040515033249.GW78829@adsl195.cofs.net>
References: <20040515002908.GU78829@adsl195.cofs.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040515002908.GU78829@adsl195.cofs.net>
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

As a follow up to my initial questions, I began looking into the possible
viability of using libipq and the QUEUE target. Right now I'm using the
example provided in the man page, but with the same results... The packets are
looping and eventually producing icmp in-transit timeouts.

I thought that doing an ipq_set_verdict() would allow the packet to actually
be accepted, short circuiting the rest of the kernel processing of the
packet... It appears that this is not the case, or am I missing something?

Again, all I really need to do it accept traffic for addresses that aren't
bound to any interfaces, without modifying the original destination address.
It seems that one way or another, this must be possible.

-- 
<flah@hell.com>
\x104\x97\x108\x102

