From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: block ports
Date: Mon, 16 Sep 2002 08:46:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020916074619.KCJK295.mta06-svc.ntlworld.com@there>
References: <200209161226.11945@.>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200209161226.11945@.>
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

On Monday 16 September 2002 8:02 am, PayalR wrote:

> Hi all,
> I have a stupid question. I want to have incoming internet access for only
> port 22, 25, 80 and 110. How do I go abut it?
> I thought of this rule first,
>
> #iptables -A INPUT -i eth0 -p tcp --dport ! 22 -j DROP
>
> and go for the other ports as well. But my problem is that if a packet
> arrives from port 110, it will be checked for rule 1 above and since it is
> not for port 22 it will be dropped disregarding the next rules. Right?

Right.

The recommended way to configure a firewall is "block everything except what 
you want to allow".   Therefore do this:

iptables -P INPUT DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 25 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 110 -j ACCEPT

I recommend the ESTABLISHED, RELATED rule to make sure that things like ICMP 
get through as well.

Antony.

-- 

Documentation is like sex:
when it's good, it's very very good;
when it's bad, it's still better than nothing.

