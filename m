From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: pop3 and dns
Date: Wed, 5 May 2004 08:30:34 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405050830.34905.Alistair@nerdnet.ca>
References: <F22386C3FEB012449238672E38ED61E706C2D6@overlord.overturemedia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F22386C3FEB012449238672E38ED61E706C2D6@overlord.overturemedia.com>
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

On May 5, 2004 12:58 am, Fritz Mesedilla wrote:
> > These look fine as they are, however you will need a rule to
> > allow the reply
> > packets, and perhaps one to SNAT your Internet-bound packets
> > if you are using
> > private addresses on your network.
>
> Oh... How do I do that? Can you give me a sample rule?
>
> > Questions:
> > 1. Can clients access anything by IP address rather than hostname?
> > 2. Do any other services work, such as web browsing (assuming
> > you have rules
> > to allow other servies)?
>
> Clients cannot access anything except web browsing through the Squid proxy.
>
> > Suggestions:
> > 1. Describe your network setup to us.
> > 2. Show us all your netfilter rules.
>
> We have public ips on the outside while we have private ips on the inside
> doing nat through iptables and not through the router as we do not have
> control of the router.
>
> For example,
>
> 202.78.90.166 <-> iptables <-> 192.168.247.11
> 202.78.90.166 <-> iptables <-> 192.168.247.12
>
> For web browsing I have squid proxy. So normally, clients do not have to
> resolve domain names as squid proxy does it for them. Now I need to allow
> clients to resolve domain names to be able to retrieve pop3 from their
> other mail servers.
>
> Thanks again!
>

	Looking at your included ruleset I don't see any NAT of the (already) allowed 
DNS and POP3 requests -- You have forward rules that will allow the DNS 
requests out the forward chain, but you are only MASQUERADING the port 80 
requests.

      Try adding a duplicate of the MASQUERADE rule to TCP and UDP port 53.
       If the pop3 is in the routable internet space, you need to MASQUERADE 
that as well.

	Alistair

	


>


	<much snippage for Brevity  >

