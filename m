From: Krystian <optimusprime@o2.pl>
Subject: Re: iptables: invalid arguement with kernel 2.6.5
Date: Tue, 04 May 2004 13:43:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <409781E7.5060301@o2.pl>
References: <002e01c431c7$09cfe910$440997cb@GINA>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002e01c431c7$09cfe910$440997cb@GINA>
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
To: Det Buaklee <det@dss.go.th>
Cc: netfilter@lists.netfilter.org

Det Buaklee wrote:

> Hi
>
>  
>
> I am very new in configuring iptables with bridge software. I want to 
> do a transparent proxy with iptables and squid and running a firewall 
> bridge on the squid box. I have upgraded my kernel to 2.6.5 (to get 
> the firewall-bridge) and I have already tried compiled iptables 1.2.9 
> with the kernel src directory. My problem is when I tried something like
>
>  
>
> /sbin/iptables -A PREROUTING -t mangle -i eth0 -p tcp --dport 80 -j 
> REDIRECT --to-port 8080
>
>  
>
> or
>
>  
>
> /sbin/iptables -t mangle -A PREROUTING -m physdev --physdev-in eth0 -p 
> tcp --dport 80 -j REDIRECT --to-port 8080
>
>  
>
> and iptables just return
>
>  
>
> iptables: invalid argument
>
>  
>
> Any help or pointer to some documents would be much appreciated.
>
>  
>
> Det Buaklee
>
bad table "mangle". try using diffrent for example nat.

