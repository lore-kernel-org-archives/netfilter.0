From: Damian Gatabria <damian_g@speedy.com.ar>
Subject: Re: iptables dnat to loopback
Date: Mon, 09 Aug 2004 22:29:29 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1092101369.7615.5.camel@localhost>
References: <D5C9032B2B09C64EA2409D6214E91AC905124D@asimail2.alphanumeric.com>
 <1091945878.12669.0.camel@localhost> <200408080941.38256.lists@edeca.net>
 <200408081350.12149.Alistair@nerdnet.ca> <1092062432.7056.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <1092062432.7056.3.camel@localhost>
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
To: Lista Netfilter <netfilter@lists.netfilter.org>


> > 	Okay --- 
> > 	   If I'm following this thread correctly then, 
> > 	
> > 	we need two rules to manage this ... both Destination and Source Natting 
> > these packets ... 
> > 	My question is ..... 
> > 	As I understand things DNAT is done in PREROUTING and SNAT is done in 
> > POSTROUTING .. 
> > 
> > 	I can setup 
> > 	
> > 	iptables -I PREROUTING -t nat -p TCP -s 192.168.0.2 -d 10.1.105.45 --dport \ 
> > 3306 -j DNAT --to 127.0.0.1
> > and (since nat postrouting FOLLOWS nat prerouting) 
> > 	iptables -I POSTROUTING -t nat -p TCP -s 192.168.0.2 -d 127.0.0.1 --dport \ 
> > 3306 -j SNAT --to 127.0.0.1
> > 
> > 	But I don't belive that this will solve the above problem of the /drop 
> > martians/ behaviour.
> > 
> > 	Any comments folks?
> > 
> > 	Alistair Tonner
> 
> I'll try this when i get home, on my frankenstein box. I'll post
> back later today.
> 
> Thank you all who replied.

Hmm.. well, it looks like David Cannings was right after all. The kernel
will not allow me to do this.. strange. I would have thought it should
be possible somehow... 

Thank you all very much. It was a very informative thread.


-- 
Damian Gatabria <damian_g@speedy.com.ar>


