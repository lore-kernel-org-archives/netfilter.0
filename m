From: "Javier Govea" <jgovea@magma.ca>
Subject: RE: Round Robin Load Balancing
Date: Tue, 29 Jul 2003 11:38:50 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307291538.h6TFcoTU026061@webmail1.magma.ca>
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
To: George Vieira <georgev@citadelcomputer.com.au>, Javier Govea <jgovea@magma.ca>
Cc: netfilter@lists.netfilter.org

Hi guys,

Well, i tried with only the SYN packets (my rules are below) and still nothing. My hosts
cannot access the net. Any more ideas??? 

Here are are my rules (if they are wrong, please correct me):

iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to-source <ip-of-ppp0>
...

iptables -t mangle -A POSTROUTING -m nth --every 4 --packet 0 -p tcp --syn \
	-j ROUTE --oif ppp0
...

Thanx...
Xavier



On Jul 29, "George Vieira" <georgev@citadelcomputer.com.au> wrote:
> 
> probably because you should be doing that on the SYN packet ONLY.. not on any packet
because it'll send 1 connection across multiple interfaces...
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
> From: Javier Govea [mailto:jgovea@magma.ca]
> Sent: Tuesday, July 29, 2003 7:15 AM
> To: Chris Wilson; Javier Govea
> Cc: Daniel Chemko; George Vieira; netfilter@lists.netfilter.org; Ramin
> Dousti; netfilter@lists.netfilter.org
> Subject: Re: Round Robin Load Balancing
> 
> 
> Hi guys,
> 
> Thanx for all your suggestions, but i have bad news. The rules you guys are suggesting 
> make a lot of sense to me but they don't work. My hosts still cannot surf the net. 
> 
> This rule:
> 
> iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to-source <ip-of-ppp0>
> 
> is another form for the masquerade rule:
> 
> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> 
> Using either of these two rules my hosts can access internet, but i still have the 
> problem of the load balancing. Some ppp links are used more than others in situations 
> such as loading the same web page in four different browsers.
> 
> As soon as i add the "nth" rules to the mangle table my browsers stop working, they just 
> can contact the web servers and eventually they time out. I'm not sure if by adding any 
> rule to my mangle table the browsers stop, but at least they stop when i add your 
> suggestions to the mangle table.
> 
> Any other ideas, suggestions, tips?? all are very welcome...
> Thanx to all, i really appreacite all your time and interest....
> Xavier
> 
> 
> > 
> > Try something like this:
> > 
> > iptables -t mangle -A POSTROUTING -m nth --every 4 --packet 0 \
> > 	-j ROUTE --oif ppp0
> > iptables -t mangle -A POSTROUTING -m nth --every 4 --packet 1 \
> >         -j ROUTE --oif ppp1
> > ...
> > 
> > iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to-source <ip-of-ppp0>
> > iptables -t nat -A POSTROUTING -o ppp1 -j SNAT --to-source <ip-of-ppp1>
> > ...
> > 
> > Cheers, Chris.
> > -- 
> >    ___ __     _
> >  / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
> > / (_ / ,\/ _/ /_ \ | NetServers.co.uk <a 
> href='<a href='http://www.netservers.co.uk&#39;&gt;<a
href='http://www.netservers.co.uk&lt;/a&gt;'>http://www.netservers.co.uk</a></a>'>http://www.netservers.co.uk'><a
href='http://www.netservers.co.uk&lt;/a&gt;'>http://www.netservers.co.uk</a></a></a> |
> > \ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |
> > 
> > 
> > 
> 
> 

