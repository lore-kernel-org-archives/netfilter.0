From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Performance Problems with iptables
Date: Fri, 25 Oct 2002 15:40:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210251440.g9PEe8e06169@vulcan.rissington.net>
References: <1035554619.24039.28.camel@ITS-Sevcik>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1035554619.24039.28.camel@ITS-Sevcik>
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

On Friday 25 October 2002 3:03 pm, Berndt Sevcik wrote:

> Hello!
>
> I am using a combination of iproute2 (source based routing) and iptables
> (NAT Iptables Version 1.2.6a-5).

What does the -5 on your iptables version number mean ?   I don't believe 
this is part of any official release of netfilter.

Also, are you really using source-based routing ?   I can't see anything 
except a single standard default route in your iproute2 commands.

> NAT Config:
> iptables -t nat -A POSTROUTING -p ip -s 10.0.0.0/8 -j SNAT --to
> 212.17.100.114

Why are you specifying -p ip in these rules ?   I'm not saying this is the 
reason for the problem, but it's a bit unusual....

> The problem is that I have big
> performance problems. The maximum download speed per user is about 5kb.
> We can only use our existing line to the ISP by about 20%, and thats not
> an ISP problem.

Okay, what happens if you remove either iproute2 or netfilter from the 
situation to see if either of those is causing the problem ?   I don't see 
why it should be, but a simple test should be to connect to some server from 
your firewall machine, download a big file and note the speed, then repeat 
the same thing without any iproute2 rules in place and see if there's a 
difference.   Then flush your netfilter rules and use something simple like

iptables -P OUTPUT ACCEPT
iptables -P INPUT DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

to allow anything out, and allow replies back in, then repeat the download 
test.

If you get any significant difference in performance between the three tests, 
it should tell you where the problem is.

If you don't, then the problem's not with iproute2 or netfilter.

What's the load on your box running netfilter ?   (ie what load average do 
you see from uptime for example ?)   What (total) bandwidth do you have to 
your ISP, and what (total) transfer rate are you actually getting ?

Antony.

-- 

Most people have more than the average number of legs.

