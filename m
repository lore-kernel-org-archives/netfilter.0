From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Forwarding intranet ip's
Date: Mon, 21 Oct 2002 10:46:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210210946.g9L9koL31353@vulcan.rissington.net>
References: <1035192954.2615.104.camel@sandy.vk2kcf.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1035192954.2615.104.camel@sandy.vk2kcf.ampr.org>
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
To: netfilter <netfilter@lists.netfilter.org>

On Monday 21 October 2002 10:35 am, Gary Hodder wrote:

> Hi Ferry,
>
> Trying to route clients 192.168.150 net to the router box on 192.168.151
> net.
> The forward chain has
> iptables -t filter -A FORWARD -s 192.168.150.0/255.255.255.0 -j ACCEPT

Do you also have a rule to allow the replies back again ?

> A client machine on 192.168.150 net can ping the 192.168.151.3 interface
> but go no further.

Do the 192.168.151.0/24 machines have a route to tell them how to get back to 
the 192.168.150.0/24 network ?

Antony.

--

Behind the counter a boy with a shaven head stared vacantly into space,
a dozen spikes of microsoft protruding from the socket behind his ear.

 - William Gibson, Neuromancer (1984)

