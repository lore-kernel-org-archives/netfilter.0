From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: Simple question about ipset
Date: Mon, 25 Sep 2006 04:34:27 +0800
Message-ID: <000701c6e018$d791c790$02bca8c0@freelance>
References: <006701c6dcba$167a4f20$02bca8c0@freelance>
	<Pine.LNX.4.58.0609201549540.31176@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

From: "Jozsef Kadlecsik" <kadlec@blackhole.kfki.hu>
> 
> > I hope my understanding is correct. Perhaps the docs should explain it more
> > clearly.
> 
> Yes, the docs are terse. Patches against the docs are (also) always
> welcomed.
> 

If my understanding is correct ( which I am still not very sure at this moment ),
perhaps may I suggest the syntax be changed such that only one flag is 
allowed ( and necessary ) and the value can be 'dst', 'src', or 'both' ?

  eg,
             iptables -A FORWARD -m set --set servers dst -j ACCEPT
             iptables -A FORWARD -m set --set servers src -j ACCEPT
             iptables -A FORWARD -m set --set servers both -j ACCEPT

                or if the keyword 'both' is left out, it is then implied :-
 
           iptables -A FORWARD -m set --set servers -j ACCEPT

The nature of relationship is that it will be hard to form a meaningful
relationship where the flags could be heterogeneous, so why don't
just implement a simplied syntax ?

Cheers

 



