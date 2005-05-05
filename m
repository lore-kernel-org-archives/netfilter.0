From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: doubt on a rule ?
Date: Thu, 05 May 2005 10:47:43 -0500
Message-ID: <427A401F.9090505@riverviewtech.net>
References: <1115306460.1070.104.camel@maclinux.lotus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1115306460.1070.104.camel@maclinux.lotus>
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
To: NetFilter <netfilter@lists.netfilter.org>

> I have one doubts on a rule, in the case would be is syntax:  iptables -
> the FORWARD - m limit -- limit 60/minute limit-burst 60, what it is rule
> makes,  somebody can explain?

The rule "-A FORWARD -m limit --limit 60/minute --limit-burst 60 -j ACCEPT" will only allow an average of 60 packets per minute to match this rule with an initial burst of 60 packets to spare.  Seeing as how you do not have any matchs for which direction the packets are going you will have a combined limit of 60 packets per minute in and out with this rule.



Grant. . . .

