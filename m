From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: matching on ICMP responses
Date: Sun, 18 Jul 2004 22:09:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407182209.28604.Antony@Soft-Solutions.co.uk>
References: <40FAE42A.6090300@metaloft.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40FAE42A.6090300@metaloft.com>
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

On Sunday 18 July 2004 9:57 pm, Dirk Morris wrote:

> Is there a way to match only certain ICMP responses that relate to
> certain other sessions.
>
> example: is there a rule/match I can use to specify that I want to block
> all ICMP port unreachable errors, but _only_ in response to UDP packets (not
> TCP).

Why would you get an ICMP message in response to a TCP port being unreachable?

TCP will either return RST, or simply won't return the SYN-ACK packet, and 
eventually the client will timeout.   There should be no ICMP packets 
involved.

> Or maybe both TCP and UDP, but only port 123. etc etc.

If you want to match ICMP packets which are in response to an unsuccessful UDP 
packet to port 123, you could try the "string" match?   It has the 
disadvantage (which for most other purposes is a severe one) that it will 
only match strings contained competely within one packet, however in this 
case I think all the data you will be interested in will be in one packet, 
therefore it might be a good solution to the problem.

Regards,

Antony.

-- 
Perfection in design is achieved not when there is nothing left to add, but 
rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

                                                     Please reply to the list;
                                                           please don't CC me.


