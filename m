From: "R. Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: How to check user-defined chains
Date: Mon, 28 Oct 2002 17:43:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c27ea1$242b09f0$0401000a@robbysan.org>
References: <200210281605.SAA33419@mover.WUCB.Lviv.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210281605.SAA33419@mover.WUCB.Lviv.net>
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

> Are there any ways to know all user-defined chains for iptables
(like
> /proc/net/ip_tables_names for tables)?
> I try to builded my ipfw script using many own chains, but
> it's hard to
> delete all of them -- I must remember all of previous

iptables -X
iptables -t nat -X
iptables -t mangle -X

man iptables, specifically the last line :

-X, --delete-chain
Delete  the  specified  user-defined chain.  There must be no
references to the chain.  If there are,              you must delete
or replace the referring rules before the chain can be deleted.  If
no  argument  is given, it will attempt to delete every non-builtin
chain in the table.


Rob


