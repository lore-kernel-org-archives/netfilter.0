From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: i has a problem with the kernel 2.4.19 and 2.4.20 and iptable
Date: Sun, 15 Dec 2002 07:24:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GOEDLKDBKHLHGAKAGFGKGEIPLLAA.rsterenborg@xs4all.nl>
References: <web-290033@gecyt.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <web-290033@gecyt.cu>
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
To: Administrador de Red <admin@gecyt.cu>, netfilter@lists.netfilter.org

> Hi friends
> Today I install the kernel 2.4.20 for linux red hat, and
> when i want to finish, i execute /etc/rc.d/init.d/iptables
> status, for see the status of iptables, bu what sorprase!!
> the iptables showing me the next error.
>

...

> modprobe can't locate module iptables
> iptable v1.2.3 can't initialize iptables mangle
> table does not exist do you need to insmod?
> perhpas iptables or you kernel need to be upgraded?

Did you, before configuring/compiling, patch the kernel with
patch-o-matic and compile a new iptables ?
You just might want to upgrade your iptables-1.2.3 to 1.2.7a.


Rob


