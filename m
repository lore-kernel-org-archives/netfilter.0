From: Daniel Chemko <dchemko@smgtec.com>
Subject: Re: Round Robin Load Balancing
Date: Sat, 26 Jul 2003 23:49:34 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F2375FE.3050901@smgtec.com>
References: <200307261821.h6QILbOg023303@webmail1.magma.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200307261821.h6QILbOg023303@webmail1.magma.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Javier Govea <jgovea@magma.ca>
Cc: George Vieira <georgev@citadelcomputer.com.au>, Ramin Dousti <ramin@cannon.eng.us.uu.net>, netfilter@lists.netfilter.org

Yeah, it is wrong...

#1. Only perform this on state 'new' packets. After that, let snat take 
care of making sure they go through the right interface.

#2. You need the 'route' patch as well..
The rules that you define will only work if the packets are going to the 
correct interface to begin with. To allow every 4th CONNECTION to travel 
through each interface as you described below, you might want to try:

iptables -t nat -A POSTROUTING -m nth --every 4 --packet 0 -m state --state new -m route --oif ppp0
iptables -t nat -A POSTROUTING -m nth --every 4 --packet 1 -m state --state new -m route --oif ppp1
iptables -t nat -A POSTROUTING -m nth --every 4 --packet 2 -m state --state new -m route --oif ppp2
iptables -t nat -A POSTROUTING -m nth --every 4 --packet 3 -m state --state new -m route --oif ppp2


As described earier, this does not guarantee 100% load balancing, but it 
will help.

>I'm not sure if NTH does not work well with the masquerade target (has anybody use NTH and
>Masquerade succesfully????) or if i'm applying the wrong rule (below are my rules) or if
>just the NTH patch doesn't really work....
>
>any ideas or suggestions are all very welcome....
>
>Here are my rules:
>
>iptables -t nat -A POSTROUTING -m nth --every 4 --packet 0 -o ppp0 -j MASQUERADE
>iptables -t nat -A POSTROUTING -m nth --every 4 --packet 1 -o ppp1 -j MASQUERADE
>iptables -t nat -A POSTROUTING -m nth --every 4 --packet 2 -o ppp2 -j MASQUERADE
>iptables -t nat -A POSTROUTING -m nth --every 4 --packet 3 -o ppp2 -j MASQUERADE
>  
>


