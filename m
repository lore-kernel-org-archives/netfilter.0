From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Not forwarding?
Date: Sun, 28 Mar 2004 21:48:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403282148.46815.Antony@Soft-Solutions.co.uk>
References: <20040328155231.32b07799@darna.vectec.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040328155231.32b07799@darna.vectec.net>
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

On Sunday 28 March 2004 8:52 pm, Cody Harris wrote:

> Here's my setup:
> My filewall has eth0 and eth1. 0 is ethe net and 1 is my ssh box. Eth0 is
> 10.30.7.147 and Eth1 is 192.168.0.1...Eth1 is connected to Eth0 on the
> other box...192.168.0.2.
>
> We have found out ssh isn't forwarding properly. What's the deal?

1. Is any other protocol being forwarded correctly?

2. What does "cat /proc/sys/net/ipv4/ip_forward" return?

3. What do you mean by "properly"?   Does ssh work at all?  Sometimes?   From 
some machines?   Only for a certain time, then stops?   What?

> This is my firewall setup:
>
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
> ACCEPT     all  --  anywhere             anywhere
> ACCEPT     icmp --  anywhere             anywhere           icmp echo-reply
> ACCEPT     icmp --  anywhere             anywhere           icmp
> destination-unreachable ACCEPT     icmp --  anywhere             anywhere  
>         icmp redirect ACCEPT     icmp --  anywhere             anywhere    
>       icmp echo-request ACCEPT     icmp --  anywhere             anywhere  
>         icmp time-exceeded ACCEPT     tcp  --  anywhere            
> 192.168.0.2        tcp dpt:ssh

4. Sorry for the way my mailer has mangled your rules, however please post the 
output from "iptables -L FORWARD -nvx" (the v is important as it shows the 
interface data which is not in the standard listing output).

5. How are you testing the setup?

Regards,

Antony.

-- 
If at first you don't succeed, destroy all the evidence that you tried.

                                                     Please reply to the list;
                                                           please don't CC me.


