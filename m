From: "Maciej Soltysiak" <solt@dns.toxicfilms.tv>
Subject: Re: mangle + TCP Flags
Date: Wed, 10 Dec 2003 20:25:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002701c3bf53$62b81d90$0e25fe0a@southpark.ae.poznan.pl>
References: <20031210151934.65780e26.jm.nfilter@laposte.net>
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
To: Jean-Marie <jm.nfilter@laposte.net>, netfilter@lists.netfilter.org

[Oops, sorry there for incomplete mail :)]
Hi,

> I think to something like that:
> iptables -t mangle -A INPUT -j TCPFLAG --set-flags FIN,URG
There is no such module. It would be possible to do that.
If a module like this existed it would be a great way to violate the
protocol
and cause antisocial behaviour of your tcp stack.

Anyway such a module is not difficult to write. So it is possible, but
nor the iptables package and the kernel, nor patch-o-matic
do not contain such a module.

Regards,
Maciej


