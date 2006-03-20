From: Nilesh <niluforalways@yahoo.com>
Subject: Re: port forwarding form IP range
Date: Mon, 20 Mar 2006 01:39:08 -0800 (PST)
Message-ID: <20060320093908.25886.qmail@web50506.mail.yahoo.com>
References: <20060320065441.60459.qmail@web50503.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060320065441.60459.qmail@web50503.mail.yahoo.com>
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
To: Nilesh <niluforalways@yahoo.com>, Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

Dear All,

Anyone please help me out.

Regards
Nilesh

--- Nilesh <niluforalways@yahoo.com> wrote:

> Hi Rob
> Sorry Rob and team I couldnot send you the Output of
> IPTABLES because I was on the Vactions Now I am back
> to work.
> 
> also I have attached the my rc.firewall file 
> Please help me to forward request on 192.168.0.3 
> here is the Output 
> 
> 
> [root@bugtrack rc.d]# iptables -nvL
> Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out    
> source 
>              destination
>     0     0 ACCEPT     all  --  lo     *      
> 0.0.0.0/0            0.0.0.0/0
>   604 99765 ACCEPT     all  --  eth1   *      
> 192.168.0.0/24       0.0.0.0/0
>     0     0 drop-and-log-it  all  --  ppp0   *      
> 192.168.0.0/24       0.0.0.0/0
>   917  830K ACCEPT     all  --  ppp0   *      
> 0.0.0.0/0            59.95.10.98
>     0     0 ACCEPT     all  --  ppp0   *      
> 0.0.0.0/0            59.95.10.98         state
> RELATED,ESTABLISHED
>    23  1157 drop-and-log-it  all  --  *      *      
> 0.0.0.0/0            0.0.0.0/0
>  
> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out    
> source 
>              destination
>  2075  265K ACCEPT     all  --  ppp0   eth1   
> 0.0.0.0/0            0.0.0.0/0           state
> RELATED,ESTABLISHED
>  3366 4209K ACCEPT     all  --  eth1   ppp0   
> 0.0.0.0/0            0.0.0.0/0
>     0     0 drop-and-log-it  all  --  *      *      
> 0.0.0.0/0            0.0.0.0/0
>  
> Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out    
> source 
>              destination
>     0     0 ACCEPT     all  --  *      lo     
> 0.0.0.0/0            0.0.0.0/0
>     0     0 ACCEPT     all  --  *      eth1   
> 59.95.10.98          192.168.0.0/24
>   736  717K ACCEPT     all  --  *      eth1   
> 192.168.0.0/24       192.168.0.0/24
>     0     0 drop-and-log-it  all  --  *      ppp0   
> 0.0.0.0/0            192.168.0.0/24
>   901  132K ACCEPT     all  --  *      ppp0   
> 59.95.10.98          0.0.0.0/0
>     0     0 drop-and-log-it  all  --  *      *      
> 0.0.0.0/0            0.0.0.0/0
>     0     0 ACCEPT     tcp  --  *      eth0   
> 0.0.0.0/0            0.0.0.0/0           state NEW
> tcp
> dpt:80
>  
> Chain drop-and-log-it (5 references)
>  pkts bytes target     prot opt in     out    
> source 
>              destination
>    23  1157 LOG        all  --  *      *      
> 0.0.0.0/0            0.0.0.0/0           LOG flags 0
> level 6
>    23  1157 REJECT     all  --  *      *      
> 0.0.0.0/0            0.0.0.0/0           reject-with
> icmp-port-unreachable
> [root@bugtrack rc.d]#
> 
> 
> [root@bugtrack rc.d]# iptables -L
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination
> ACCEPT     all  --  anywhere             anywhere
> ACCEPT     all  --  192.168.0.0/24       anywhere
> drop-and-log-it  all  --  192.168.0.0/24      
> anywhere
> ACCEPT     all  --  anywhere             59.95.10.98
> ACCEPT     all  --  anywhere             59.95.10.98
>  
>       state RELATED,ESTABLISHED
> drop-and-log-it  all  --  anywhere            
> anywhere
>  
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
> ACCEPT     all  --  anywhere             anywhere   
>  
>       state RELATED,ESTABLISHED
> ACCEPT     all  --  anywhere             anywhere
> drop-and-log-it  all  --  anywhere            
> anywhere
>  
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
> ACCEPT     all  --  anywhere             anywhere
> ACCEPT     all  --  59.95.10.98         
> 192.168.0.0/24
> ACCEPT     all  --  192.168.0.0/24      
> 192.168.0.0/24
> drop-and-log-it  all  --  anywhere            
> 192.168.0.0/24
> ACCEPT     all  --  59.95.10.98          anywhere
> drop-and-log-it  all  --  anywhere            
> anywhere
> ACCEPT     tcp  --  anywhere             anywhere   
>  
>       state NEW tcp dpt:http
>  
> Chain drop-and-log-it (5 references)
> target     prot opt source               destination
> LOG        all  --  anywhere             anywhere   
>  
>       LOG level info
> REJECT     all  --  anywhere             anywhere   
>  
>       reject-with icmp-port-unreachable
> 
> --- Rob Sterenborg <rob@sterenborg.info> wrote:
> 
> > Please reply back to the list and STOP TOPPOSTING.
> > 
> > On Tue, March 14, 2006 11:33, Nilesh wrote:
> > > Thanks Rob,
> > >
> > > I have tried a lot with this rules but unable to
> > > forward/redirect traffic.
> > > Rob, my question is very simple I want to
> > forward/redirect
> > > traffic coming from IP 192.168.0.10 for
> > 192.168.0.1:3128
> > > to 192.168.0.3:3128
> > 
> > Yes I know what the question is. But if it's so
> > simple, then why doesn't it
> > work already ?
> > 
> > > The detail about network.
> > > We have two Internet service providers.
> > > The scenario is 192.168.0.1 is on my Internet
> > Service
> > > Provider(ISP) 1 and now I have installed second
> > proxy server
> > > on other comp which is 192.168.0.3 on the ISP 2
> > connection.
> > > We have assigned the Ip's to our internal
> machines
> > from range
> > > 192.168.0.4 to 192.168.0.250.
> > > We have some bandwidth upload/download
> limitations
> > on
> > > the ISP 1.
> > > I want to use 192.168.0.3 proxy severs for the
> > some
> > > IP's I have taken example of 192.168.0.10 IP.
> > > The browser settings of 192.168.0.10 comp is
> > > 192.168.0.1:3128
> > >
> > > I want to setup the firewall on the 192.168.0.1
> so
> > the
> > > request coming from 192.168.0.10 for the
> > > 192.168.0.1:3128 will forwarded to IP
> > 192.168.0.3:3128
> > > so he/she will use invisibly the proxy
> > > 192.168.0.3:3128
> > >
> > > could you please help me to solve the problem
> > 
> > The rules I wrote should do what you want to do.
> > 
> > > $ipt -t nat -A PREROUTING -i eth1 -s
> 192.168.0.10
> > \
> > > -p tcp --dport 3128 -j DNAT --to 192.168.0.3
> > 
> > This specifies that packets to 192.168.0.1:3128
> are
> > redirected to 192.168.0.3
> > (same port).
> > 
> > > $ipt -A FORWARD -i eth1 -s 192.168.0.10 \
> > > -d 192.168.0.3 -p tcp --dport 3128 -j ACCEPT
> > 
> > This allows it to happen, but policy is ACCEPT
> > anyway so this rule should
> > actually be of no use (unless another rule blocks
> > it).
> > 
> > If it doesn't work, could you please show us the
> > output of : "iptables -nvL".
> > 
> > 
> > Gr,
> > Rob
> 
=== message truncated ===


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam
protection around 
http://mail.yahoo.com 

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

