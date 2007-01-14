From: TheGesus <thegesus@gmail.com>
Subject: Re: QUEUE - ipq_set_verdict overridden?
Date: Sun, 14 Jan 2007 17:44:16 -0500
Message-ID: <5e70f6530701141444q40ea9c0as5be86ce944668fa@mail.gmail.com>
References: <5e70f6530701141310t66399aabx6b5d6cdc65b2afa9@mail.gmail.com>
	<45AAA920.5040005@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45AAA920.5040005@netfilter.org>
Content-Disposition: inline
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
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter <netfilter@lists.netfilter.org>

On 1/14/07, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> TheGesus wrote:
> > However, for any "ESTABLISHED" connections nothing happens.
> > ipq_set_verdict returns the same status (IPQM_PACKET - 0x1C) in both
> > cases but the packets breeze on through for "ESTABLISHED" connections.
> >
> > I should note I'm doing nothing to the packets and simply returning an
> > NF_DROP or NF_ACCEPT.
> >
> > The iptables rules are kept as simple as possible.  I have tried both
> >
> > -A INPUT -p udp -m udp --dport 7777 -j QUEUE
>
> Probably there is one rule before this one above that let packets that
> belong to establish connections go through.
>

No.  There isn't.  There is one ACCEPT rule beyond it which deals with
the other ports (udp 7778-7790), which are of no interest to the QUEUE
code.  There are only two rules.

