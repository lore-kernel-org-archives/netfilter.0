From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: inadequate NEW, INVALID state definitions
Date: Wed, 2 Jun 2010 21:27:09 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006022103590.32028@obet.zrqbmnf.qr>
References: <loom.20100602T012732-376@post.gmane.org> <AANLkTikavmrze4l8YGeA3o9zbX9mV-lrSPXdBPNpIAoH@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikavmrze4l8YGeA3o9zbX9mV-lrSPXdBPNpIAoH@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Curby <curby@cur.by>
Cc: Jeremiah Crockett <jrmhcrcktt@gmail.com>, netfilter@vger.kernel.org


On Wednesday 2010-06-02 18:58, Curby wrote:
>On Tue, Jun 1, 2010 at 5:31 PM, Jeremiah Crockett <jrmhcrcktt@gmail.com> wrote:
>> I've searched the list archives and googled available iptables documentation,
>> but haven't yet found satisfactory explanations for iptables states, in
>
>After talking to a colleague about a recent ruleset of mine, we came
>to the same conclusion, i.e. the existing docs aren't very good at
>explaining specifically what causes a packet to be marked one way or
>another.

Yeah unfortunately most documents are not written by developers and
thus accumulate a lot of half-knowledge or outright guessing.

>As one example of many, this doesn't seem to be complete, or
>even necessarily correct:
>
>http://www.faqs.org/docs/iptables/userlandstates.html

The document is:

 1. indeed outdated
 2. indeed incomplete (owing to point 1.)
 3. does have bad description though
 4. claims that are, technically, incorrect
   * like "to be considered as RELATED, we must first have a connection
     that is considered ESTABLISHED. "

>The problem is that a packet that is NEW could be marked INVALID due

Interesting you are copying the document's problems in wording :)

	(=>) Packets cannot be NEW. Connections are.

>to a problem within the packet, e.g. an impossible or
>standards-noncompliant combination of flags, so the determination of
>NEW is only made after INVALID, RELATED, and ESTABLISHED are shown to
>not apply.  This is counter to a lot of documentation which starts by
>mentioning NEW first, from which readers might infer that NEW packets
>will never match INVALID because they were already marked NEW.

The documentation is basically correct despite imprecise. The five
--ctstates {NEW, ESTABLISHED, RELATED, INVALID, UNTRACKED} _are
mutually exclusive_ to another.


An skb will start out zeroed, i.e.

	skb->nfct = NULL
	skb->nfctinfo = 0; /* IP_CT_NEW == 0 */

Since the logic for xt_conntrack ctstate testing is:

	if (skb->nfct == NULL)
		"INVALID";
	else if (skb->nfct == &nf_conntrack_untracked)
		"UNTRACKED";
	else if ((skb->nfctinfo % IP_CT_IS_REPLY) == IP_CT_NEW)
		"NEW";
	else if ((skb->nfctinfo % IP_CT_IS_REPLY) == IP_CT_ESTABLISHED)
		"ESTABLISHED";
	else if ((skb->nfctinfo % IP_CT_IS_REPLY) == IP_CT_RELATED)
		"RELATED";

Packets basically start without any associated connection, that is,
will be matched by -m conntrack --ctstate INVALID.

When it's nf_conntrack's turn, it may assign something to skb->nfct,
which makes --ctstate NEW match. Or it may not (faulty packet, no
association for ICMP, etc.), skb->nfct* is left as is, in other
words, it will continue to match --ctstate INVALID.
