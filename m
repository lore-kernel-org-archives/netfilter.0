From: Henti Smith <bain@tcsn.co.za>
Subject: Re: transparent squid with internal sites as well
Date: Wed, 27 Nov 2002 09:14:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021127091419.57f9a3e6.bain@tcsn.co.za>
References: <20021125121935.0adac911.bain@tcsn.co.za>
	<1038221585.19172.151.camel@rayw.knowledgefactory.co.za>
	<20021127085814.16b50de3.bain@tcsn.co.za>
	<1038380456.1451.65.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1038380456.1451.65.camel@rayw.knowledgefactory.co.za>
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

> > No it's not. the dns server is on the outside of the firewall.
> > What does split horizon DNS do ? 
> > 
> Basically it resolves names to different ip addresses based on where the
> request came from. For example it can be setup so that if a person on
> the local lan makes a dns request for www.foo.bar.com it will give back
> 192.168.1.123 and if someone from outside requests www.foo.bar.com it
> resolves to the public ip address , e.g. 196.4.160.123.

Ok ... let me draw a complete picture then. 
We have two DNS servers one for internal use and one for external use.
The internal uses the external for "normal" internet DNS and the internal handles all internal DNS.
So. If a machine on the internal network pings www.website.ady he gets 10.9.9.9
on the outside you ping and get 196.9.9.9 which points to firewall. that ip on the firewall is being redirected to 
10.9.9.9 on the inside. 

So in a sence the DNS is split. 
I think the problem tho is that once the redirecting os squid works correctly, it grabs the internal web as well and for some reason 
boggs it up. if it's not working the packets get to 10.9.9.9 on the internal network fine.

I'm way new to transparent proxy, but I've done a bit of playing iptables. 
I'm going to play around witha  few more ideas tho.

Thanks for the help so far.

Henti 

