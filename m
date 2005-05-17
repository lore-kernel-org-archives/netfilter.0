From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Host blocking
Date: Tue, 17 May 2005 11:06:28 -0500
Message-ID: <428A1684.2040804@riverviewtech.net>
References: <003b01c55acb$841114a0$f00aa9c0@winxp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <003b01c55acb$841114a0$f00aa9c0@winxp>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> Our ISP's Proxy server is proxy.ISP.net , our company's own proxy server 
> is proxy.ourcompany.net. Our own proxy server has delay_pool but our ISP 
> proxy server dont have. I want to control our client to use only our 
> company proxy server. how can I block the proxy.ISP.net using IP tables 
> so that every body can be force to use our compnay proxy server. (note 
> that our company proxy server is connected to our ISP proxy server as 
> cache_peer parent)

If you want to block just proxy.ISP.net you could do a simple filter in the filter table FORWARD chain.  However I think you are really asking for a solution that will prevent your users from using ANY proxy other than your companies proxy.  As such I have included what I am using here at my office:

# I am creating a new (sub)chain so that I have to do fewer comparisons and thus speeding things up.
iptables -t nat -N Proxy_Bypass_Attempt
iptables -t nat -A Proxy_Bypass_Attempt -j LOG --log-prefix "Proxy Bypass Atempt:  "
iptables -t nat -A Proxy_Bypass_Attempt -p tcp -j DNAT --to-destination ${My_Proxy_Server_IP}:${My_Proxy_Server_Port}
# We will need to SNAT any traffic that attempted to bypass the proxy so that it will get back to the client correctly.
iptables -t nat -A POSTROUTING -o ${LAN} -s ${LAN_Subnet} -d ${My_Proxy_Server_IP} -p tcp --dport ${My_Proxy_Server_Port} -j SNAT --to-source ${My_Firewall_IP}
# Let's jump to the Proxy_Bypass_Attempt chain if this looks like web traffic.
iptables -t nat -A PREROUTING -i ${LAN} -s ! ${My_Proxy_Server_IP} -p tcp --dport 80 -j Proxy_Bypass_Attempt
# We will need to allow traffic to froward from our LAN back out to it's self as any proxy bypass attempt traffic will fall in to this catigory.
iptables -t filter -A FORWARD -i ${LAN} -o ${LAN} -j ACCEPT

Note:  I am presently not blocking port 443 but I think it would be easy to do such with this example.  You could probibly just use the -m mport match by replacing the rule in the PREROUTING chain that jumps to the Proxy_Bypass_Attempt chain as such:

# Let's jump to the Proxy_Bypass_Attempt chain if this looks like web traffic.
iptables -t nat -A PREROUTING -i ${LAN} -s ! ${My_Proxy_Server_IP} -p tcp -m mport --source-ports 80,443 -j Proxy_Bypass_Attempt

- Or (if you do not have mport match extension support) -

# Let's jump to the Proxy_Bypass_Attempt chain if this looks like web traffic.
iptables -t nat -A PREROUTING -i ${LAN} -s ! ${My_Proxy_Server_IP} -p tcp --dport 80 -j Proxy_Bypass_Attempt
iptables -t nat -A PREROUTING -i ${LAN} -s ! ${My_Proxy_Server_IP} -p tcp --dport 443 -j Proxy_Bypass_Attempt



Grant. . . .

