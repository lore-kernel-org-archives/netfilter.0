From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: Re: server in DMZ
Date: Thu, 2 Sep 2004 00:08:21 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040902040821.GA12641@tranquility.scriptkitchen.com>
References: <20040902025038.GA10835@tranquility.scriptkitchen.com>
	<1094094296.1824.96.camel@wolfpack.ljm.dom>
	<20040902031755.GA11485@tranquility.scriptkitchen.com>
	<1094095481.1824.102.camel@wolfpack.ljm.dom>
	<20040902035116.GA12345@tranquility.scriptkitchen.com>
	<1094097295.2037.161.camel@localhost>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1094097295.2037.161.camel@localhost>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter ML <netfilter@lists.netfilter.org>

On Wed, Sep 01, 2004 at 11:54:55PM -0400, John A. Sullivan III wrote:

> I think you have confused the issues.  Do not put the source match in
> the PREROUTING rule (thus your squid access from the local LAN will not
> break).  Do put the source match in the FORWARD rule.  That will
> restrict outside access to only 1.2.3.4.  I assume there is already a
> FORWARD rule that allows access from the LAN.  Hope this helps - John

So, you mean I keep the PREROUTING rule as before and make
-A FORWARD -d 10.10.10.3 -p tcp -m tcp --dport 80 -j ACCEPT
to
-A FORWARD -s 5.6.7.8 -d 10.10.10.3 -p tcp -m tcp --dport 80 -j ACCEPT

But will this not forward requests from my squid proxy server too?

-Payal

