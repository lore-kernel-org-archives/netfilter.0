From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: conntrack - UDP = good
Date: Wed, 23 Jun 2004 16:13:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406231613.40133.Antony@Soft-Solutions.co.uk>
References: <876ef97a04062309012fa66caf@mail.gmail.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <876ef97a04062309012fa66caf@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Wednesday 23 June 2004 5:01 pm, Tobias DiPasquale wrote:

> Hi all,
>
> Is there a way to get conntrack to _not_ track UDP connections (or
> also ICMP)? It seems rather pointless to me and its certainly taking
> up way too much memory on my box just for some DNS queries. Any ideas?

This may help:

http://lists.netfilter.org/pipermail/netfilter/2003-October/047892.html

Regards,

Antony.

-- 
Perfection in design is achieved not when there is nothing left to add, but 
rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

                                                     Please reply to the list;
                                                           please don't CC me.


