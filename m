From: David Cannings <lists@edeca.net>
Subject: Re: Redirecting ports on localhost
Date: Tue, 30 Mar 2004 14:00:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403301400.15110.lists@edeca.net>
References: <40696C1A.5080400@personalsoft.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40696C1A.5080400@personalsoft.com.br>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Tuesday 30 March 2004 13:46, Fabiano Bonin wrote:
> I need to access this service from other hosts through ETH0 interface
> (ip 192.168.0.254). The other hosts are in the same network.
> I already enabled "NF_NAT_LOCAL" kernel option (btw, all netfilter
> options are enabled in my kernel), and the commands i'm using are
> these:

NF_NAT_LOCAL is for NAT'ing connections that originate on the local 
machine (ie the netfilter machine).  I don't believe it will do what you 
want though I may be incorrect.

> iptables -F
> iptables -F -t nat
> iptables -A OUTPUT -t nat -p tcp -o lo -d 192.168.0.254 --dport 5050 -j
> REDIRECT --to-ports 5050
> echo "1" > /proc/sys/net/ipv4/ip_forward

I don't think you need anything special to do this however your rule says 
"any packets going out on loopback to 192.168.0.254".  The only machine 
on your network that would send packets to 192.168.0.254 on loopback is 
the machine with that IP itself.

Can you not make that daemon listen on an interface IP as well as 
127.0.0.1?  This way other hosts could connect to 192.168.0.254:5050.  
Other hosts that try to access port 5050 on your machine will simply come 
through the INPUT chain, no NAT needed.  If you can't, or don't want to 
for good reason, I am sure it would be possible with DNAT. 

Perhaps I misunderstand what you are trying to accomplish, apologies if 
so.

David

