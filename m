From: Jason Opperisano <opie@817west.com>
Subject: Re: Weird routing problem?
Date: Wed, 01 Dec 2004 08:43:25 -0500
Message-ID: <1101908605.3251.30.camel@hubcap.ljm.dom>
References: <200412010418.41288.hancock@anansispaceworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200412010418.41288.hancock@anansispaceworks.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 2004-12-01 at 05:18, Terry Hancock wrote:
<snip>
>    "Fragments"?

bingo.

> Why only from certain web servers?
>    e.g.:
>    http://www.tera-byte.com
>    http://www.poalo.com
>    http://www.paypal.com

because the reply packets form those sites break the "need-to-frag"
threshold.

> How can I verify what is and is not being dropped?

tcpdump on your firewall's external interface for ICMP Type 3 Code 4
packets.

> Some details:

<snip>

one detail that would've been nice would be the output of "ip link show"
so that we could see the MTU of ppp0...

generically--try this:

  iptables -I FORWARD -p tcp --tcp-flags --syn \
    -j TCPMSS --clamp-mss-to-pmtu

if that doesn't help:

$MYMSS="$MTU_OF_PPP0 - 40"

  iptables -I FORWARD -p tcp --tcp-flags --syn \
    -j TCPMSS --set-mss $MYMSS

-j

--
"Me lose brain? Uh, oh! Ha ha ha! Why I laugh?"
	--The Simpsons


