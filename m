From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Conntrack Response to Port Unreachable for UDP
Date: Wed, 23 Jul 2003 09:53:32 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030723135332.GB23652@cannon.eng.us.uu.net>
References: <20030723025455.36204.qmail@web21102.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030723025455.36204.qmail@web21102.mail.yahoo.com>
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
To: Tim Burress <hokousha2001@yahoo.com>
Cc: netfilter@lists.netfilter.org

-m limit --limit ...


On Tue, Jul 22, 2003 at 07:54:55PM -0700, Tim Burress wrote:

> Hello!
> 
> We kind of an interesting problem and I was wondering
> if people have any suggestions. Imagine a network like
> this:
> 
>     X----------F---------Z
> 
> where F is a Linux box acting as a firewall to protect
> the Z network. F runs
> 
>     kernel 2.4.21-pre5 
>     iptables 1.2.7a
>     patch-o-matic 20030112
> 
> The problem arises like this:
> 
> X attempts to initiate a UDP exchange with Z, but Z
> responds to the initial packet with an ICMP port
> unreachable. That's fine, but once this happens, it
> seems that Z (or some other node on Z's network) is
> then able to repeatedly replay this same ICMP port
> unreachable back to X.
> 
> So the question is, what's the best way to prevent
> that at F?
> 
> One idea was that conntrack could destroy the
> conntrack record for the UDP "connection" upon receipt
> of the port unreachable. Another, much larger scope
> solution would be to implement some sort of
> generalized replay protection that would attempt to
> identify and DROP replayed packets. The first seems
> nice and simple, but we're worried about unintended
> consequences. The second seems interesting, but could
> get a little involved. I wondered if people had any
> thoughts or suggestions for other ways to deal with
> this.
> 
> Thanks!
> 
> Tim
> 
> __________________________________
> Do you Yahoo!?
> Yahoo! SiteBuilder - Free, easy-to-use web site design software
> http://sitebuilder.yahoo.com

