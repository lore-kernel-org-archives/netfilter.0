From: <dummy1@gazeta.pl>
Subject: Re: Masquerade stopped working?!?!
Date: Mon, 04 Aug 2003 09:11:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059981113947.ew5.dummy1@gazeta.pl>
References: <Pine.LNX.4.44.0308031716270.8771-100000@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0308031716270.8771-100000@localhost>
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

> It is possible that the ISP can recognise packets coming from 
machines in
> your network, by looking at the TTL. As a router, your box should
> decrement the TTL of packets which it forwards, and as a result 
the
> packets which it forwards for the inside machines will have a 
different
> TTL (one less) than if those boxes were directly connected.
> 
> Since Windows and Linux machines have well known "standard" TTLs, 
it's
> possible to use this to block access from machines behind a 
router,
> without blocking access for the router itself.
> 
> You can try using the TTL target of iptables to re-increment the 
TTL, so
> that it appears as though those boxes were directly connected, 
with such
> a rule:
> 
>   iptables -t mangle -A POSTROUTING -o <external-interface> \
>  -j TTL --ttl-inc 1
> 
> But if you have Windows boxes on your network, they will still 
have a
> different TTL to packets from your Linux box (I think), and once 
again the
> ISP can be aware that more than one machine is in use. So it might 
be
> better to use the TTL target to lock the TTL to some fixed value:
> 
>   iptables -t mangle -A POSTROUTING -o <external-interface> \
>  -j TTL --ttl-set 64
> 
> where 64 appears to be the default for Linux boxes (at least with 
a 2.4
> kernel, as mine has).

That's the case. Command
iptables -t mangle -A POSTROUTING -o eth0 -j TTL --ttl-set 64
solved the problem.

After all I have done some tests and it seems that ISP is searching
for TCP/UDP packets for which TTL field differ from 64 or 128.
I have tested that my linux box TTL is 64 and on local machines
running Windows XP TTL is 128.

My ISP is a small company so they are not worth to mention who they 
are. I tried to find what OS is running on the ISP machine using 
nmap, but I found nothing. I want to know what kind of software they 
are running (if not just iptables). I will try to get some 
informations.

Thanks to everybody





