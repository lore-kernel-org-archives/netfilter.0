From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: iptables and mac filtering
Date: Sat, 08 Apr 2006 11:14:44 -0500
Message-ID: <e18nhl$5pp$1@sea.gmane.org>
References: <44377281.60706@ratel.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44377281.60706@ratel.ru>
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

vlad f halilow wrote:
> 
> Hi there. Please help with strange issuse. I have debian woody with
> 2.6.12 kernel + iptables.1.3.3. (unstable) under vmware workstation. I
> try to block connection to my PPPoE server (rp-pppoe) by mac-address of
> client. something like
> 
> #iptables -I INPUT -m mac --mac-source blablag -j DROP
> 
> . Line inserted showed by iptables -L -v -n but not block any IP-less
> requests from address specified. Ping or any IP protocols blocking
> success, but pppoe discovery, exchange and traffic pass the filter
> wthout any problem with no rule countr increment. How i can fix this
> thing? Or what i to do wrong?

You said it yourself.  These are IP-less requests.  They never make
it up to the protocol levels where iptables operates.  Yes, iptables
can match on MAC addresses, but if the packet is handled entirely
at the Data Link layer (MAC sublevel), iptables will never see it.

-- 
Bob Nichols         Yes, "NOSPAM" is really part of my email address.


