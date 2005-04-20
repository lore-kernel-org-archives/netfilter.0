From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Remapping of starcraft UDP port 6112
Date: Wed, 20 Apr 2005 11:23:54 -0500
Message-ID: <4266821A.1050500@riverviewtech.net>
References: <001001c544af$d2bd15e0$3800a8c0@Dewasp>	<42655AC6.9080007@riverviewtech.net>
	<000901c5457c$14e461e0$3800a8c0@Dewasp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000901c5457c$14e461e0$3800a8c0@Dewasp>
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
To: Doug C <the_wasp@game-nation.net.nz>
Cc: netfilter@lists.netfilter.org

> cheers for spoting that the rules were backwards, i think i must have
> stuffed them up when putting them into the email.

Thanks.  It's what this list is for, to help people.

> is it actually possible for iptables/netfilter to redirect the packets the
> way i want it to?

I would think yes.  I don't know of any reason why you would have to explicitly write rules for each system.  The only reason I can possibly think of is that the NATing code *might*, however not likely, be getting confused by the fact that the traffic is RELATED in such that both internal clients would be talking to the same server.

> if it is possible i dont see why it shouldnt work because as i said in the
> first question warcraft can use any port it pleases therefor the protocol
> must be able to handle it

Can we see a copy of your entire firewall script to make sure that there is nothing just slightly off about it?



Grant. . . .

