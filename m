From: David Cannings <lists@edeca.net>
Subject: Re: Is outbound rule needed for http responses?
Date: Mon, 8 Mar 2004 08:46:04 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403080846.04475.lists@edeca.net>
References: <001101c4048c$74e8c180$3702a8c0@ARAQI>
Reply-To: david@edeca.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001101c4048c$74e8c180$3702a8c0@ARAQI>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Sunday 07 March 2004 21:37, Adesina Adebiyi wrote:
> Hello gentle expert,
>
> I am trying to adapt the iptables firewall for my hosting server.  That
> is, http, https will be running on it to serve ecommerce clients.  I
> have adapted rules to allow tcp inbound services for port 80 and 443. 
> To be able to respond to the requesting clients, do I need
> corresponding tcp outbound services on port 80 and 443? Or does the
> first inbound rule take care of this automatically since anyone that
> makes a tcp request is most likely to expect a reply?

This is what ESTABLISHED and RELATED are for, you might like to add rules 
that use these two states.  I use the following in my firewall script, 
you may wish to be a bit stricter.  Also, if you have a default DROP rule 
on your OUTPUT chain, you'll need to add a similar rule in there too.

# Allow anything that's already setup
iptables -A INPUT -i ppp0 -m state --state RELATED,ESTABLISHED -j ACCEPT

Hope that helps,

David

