From: "Michael K" <micke@klintan.se>
Subject: RE: Accept icmp-type destination-unreachable with limit
Date: Mon, 31 Mar 2003 01:47:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000c01c2f716$b9fde2c0$0200a8c0@klintan.local>
References: <001401c2f56f$94a40f70$0200a8c0@klintan.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001401c2f56f$94a40f70$0200a8c0@klintan.local>
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



> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Michael K
> Sent: Friday, March 28, 2003 10:19 PM
> To: netfilter@lists.netfilter.org
> Subject: Accept icmp-type destination-unreachable with limit
> 
> 
> Is this a good rule? According to
> http://www.robertgraham.com/pubs/firewall-seen.html#8.1 It's a good
> thing to accept this icmp type 3 and 4. But now the firewall 
> is open for
> dos attacks. So I thought I put a limit to the rule. 
> iptables -A INPUT -p ICMP --icmp-type destination-unreachable \
> 	-m limit --limit 10/minute --limit-burst 5 -j ACCEPT
> iptables -A INPUT -p ICMP --icmp-type source-quench -j ACCEPT
> 
> If I had a personal firewall allowing some ports out and then allowing
> everything in that is established and related for all 
> protocols. Then I
> don't need the icmp type 3 and 4 for the input, right?
> Something like this.
> 
> iptables -A OUTPUT -p TCP -m multiport --dports 20,21,25,53,80,110,443
> -j ACCEPT
> iptables -A OUTPUT -p UDP --dport 53 -j ACCEPT
> iptables -A OUTPUT -p ICMP --icmp-type echo-request -j ACCEPT
> iptables -A OUTPUT -p UDP 33434:33523 -j ACCEPT
> iptables -A INPUT -p ALL -m state --state RELATED,ESTABLISHED 
> -j ACCEPT
> 
> Btw: Is this a good (and short) firewall allowing most common internet
> protocols and utilities? Any comments on above?
> 
> /Klintan
> 
> 
Is there no comments on this?

/Klintan



