From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables related
Date: Mon, 8 Dec 2003 19:28:28 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312081928.28282.Antony@Soft-Solutions.co.uk>
References: <20031208191947.GA1603@msservices>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031208191947.GA1603@msservices>
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

On Monday 08 December 2003 7:19 pm, Jeffrin wrote:

> hello all,
>
> iptables -A INPUT -sport 80 -j ACCEPT
>
> shows error ...
>
>  msservices:~# iptables -A INPUT --sport 80 -j ACCEPT
> iptables v1.2.9: Unknown arg `--sport'
> Try `iptables -h' or 'iptables --help' for more information.
>
> please help me ...

You must specify whether you're talking about a TCP source port, or a UDP one.

iptables -A INPUT -p tcp --sport 80 -j ACCEPT
or
iptables -A INPUT -p udp --sport 80 -j ACCEPT

will work.

Antony.

-- 
"The joy of X!!??  I've always hated compiling graphical shite.  You have a 10 
line program, and it ends up depending on the entire known universe."

 - Philip Hands

                                                     Please reply to the list;
                                                           please don't CC me.


