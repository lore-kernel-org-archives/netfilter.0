From: "Javier Govea" <jgovea@magma.ca>
Subject: Re: Round Robin Load Balancing
Date: Mon, 28 Jul 2003 17:14:48 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307282114.h6SLEmbF011519@webmail1.magma.ca>
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
To: Chris Wilson <chris@netservers.co.uk>, Javier Govea <jgovea@magma.ca>
Cc: Daniel Chemko <dchemko@smgtec.com>, George Vieira <georgev@citadelcomputer.com.au>, netfilter@lists.netfilter.org, Ramin Dousti <ramin@cannon.eng.us.uu.net>, netfilter@lists.netfilter.org

Hi guys,

Thanx for all your suggestions, but i have bad news. The rules you guys are suggesting 
make a lot of sense to me but they don't work. My hosts still cannot surf the net. 

This rule:

iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to-source <ip-of-ppp0>

is another form for the masquerade rule:

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

Using either of these two rules my hosts can access internet, but i still have the 
problem of the load balancing. Some ppp links are used more than others in situations 
such as loading the same web page in four different browsers.

As soon as i add the "nth" rules to the mangle table my browsers stop working, they just 
can contact the web servers and eventually they time out. I'm not sure if by adding any 
rule to my mangle table the browsers stop, but at least they stop when i add your 
suggestions to the mangle table.

Any other ideas, suggestions, tips?? all are very welcome...
Thanx to all, i really appreacite all your time and interest....
Xavier


> 
> Try something like this:
> 
> iptables -t mangle -A POSTROUTING -m nth --every 4 --packet 0 \
> 	-j ROUTE --oif ppp0
> iptables -t mangle -A POSTROUTING -m nth --every 4 --packet 1 \
>         -j ROUTE --oif ppp1
> ...
> 
> iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to-source <ip-of-ppp0>
> iptables -t nat -A POSTROUTING -o ppp1 -j SNAT --to-source <ip-of-ppp1>
> ...
> 
> Cheers, Chris.
> -- 
>    ___ __     _
>  / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
> / (_ / ,\/ _/ /_ \ | NetServers.co.uk <a 
href='http://www.netservers.co.uk'>http://www.netservers.co.uk</a> |
> \ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |
> 
> 
> 

