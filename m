From: Michael Renzmann <mrenzmann@otaku42.de>
Subject: Re: "selective" connection tracking?
Date: Fri, 31 Oct 2003 13:17:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FA252E2.4010304@otaku42.de>
References: <3F9EA786.5060401@otaku42.de>	 <1067591422.812.13.camel@elendil.intranet.cartel-securite.net>	 <3FA23DB7.3010300@otaku42.de> <1067598149.4557.7.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1067598149.4557.7.camel@elendil.intranet.cartel-securite.net>
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

Hi.

Cedric Blancher wrote:
>>Just to be sure: it will still be possible to use conntrack for traffic 
>>that it targeted to the router itself, while pushing forwarded traffic 
>>through the router without connection traffic. Correct?
> You're able to do anything you want, as you have to explicitly implement
> which traffic you do not want to track. Suppose your local IP is
> A.B.C.D, then doing something like this should do the trick :
> 
> 	iptables -t raw -A PREROUTING -d ! A.B.C.D -j NOTRACK
> 
> Do this to exclude all traffic destined to local box.

You mean "not destined to the local box", right? :)

Bye, Mike



