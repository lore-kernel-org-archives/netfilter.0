From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Need help have some questions...
Date: Sun, 24 Aug 2003 23:24:04 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030825032403.GA26945@cannon.eng.us.uu.net>
References: <20030818205223.GA3993@cannon.eng.us.uu.net> <20030823205158.60796.qmail@web40210.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030823205158.60796.qmail@web40210.mail.yahoo.com>
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
To: SBlaze <dagent.geo@yahoo.com>
Cc: nf <netfilter@lists.netfilter.org>

On Sat, Aug 23, 2003 at 01:51:58PM -0700, SBlaze wrote:

> A question to Ralf about the second lawyer of a firewall. Is a circut relay
> also known as a bridge?

In general:

layer 1 -> repeater
layer 2 -> bridge
layer 3 -> router

Now, what does the circuit relay do? Does it just amplify the signal? Or does
it terminate, reconstruct and forward the information?


> 
> Also a question to Ramin. You make note in that last post of basically dealing
> with the HTTP protocol on the HTTP application level.... are you referreing to
> web server(apache) ?

No. What I said is: Filtering based on the specifics of an application is best
done by a specialized module which knows enough about that particular protocol.

Ramin

> 
> Thanks to all who are helping out. I see a soloution coming about. With a
> little more help I and some others I know may get there.
> 
> Thanks
> SBlaze
> 
> =====
> "Winky is not knowing how sir, winky is not knowing how?" -=Winky / Harry Potter and the Goblet of Fire=-"
> 
> __________________________________
> Do you Yahoo!?
> Yahoo! SiteBuilder - Free, easy-to-use web site design software
> http://sitebuilder.yahoo.com

