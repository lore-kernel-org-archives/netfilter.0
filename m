From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: exempt some source addresses from nat??
Date: Thu, 7 Nov 2002 19:35:02 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021107193505.SLUQ27595.mta05-svc.ntlworld.com@there>
References: <385DA3327471554CA86AACAA2BBB81302514DB@plstnexc01.corp.networkrobots.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <385DA3327471554CA86AACAA2BBB81302514DB@plstnexc01.corp.networkrobots.com>
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

On Thursday 07 November 2002 12:58 am, Yogini Parkhi wrote:

> Hi All,
>
> Just curious, if I have a nat rule that snats a certain network. How do I
> exempt certain addresses from this nat rule? Do I write ACCEPT rules in the
> POSTRUTING chain for those?

Yes, that's a sensible way to do it.

Suppose you have a rule:

iptables -A POSTROUTING -t nat -s 192.168.42.0/24 -j SNAT --to 172.16.11.22

But you don't want this to apply to address 192.168.42.18 (you want that to 
pass through without being SNATted).   Simply insert this rule before the one 
above:

iptables -I POSTROUTING -t nat -s 192.168.42.18 -j ACCEPT

Antony.

-- 

What is this talk of software 'release' ?
Our software evolves and matures until it becomes capable of escape,
leaving a bloody trail of designers and quality assurance people in its wake.

