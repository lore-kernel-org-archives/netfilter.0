From: Bill Davidsen <davidsen@tmr.com>
Subject: Re: Fairly complex multi-ISP firewall/router problem
Date: Fri, 02 Apr 2004 22:24:17 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <406E2E61.1080102@tmr.com>
References: <c4kjrg$lqm$1@gatekeeper.tmr.com> <200404022206.18921.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404022206.18921.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

Antony Stone wrote:
> On Friday 02 April 2004 9:57 pm, Bill Davidsen wrote:
> 
> 
>>I am trying to set up a single Linux router, RH9.0, for a non-profit I
>>am supporting with some free consulting. They have two ISP lines, each
>>of which has a three bit CIDR block, and an internal network.
>>
>>Part one:
>>
>>All I want to do is send packets out the interface which matches the
>>source IP, and I don't think there's any reasonable way to get there
>>without patches or BSD.
> 
> 
> So why not use BSD?

That is what I'm asking myself. I guess the answer is that I like Linux 
better in other ways, but given the choice between maintaining a patch 
and using BSD... I may.
> 
> BTW: What was Part two?

Part two is the need to send to certain destinations using a known 
source IP (SNAT), which I would like to do on the firewall just to avoid 
having change on the server. That's easy, a rule for SNAT and a static 
route for the destination. It just adds cruft to the tables, that's been 
working for a while, trusted outgoing mail get SNAT now.

-- 
bill davidsen <davidsen@tmr.com>
   CTO TMR Associates, Inc
   Doing interesting things with small computers since 1979

