From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: killing an existing connection
Date: Thu, 7 Nov 2002 19:42:10 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021107194213.SUJU27595.mta05-svc.ntlworld.com@there>
References: <1036697319.10279.13.camel@meirm2kp.riunx>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1036697319.10279.13.camel@meirm2kp.riunx>
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

Sorry - please disregard my previous reply to this - my brain was temporarily 
disengaged and forgot to consider the implications of established connections 
bypassing the nat table ruleset.

On Thursday 07 November 2002 7:28 pm, Meir Michanie wrote:

> I am trying to develop a pay per routing limited by time. (lets say
> 15mins)
>
> step 1 :the iptables should redirect all forwarding packets to my
> gatekeeper site.
>
> step 2:after you pay I should allow youe mac address for free
> forwarding.
>
> step 3: but adding a cron job or something like that to stop you after
> 15 mins and then redirect you back to my site to pay for more time.
>
> step 1 is done by
>
> iptables  -t nat -A PREROUTING -j DNAT --to-destination 10.0.10.2
>
> step 2 is done by
>
> iptables -t nat -I PREROUTING -m mac --mac-source 00:20:18:2D:6B:20 -j
> ACCEPT
>
> My problem is with step 3:

How about adding a FORWARDing rule which REJECTs the packets with a tcp RST; 
this will stop them being established connections (in fact it will cut off 
the connection) and you can then process them with your default rule in the 
nat table again ?

iptables -A FORWARD -m mac --mac-source 00:20:18:2D:6B:20 -j REJECT 
--reject-with tcp-reset

Antony.

-- 

Your email has been returned due to insufficient voltage.

