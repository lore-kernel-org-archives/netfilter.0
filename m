From: Rick Mann <rmann@latencyzero.com>
Subject: Re: Inbound port mapping blocks outbound connection?
Date: Mon, 20 Dec 2004 15:55:01 -0800
Message-ID: <8FCFE8B8-52E2-11D9-BA43-000A95CFE5AA@latencyzero.com>
References: <4CE68372-5207-11D9-BA43-000A95CFE5AA@latencyzero.com>
	<1103548934.3264.6.camel@hubcap.ljm.dom>
Mime-Version: 1.0 (Apple Message framework v619)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1103548934.3264.6.camel@hubcap.ljm.dom>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org


On Dec 20, 2004, at 05:22, Jason Opperisano wrote:

> well--you provide pretty much zero detail, so i'm going to have to put
> my funny-looking kreskin hat on...

Really? I thought I put a lot of info in there. Please tell me what 
else would have helped, so that I may do better next time.

> the powers-that-be are telling me that you (like many other people that
> as this question), did not specify "-i $OUTSIDE_IF" in your PREROUTING
> nat rule, and therefore packets that arrive inbound on the inside
> interface match and disappear into the ether.
>
>   iptables -t nat -A PREROUTING -i $OUTSIDE_IF -p tcp \
>     -d $OUTSIDE_IP --dport 6969 -j DNAT --to-destination $INSIDE_HOST

Ah! Yes, this sounds very plausible. I appreciate the advice!

-- 
Rick


