From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Tarpit usage question
Date: Fri, 13 May 2005 10:12:31 -0500
Message-ID: <4284C3DF.3060102@riverviewtech.net>
References: <57F9959B46E0FA4D8BA88AEDFBE58290738C@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE58290738C@pxtbenexd01.pxt.primeexalia.com>
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

> Ex.  The firewall external IP is 22.33.44.1 and I also assign 2-6 to the
> firewall and NAT them in locally to 10.0.0.2-6 accordingly.  With this
> said, if I setup the rules below on the raw table I'm assuming that it
> will only be caught on the 22.33.44.1 IP.  Is this assumption wrong or
> should I also qualify the addresses that I care about on the raw table.
> 
> iptables -t raw -A INPUT -d 22.33.44.55 -p tcp --dport 22 -j ACCEPT
> iptables -t raw -A INPUT -d 22.33.44.55 -p tcp --dport 443 -j ACCEPT
> iptables -t raw -A INPUT -d 22.33.44.55 -p tcp -j NOTRACK
> iptables -t filter -A INPUT -p tcp --dport 22 -j ACCEPT
> iptables -t filter -A INPUT -p tcp --dport 443 -j ACCEPT
> iptables -t filter -A INPUT -p tcp -j TARPIT

Well the idea that I was after was that you explicitly handle anything except what you know to (likely) be valid traffic in such a way that it will not be connection tracked and ultimately TARPITed.  Thus if you have multiple valid source IP / port combinations you would want to do a series of ACCEPT targets.

iptables -t raw -A INPUT -d 22.33.44.55 -p tcp --dport 22 -j ACCEPT
iptables -t raw -A INPUT -d 22.33.44.55 -p tcp --dport 443 -j ACCEPT
iptables -t raw -A INPUT -d 22.33.44.55 -p tcp -j NOTRACK
iptables -t raw -A INPUT -d 22.33.44.1 -p tcp --dport 22 -j ACCEPT
iptables -t raw -A INPUT -d 22.33.44.1 -p tcp --dport 443 -j ACCEPT
iptables -t raw -A INPUT -d 22.33.44.1 -p tcp -j NOTRACK
iptables -t raw -A INPUT -d 22.33.44.2 -p tcp --dport 22 -j ACCEPT
iptables -t raw -A INPUT -d 22.33.44.2 -p tcp --dport 443 -j ACCEPT
iptables -t raw -A INPUT -d 22.33.44.2 -p tcp -j NOTRACK
...
iptables -t filter -A INPUT -d 22.33.44.55 -p tcp --dport 22 -j ACCEPT
iptables -t filter -A INPUT -d 22.33.44.55 -p tcp --dport 443 -j ACCEPT
iptables -t filter -A INPUT -d 22.33.44.55 -p tcp -j TARPIT
iptables -t filter -A INPUT -d 22.33.44.1 -p tcp --dport 22 -j ACCEPT
iptables -t filter -A INPUT -d 22.33.44.1 -p tcp --dport 443 -j ACCEPT
iptables -t filter -A INPUT -d 22.33.44.1 -p tcp -j TARPIT
iptables -t filter -A INPUT -d 22.33.44.2 -p tcp --dport 22 -j ACCEPT
iptables -t filter -A INPUT -d 22.33.44.2 -p tcp --dport 443 -j ACCEPT
iptables -t filter -A INPUT -d 22.33.44.2 -p tcp -j TARPIT

Something else that you might want to look in to would be using the set match extension.  The set match extension would be a good match for what you are doing as you can build a ""set of IP addresses, and / or ports, and or <bla> that can be bound together in such a way that you could match all the valid traffic in one rule vs multiple rules.  If you want help looking in to this let me know and I'll be glad to help.



Grant. . . .

