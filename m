From: "Javier Govea" <jgovea@magma.ca>
Subject: RE: Round Robin Load Balancing
Date: Sat, 26 Jul 2003 14:21:37 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307261821.h6QILbOg023303@webmail1.magma.ca>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: George Vieira <georgev@citadelcomputer.com.au>, Daniel Chemko <dchemko@smgtec.com>, Javier Govea <jgovea@magma.ca>, Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org

Ok guys, I was finally able to compile and install the NTH patch. But, it's not working
for me...does anybody use it before succesfully???? 

Here is again what i'm trying to do:
In my linux box i'm trying to masquerade some traffic comming from my LAN. The traffic is
masqueraded before it is forwarded on 4 ppp links to my ISP. I want to load balance my
traffic on my ppp links. By using the NTH patch, if in one of my hosts i open two browsers
at the same time, then none of them can load any web page!! if i open only one browser
then it is able to load a web page (but very slowly). 

I'm not sure if NTH does not work well with the masquerade target (has anybody use NTH and
Masquerade succesfully????) or if i'm applying the wrong rule (below are my rules) or if
just the NTH patch doesn't really work....

any ideas or suggestions are all very welcome....

Here are my rules:

iptables -t nat -A POSTROUTING -m nth --every 4 --packet 0 -o ppp0 -j MASQUERADE
iptables -t nat -A POSTROUTING -m nth --every 4 --packet 1 -o ppp1 -j MASQUERADE
iptables -t nat -A POSTROUTING -m nth --every 4 --packet 2 -o ppp2 -j MASQUERADE
iptables -t nat -A POSTROUTING -m nth --every 4 --packet 3 -o ppp2 -j MASQUERADE

and this the default route i'm setting up with iproute2

ip route add default nexthop via 192.168.100.101 dev ppp0 weight 1 \
                     nexthop via 192.168.100.101 dev ppp1 weight 1 \
                     nexthop via 192.168.100.101 dev ppp2 weight 1 \
                     nexthop via 192.168.100.101 dev ppp3 weight 1 

thanx to all
X


On Jul 18, "George Vieira" <georgev@citadelcomputer.com.au> wrote:
> 
> It's the NTH patch. he he p-o-m.. 
> 
> Thanks,
> ____________________________________________
> George Vieira
> Systems Manager
> georgev@citadelcomputer.com.au
> 
> Citadel Computer Systems Pty Ltd
> <a href='http://www.citadelcomputer.com.au'>http://www.citadelcomputer.com.au</a>
>  
> 
> -----Original Message-----
> From: Daniel Chemko [mailto:dchemko@smgtec.com]
> Sent: Friday, July 18, 2003 8:37 AM
> To: Javier Govea; Ramin Dousti
> Cc: netfilter@lists.netfilter.org
> Subject: RE: Round Robin Load Balancing
> 
> 
> There is an extension that says something like every N packets, execute
> this rule. I forgot what it was called though.. *doh*
> 
> 

