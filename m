From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: mangle + TCP Flags
Date: Wed, 10 Dec 2003 19:38:29 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312101938.29329.Antony@Soft-Solutions.co.uk>
References: <20031210151934.65780e26.jm.nfilter@laposte.net> <002701c3bf53$62b81d90$0e25fe0a@southpark.ae.poznan.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002701c3bf53$62b81d90$0e25fe0a@southpark.ae.poznan.pl>
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

On Wednesday 10 December 2003 7:25 pm, Maciej Soltysiak wrote:

> [Oops, sorry there for incomplete mail :)]
> Hi,
>
> > I think to something like that:
> > iptables -t mangle -A INPUT -j TCPFLAG --set-flags FIN,URG
>
> There is no such module. It would be possible to do that.
> If a module like this existed it would be a great way to violate the
> protocol and cause antisocial behaviour of your tcp stack.

There are plenty of ways to do that already - I don't think one more would 
hurt....   :)

Enough people think that un-decrementing the TTL field, or DROPping packets 
without sending back RST or ICMP, is a bad enough violation of the protocol 
(both of these are easily possible with netfilter as it is).

Antony.

-- 
Perfection in design is achieved not when there is nothing left to add, but 
rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

                                                     Please reply to the list;
                                                           please don't CC me.


