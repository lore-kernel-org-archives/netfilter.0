From: Michael Renzmann <mrenzmann@otaku42.de>
Subject: Re: "selective" connection tracking?
Date: Fri, 31 Oct 2003 11:47:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FA23DB7.3010300@otaku42.de>
References: <3F9EA786.5060401@otaku42.de> <1067591422.812.13.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1067591422.812.13.camel@elendil.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

Hi Cedric.

First of all thanks for your answer.

Cedric Blancher wrote:
> However, you can use raw table that is available in patch-o-matic. This
> will imply iptables and kernel compilation. raw table is prior to
> conntrack subsystem and allows you to choose wether a packet has to go
> through conntrack or not, using NOTRACK target :
> 
> 	iptables -t raw -A PREROUTING -d 1.2.3.4 -p tcp --dport 80 \
> 		-j NOTRACK
[...]

Thanks for the tip, I think this will do. We already use a bunch of the 
pom-patches, and if I remember correctly the RAW-patch has already been 
applied.

> Note that if you do not conntrack a connection, you loose all conntrack
> capabilities such as ICMP errors handling, helpers and NAT (as
> Netfilter's NAT relies on conntrack).

Just to be sure: it will still be possible to use conntrack for traffic 
that it targeted to the router itself, while pushing forwarded traffic 
through the router without connection traffic. Correct?

Bye, Mike


