From: Jason Opperisano <opie@817west.com>
Subject: Re: port 80 to port 3128
Date: Thu, 16 Dec 2004 06:30:57 -0500
Message-ID: <1103196656.13025.31.camel@hubcap.ljm.dom>
References: <8b9d168b968c.8b968c8b9d16@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8b9d168b968c.8b968c8b9d16@vsnl.net>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 2004-12-16 at 03:36, varun_saa@vsnl.net wrote:
> Hello,
>       My server is on Mandrake 10.10ff.
> 
> eth0 is WAN with static IP connected to 512Kbps DSL.
> 
> eth1 is LAN.
> 
> Using webmin - networking - Linux firewall, I have done a NAT on eth0.
> 
> After I did NAT on eth0 I see that all clients can access straight away
> the internet without any settings. Is it Ok ?
> 
> Next I would like to use packet filter and redirect all port 80
> to port 3128. I have tried as follows :
> 
> accept - If protocol is TCP and input interface is eth1 and destination port is 3128  
>          and source port is 80

you need to use the REDIRECT target--the rule you have won't do it.  i
don't know anything about doing this through webmin--the actual rule is:

  iptables -t nat -A PREROUTING -i eth1 -p tcp --syn --dport 80 \
    -j REDIRECT --to-port 3128

you'd also need an INPUT rule to accept the traffic that's redirected to
the proxy:

  iptables -A INPUT -i eth1 -p tcp --syn --dport 3128 -j ACCEPT

and an output rule to allow the proxy to go fetch content:

  iptables -A OUTPUT -o eth0 -p tcp --syn --dport 80 -j ACCEPT

and a rule that allows the proxy to resolve DNS:

  iptables -A OUTPUT -o eth0 -p udp --dport 53 -j ACCEPT

and all of this assumes that you are using connection tracking in all
your chains:

  iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
  iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
  iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

dunno if this is of any help w/o the webmin instructions--but this is
what needs to happen "under the hood" as they say...

-j

--
"You must be stupider than you look!
 Stupider like a fox!"
	--The Simpsons


