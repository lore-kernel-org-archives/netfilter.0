From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: iptables v1.3.8: can't initialize iptables table `filter'
Date: Wed, 15 Aug 2007 11:53:04 +0200
Message-ID: <06de01c7df22$12fc3870$0b0ffe0a@NS006819>
References: <BAY144-W1031A33CB8746DB70BC74289DE0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY144-W1031A33CB8746DB70BC74289DE0@phx.gbl>
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
To: netfilter@lists.netfilter.org

> I just updated to linux kernel 2.1.22 and when trying to use
> iptables, I get the following answer:

*Updated* to linux-2.1.22? To me that would seem like a huge downgrade.
Please; this is a typo and you mean 2.6.22.1 or something? :-)

> # added by seb on 08/13/07
> # enables conntrack
> #CONFIG_NF_CONNTRACK_ENABLED=m

Shouldn't this be enabled?

[...]

> #
> # CONFIG_NETFILTER is not set

Shouldn't this be set?
(CONFIG_NETFILTER=y)

It looks like as if you're configuring the kernel by hand, editing the
.config file. If you did this, perhaps do a "make menuconfig" (or if you
have/use X, "make xconfig") as it will present you a nice menu with
options you can select.


Grts,
Rob



