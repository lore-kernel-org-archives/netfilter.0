From: Henti Smith <bain@tcsn.co.za>
Subject: Re: transparent squid with internal sites as well
Date: Wed, 27 Nov 2002 09:26:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021127092641.3d320dd8.bain@tcsn.co.za>
References: <20021125121935.0adac911.bain@tcsn.co.za>
	<1038221585.19172.151.camel@rayw.knowledgefactory.co.za>
	<20021127085814.16b50de3.bain@tcsn.co.za>
	<1038380456.1451.65.camel@rayw.knowledgefactory.co.za>
	<20021127091419.57f9a3e6.bain@tcsn.co.za>
	<1038381319.1450.74.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1038381319.1450.74.camel@rayw.knowledgefactory.co.za>
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
To: raymondl@knowledgefactory.co.za
Cc: netfilter@lists.netfilter.org

On 27 Nov 2002 09:15:19 +0200
Raymond Leach <Ray@work> wrote:

> > I'm way new to transparent proxy, but I've done a bit of playing iptables. 
> > I'm going to play around witha  few more ideas tho.
> We also use squid as a transparent proxy here. For internal websites
> though, do you need them to go through the proxy? Is there some tracking
> that you need to do, or would it not be possible to 'catch' the requests
> to the servers using iptables before they get redirected to squid? This
> is what we do, and it works fine.

internal browsing we don't care about ... but I do need to provide stats for external traffic
if I can redirect the internal stuff before it gets to the proxy cool .. 
as long as the rest still goes to proxy and I get stats as per usual on how much they download

> Also, check what interface squid is using to process the request. It
> might be trying to use the external interface instead of the internal
> one.

any ideas how to do that ? 

Henti 

