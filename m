From: Sagara Wijetunga <sagaralists@yahoo.com>
Subject: Re: Is this firewall good enough?
Date: Wed, 9 Jun 2004 01:36:12 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040609083612.4209.qmail@web14711.mail.yahoo.com>
References: <40C5D53A.9060407@linuxmail.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40C5D53A.9060407@linuxmail.org>
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

--- Feizhou <feizhou@linuxmail.org> wrote:
> Antony Stone wrote:
> > How do you recommend dealing with reply packets
> instead?
> 
> I would create multiple chains
> 
> iptables -N tcp_packets and so on.
> 
> So to avoid loading the connection tracking module,
> I would put rules to 
> handle return packets in the proper chain.
> 
> eg: iptables -A tcp_packets -p tcp --sport
> 1024:65535 --dport 80 -j ACCEPT
> 
Do we have to worry at all on --sport? Our concern is
our server ports only, isn't it?

Don't we have to include --syn in above rule?

How do we accept udp connection requests on a given
destination port(ie. equivalent to --syn)?

> Then i put tcp/udp/icmp packets to the proper chain
> 
> eg: iptables -A INPUT -p tcp -j tcp_packets
> 
> You could make a catch all for return packets like:
> 
> iptables -A INPUT -p tcp ! --syn -j ACCEPT
> 
Can we consider it is either ESTABLISHED or RELATED
any packet other than --syn packet receiving on INPUT
chain?  Or how do we write rule/s equivalent to
ESTABLISHED and RELATED?

Appreciate your comment on this issue.

Sagara


	
		
__________________________________
Do you Yahoo!?
Friends.  Fun.  Try the all-new Yahoo! Messenger.
http://messenger.yahoo.com/ 

