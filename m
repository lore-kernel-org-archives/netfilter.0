From: Sheldon Hearn <sheldonh@starjuice.net>
Subject: Re: Iptables Make Rules On Different Interface? "iptables - L"
	shows no difference!
Date: Mon, 07 Jun 2004 14:20:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086610811.17769.59.camel@axl.seasidesoftware.co.za>
References: <20040606205759.47086.qmail@web41703.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040606205759.47086.qmail@web41703.mail.yahoo.com>
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
To: ke chen <linux_kurt@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Sun, 2004-06-06 at 22:57, ke chen wrote:

> I want to make iptables impose different rules on two ethernet
> interfaces.

[...]

> when applying these rules, iptables -L
> it shows 
> Chain INPUT (policy DROP)
> target prot opt source destionation
> Accept all -- anywhere anywhere

You need to use the -v option, which causes iptables to show you the
interface associated with a rule.

Ciao,
Sheldon.



