From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: QUEUE - ipq_set_verdict overridden?
Date: Sun, 14 Jan 2007 23:05:20 +0100
Message-ID: <45AAA920.5040005@netfilter.org>
References: <5e70f6530701141310t66399aabx6b5d6cdc65b2afa9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5e70f6530701141310t66399aabx6b5d6cdc65b2afa9@mail.gmail.com>
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
To: TheGesus <thegesus@gmail.com>
Cc: netfilter <netfilter@lists.netfilter.org>

TheGesus wrote:
> However, for any "ESTABLISHED" connections nothing happens.
> ipq_set_verdict returns the same status (IPQM_PACKET - 0x1C) in both
> cases but the packets breeze on through for "ESTABLISHED" connections.
> 
> I should note I'm doing nothing to the packets and simply returning an
> NF_DROP or NF_ACCEPT.
> 
> The iptables rules are kept as simple as possible.  I have tried both
> 
> -A INPUT -p udp -m udp --dport 7777 -j QUEUE

Probably there is one rule before this one above that let packets that
belong to establish connections go through.

-- 
The dawn of the fourth age of Linux firewalling is coming; a time of
great struggle and heroic deeds -- J.Kadlecsik got inspired by J.Morris

