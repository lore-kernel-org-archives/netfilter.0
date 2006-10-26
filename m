From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: NATing on a single interface?
Date: Thu, 26 Oct 2006 10:45:08 -0500
Message-ID: <ehql65$f08$1@sea.gmane.org>
References: <ehptuc$bo6$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ehptuc$bo6$1@sea.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Philip Pemberton wrote:
>   So what I'd like to do is have the DSL router forwarding to the 
> firewall server, then have the firewall server do NATing and firewalling 
> for the entire LAN subnet, all on a single interface. Is this doable, or 
> do I really need to add another Ethernet interface?

There's no reason a forwarded packet can't go back out the same
interface on which it arrived.  There's an obvious compromise in
security when you have both sides of the firewall on the same
physical network, but if you trust your own machines and just
want to protect against external attacks you should be OK as
long as the DSL router forwards packets to the firewall machine
only.

-- 
Bob Nichols         Yes, "NOSPAM" is really part of my email address.


