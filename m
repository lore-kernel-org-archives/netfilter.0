From: David Cannings <lists@edeca.net>
Subject: Re: Not forwarding?
Date: Sun, 28 Mar 2004 21:43:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403282143.47746.lists@edeca.net>
References: <20040328155231.32b07799@darna.vectec.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040328155231.32b07799@darna.vectec.net>
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

On Sunday 28 March 2004 20:52, Cody Harris wrote:
> This is my firewall setup:
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
> ACCEPT     all  --  anywhere             anywhere
> ACCEPT     icmp --  anywhere             anywhere           icmp
> echo-reply ACCEPT     icmp --  anywhere             anywhere          
> icmp destination-unreachable ACCEPT     icmp --  anywhere            
> anywhere           icmp redirect ACCEPT     icmp --  anywhere          
>   anywhere           icmp echo-request ACCEPT     icmp --  anywhere    
>         anywhere           icmp time-exceeded ACCEPT     tcp  -- 
> anywhere             192.168.0.2        tcp dpt:ssh
> We have noticed that ssh isn't getting forwarded. What's wrong?

What about the replies from SSH which will come from source port 22?  
Either add a rule to explicitly allow from sport ssh or add an 
ESTABLISHED/RELATED rule in there.

David

