From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: is this correct ?
Date: Wed, 11 Feb 2004 00:03:59 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402110003.59279.Antony@Soft-Solutions.co.uk>
References: <402381FC.4000703@tut.by>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <402381FC.4000703@tut.by>
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

On Friday 06 February 2004 12:01 pm, Aleksandr Guidrevitch wrote:

> Can anyone say if my config below is correct (/etc/sysconfig/iptables) ?
> Well, it seems to work as expected, but it is so simple,
> may be I'm missing some important security points ?

You are certainly missing some important security.

Take a look at some of the documentation for netfilter, referenced from the 
netfilter website, such as Oskar Andreasson's excellent tutorial at 
http://iptables-tutorial.frozentux.net/iptables-tutorial.html and pay 
particular attention to the meaning of the INPUT, FORWARD and OUTPUT chains.   
Specifically, packets being routed *through* the firewall from your LAN to 
the Internet (or vice versa) do *not* go through INPUT or OUTPUT.....

Regards,

Antony.

> ------
> *nat
> -A POSTROUTING -o ppp0 -j MASQUERADE
> COMMIT
>
> *mangle
> COMMIT
>
> *filter
> -A INPUT -i ppp0 -p icmp -j ACCEPT
>
> # disabling not established and not related connections
> -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> -A INPUT -i ppp0 -j DROP
>
> :INPUT ACCEPT [0:0]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [0:0]
>
> COMMIT

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the list;
                                                           please don't CC me.


