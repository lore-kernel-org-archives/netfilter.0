From: "Postmaster" <iptables-pmd0052@promind.de>
Subject: Re: question about -t nat
Date: Sat, 19 Jun 2004 21:54:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000b01c45637$42d805a0$6900a8c0@W2K>
References: <000701c45626$e27411a0$6900a8c0@W2K> <1087670301.2051.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

> But what, exactly, is the question?

I'm not sure after your question. The following error "iptables: target
problem" comes, if i enter this rule in a user-chain:
iptables -t nat -A first_group -s a.b.c.d -d x/y -p tcp --dport 10001  \
-j DNAT --to-destination 1.2.3.4:25

her are my version and modules:
uname -r --> 2.4.20
iptables -V --> v1.2.8
lsmod --> ipt_REJECT
ipt_REDIRECT
ipt_limit
ipt_LOG
ipt_multiport
ipt_state
ipt_MASQUERADE
iptable_filter
iptable_nat
ip_conntrack_ftp
ip_conntrack
ip_tables

after your asks i made a test on a other maschine. what an miracle, the same
rule works fine. and here my question again. what kind of modul is missing
to me?

best regards

Jan


