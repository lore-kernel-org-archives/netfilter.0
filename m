From: "james.Q.L" <shijialeeee@yahoo.ca>
Subject: Re: problem reach the internal.
Date: Fri, 29 Nov 2002 20:03:48 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021130010348.58897.qmail@web14507.mail.yahoo.com>
References: <20021129193240.1051.qmail@web14502.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021129193240.1051.qmail@web14502.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

sorry, i forgot mention that the request from outside my local network to the INET_IP:8888 is
fine. only the internal request to it fails.

i do not see what is wrong in the rules, anyone ? 



 --- "james.Q.L" <shijialeeee@yahoo.ca> wrote: > hi,
> 
> i have access to my firewall ip at port 8888 forward to port 80 at internal machine 192.168.0.3
> .
> but the connection always fail. can someone help me debug ? thanks.
> 
> 
> [root@cozy166 public]#iptables -L --line-number -n
> Chain INPUT (policy ACCEPT)
> num  target     prot opt source               destination         
> 1    REJECT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:6000 reject-with
> tcp-reset 
> 
> Chain FORWARD (policy DROP)
> num  target     prot opt source               destination         
> 1    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          state RELATED,ESTABLISHED 
> 2    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          
> 3    ACCEPT     tcp  --  0.0.0.0/0            192.168.0.3        tcp dpt:80 
> 4    LOG        all  --  0.0.0.0/0            0.0.0.0/0          LOG flags 0 level 4 
> 
> Chain OUTPUT (policy ACCEPT)
> num  target     prot opt source               destination         
> 
> Chain drop-and-log-it (0 references)
> num  target     prot opt source               destination         
> 1    DROP       all  --  0.0.0.0/0            0.0.0.0/0          
> 
> [root@cozy166 public]#iptables -L --line-number -n -t nat
> Chain PREROUTING (policy ACCEPT)
> num  target     prot opt source               destination         
> 1    DNAT       tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:8888 to:192.168.0.3:80 
> 
> Chain POSTROUTING (policy ACCEPT)
> num  target     prot opt source               destination         
> 1    SNAT       tcp  --  192.168.0.0/24       192.168.0.3        tcp dpt:80 to:192.168.0.1 
> 2    MASQUERADE  all  --  0.0.0.0/0            0.0.0.0/0          
> 
> Chain OUTPUT (policy ACCEPT)
> num  target     prot opt source               destination         
> 
> the rules i added to try to make it work are :
> 
> iptables -t nat -A PREROUTING -p tcp -i eth1 --dport 8888 \
> 	-j DNAT --to-destination 192.168.0.3:80
> iptables -A FORWARD -p tcp --dport 80 -d 192.168.0.3 -j ACCEPT
> iptables -t nat -A POSTROUTING -p tcp -s 192.168.0.0/24 -d 192.168.0.3 --dport 80 -j SNAT \ 
>         --to-source 192.168.0.1

=====
/James.Q.L

______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca

