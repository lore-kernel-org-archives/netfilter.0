From: Mark Anacker <manacker@lot66.com>
Subject: Re: How to redirect browsers with static proxy settings in iptables?
Date: Thu, 22 Jul 2004 16:05:04 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41004820.9010807@lot66.com>
References: <BAY2-F17K8rBKXGA7zy0000775f@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY2-F17K8rBKXGA7zy0000775f@hotmail.com>
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
To: Todd Landfried <tlandfried@hotmail.com>
Cc: netfilter@lists.netfilter.org


How about:

iptables -t nat -A PREROUTING -i eth1 -p tcp -d 68.152.65.65 --dport 80 
-j REDIRECT --to-port 80

You might need to change the "--to-port 80" to "--to-port 8080" if you 
have Squid on that port.


Todd Landfried wrote:
> I'm new to this firewall stuff, so any assistance would be greatly 
> appreciated. I've RTFM as much as I can, but nothing seems to fit this 
> situation exactly. Maybe I'm not asking the questions correctly in Google.
> 
> I have a Linux 7.3 (2.4.20-28) server with two NICs. One is eth0 and 
> connects to the router. The other is eth1 and connects to the switch 
> that connect the computers in the house. We have a couple of laptops 
> that have to have static proxy settings in the browser for work, but 
> it's a royal pain to have to go and unclick the "use proxy" settings all 
> the time. I'm being pressured to find a solution--if you know what I mean.
> 
> Let's say the proxy settings are:
> 
> IP: 68.152.65.65
> Port: 80
> 
> Let's say the internal network is 10.1.0.x. I've also installed squid 
> (2.4.stable6) and I think I have that correct, but it's not working. I 
> may be missing some component, but I'm not sure.
> 
> How do I create a rule that will route the browser traffic through the 
> linux box without having to uncheck the silly checkbox everytime she 
> comes home?
> 
> Any solution or guidance would be appreciated.
> 
> Thnks
> 
> Todd
> 

-- 
Mark Anacker
Chameleon Technology, Inc.

