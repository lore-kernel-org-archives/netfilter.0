From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SNAT matching question
Date: Sun, 29 Sep 2002 17:46:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020929164657.RSYO13996.mta05-svc.ntlworld.com@there>
References: <Pine.GSO.4.44L-027.0209291222490.1180-100000@unix4.andrew.cmu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.44L-027.0209291222490.1180-100000@unix4.andrew.cmu.edu>
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

On Sunday 29 September 2002 5:26 pm, Mohan Khurana wrote:

> Incoming connections does pose a problem.  So I assume that the problem is
> that a packet comes in to a locally hosted server, this is no problem.
> The problem occurs when packets are flowing back out, since they may go
> over the wrong interface due to the equalize nexthop.
>
> right?

No - I meant that there's no sensible way of balancing incoming connections 
because you have no control over the routing of packets out on the Internet 
which are coming to you.

Reply packets should not be a problem unless your ISPs block packets with 
source addresses which don't match the network range you have from them.

The packets themselves will get reverse NATted automagically by netfilter in 
the same way as the incoming packets.  No worries there.

Antony.

-- 

If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

