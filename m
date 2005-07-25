From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: iptable for single nic
Date: Mon, 25 Jul 2005 16:54:27 -0500
Message-ID: <42E55F93.8060505@gmx.co.uk>
References: <20050725044840.49586.qmail@web42410.mail.yahoo.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050725044840.49586.qmail@web42410.mail.yahoo.com>
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
To: netfilter <netfilter@lists.netfilter.org>

john decot wrote:
> sorry it was the mistake in this mail. i have used redirect rules with 
> --to-ports 3128 as
>  
> iptables -A PREROUTING -t nat -p tcp -m tcp -i eth0 -s $lan_network_ip 
> -d 0/0 -j REDIRECT --to-ports 3128

Where's the "--dport 80"? I have yet to see one which is perfect. Looks 
like you're going to redirect all TCP traffic from $lan_network_ip to squid.

> but it seems not working again. is anything wrong with my transparent 
> proxy configuration???

Offhand I'd guess so, but since I don't know your whole rule set I 
cannot say for sure. Post your iptables-save(8) output to the list. 
Also, look at "iptables -vt nat -nL" and note the packet counters. 
iptables rules are evaluated in order. If an earlier rule matches these 
packets, this rule you added won't be hit.

> any help..

Troubleshoot it yourself before you post again. Try
"telnet netfilter.org 80" from one of the clients and watch your squid 
logs and check the iptables packet counters. Every attempt to go out on 
port 80 should increment the counter by one, and should be logged in squid.
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

