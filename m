From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: open ports
Date: Sun, 16 May 2004 10:43:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405161043.06615.Antony@Soft-Solutions.co.uk>
References: <BAY15-F39o5AUUYgqms00067882@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F39o5AUUYgqms00067882@hotmail.com>
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

On Sunday 16 May 2004 10:22 am, azeem ahmad wrote:

> hi all
> i have a LAN environment. users from LAN connect to internet via my linux
> box. on this box iptables firewall runs. what ports should i open to allow
> users to get all the services like all chat rooms and yahoo, msn messengers
> and browsing http/ftp etc

1. Start with the following ruleset

iptables -P FORWARD DROP
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -j LOG

2. Get one of your LAN machines to attempt a connection to something you want 
to be allowed (eg: web borwsing).

3. Look at the LOG entries to see what packets tried to get through the 
firewall (just before DROPped by the default policy).

4. Add a rule, between the two rules given above, to allow that type of 
traffic (eg: for web browsing:
iptables -I 2 FORWARD -i $intIF -p tcp --dport 80 -j ACCEPT)

5. Read one of the networking tutorials from http://www.netfilter.org to get a 
better understanding of what network protocols should always be allowed (eg: 
both types of DNS), and how to find out what port numbers etc are used by the 
services you want to allow through the system.

Regards,

Antony.

-- 
If you can't find an Open Source solution for it, then it isn't a real 
problem.

                                                     Please reply to the list;
                                                           please don't CC me.


