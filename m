From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Nat with a dynamic IP
Date: Fri, 5 Sep 2003 13:11:00 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030905171100.GA2100@cannon.eng.us.uu.net>
References: <032001c373b2$5daabf70$49caa8c0@caris.priv> <200309051605.36015.tscherf@web.de> <035101c373bb$0c2b9fd0$49caa8c0@caris.priv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <035101c373bb$0c2b9fd0$49caa8c0@caris.priv>
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
To: Peter Marshall <peter.marshall@caris.com>
Cc: Thorsten Scherf <tscherf@web.de>, netfilter@lists.netfilter.org

On Fri, Sep 05, 2003 at 11:36:09AM -0300, Peter Marshall wrote:

> That is a pretty good solution for the SNAT.  I never thought about MASQ.
> However .... I am not sure if the DNAT is the best solution ....  WHat if
> you had multiple ip numbers on the external card ....

and they're all dynamic? Give us an example...

Ramin

> More importantly, what about trying to connect directly to the firewall from
> an external address.

