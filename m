From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: DNAT problem /  question
Date: Fri, 18 Jun 2004 18:09:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003501c4554e$acf6ec10$1201a8c0@admin>
References: <519AD2BA94FC6E4DB5DE078B2E37CB10A76BA5@PDBEX01E.pdb.fsc.net>
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

> $IPTABLES -A INPUT   -m state --state NEW,
> ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A OUTPUT  -m state --state NEW,
> ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A FORWARD -m state --state NEW,
> ESTABLISHED,RELATED -j ACCEPT

I do not think you want this. Since you don't specify protocol and/or
port, you are accepting any packet that is NEW, RELATED or ESTABLISHED.
That means any packet.
This is the same as having a policy of ACCEPT for all filter chains with
no rules to block anything. If you want to filter anything, leave the
NEW out of the rules, or just set policy to ACCEPT and skip these rules.
(Btw, do you have policy set to DROP for INPUT, OUTPUT and FORWARD so
that these rules make sense ?)


Gr,
Rob


