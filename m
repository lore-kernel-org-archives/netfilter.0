From: Alejandro Flores <alejandro.flores@triforsec.com.br>
Subject: Re: Benchmark
Date: Tue, 13 Jul 2004 18:32:52 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1089754372.6507.19.camel@aflores>
References: <1089752682.6507.7.camel@aflores>
	 <20040713151747.5af1ef20@mgalepc.utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040713151747.5af1ef20@mgalepc.utilitran.com>
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
To: Michael Gale <michael.gale@utilitran.com>
Cc: netfilter@lists.netfilter.org

	Hello Michael,

	Agreed. If well designed, it will improve performance. But, what is the
cost to send a packet to another chain? And if you have something like:
	iptables -A INPUT -i eth0 -p tcp -j C1
	iptables -A C1 -p tcp --dport 22 -j C1_SSH
	iptables -A C1_SSH -s 192.168.0.2/32 -j ACCEPT
	iptables -A C1_SSH -s 192.168.0.7/32 -j ACCEPT
	iptables -A C1_SSH -s 192.168.0.23/32 -j ACCEPT

	When the packet arrives, and it's from 192.168.0.7, it will be handled
by INPUT, then C1 and finally C1_SSH at the second rule. What I'm trying
to discover is, what is the cost to send the packet from one chain to
another. It's more easy to configure and maintain your rules with
user-chains, but how much it will cost in performance, if instead of the
above example, I use the following rules:

iptables -A INPUT -i eth0 -p tcp --dport 22 -s 192.168.0.2/32 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 22 -s 192.168.0.7/32 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 22 -s 192.168.0.23/32 -j ACCEPT


Regards!
Alejandro Flores

> Hello,
> 
> 	Well I am not expert but I think that user chains could improve performance. If you had in total 1000 rules and no user
> chains, a packet may have to go through 999 rules to find a match or no match. If you broke up your 1000 rules into 25
> different user chains a packet would at most have to be matched against 24 user chains and then only be checked against
> required chains and not other rules.
> 
> Michael.
> 
> 
> On Tue, 13 Jul 2004 18:04:43 -0300
> Alejandro Flores <alejandro.flores@triforsec.com.br> wrote:
> 
> > 	Hello there,
> > 
> > 	Well, I've been teaching netfilter/iptables for a while, and always
> > there's someone asking about performance. Normally, they use other kind
> > of firewall, like cisco pix or checkpoint. Is there any benchmark out
> > there?
> > 	Another point is, how much user-chains can degrade the performance?
> > IMHO, user chains are simple the best to help you organize and separate
> > rules in groups. But, how can I measure if it's degrading the
> > performance?
> > 
> > Thanks!
> > Alejandro
> > 
> > Ps. Sorry my poor english!
> > 
> > 
> > 
> > 
> > 
> 

