From: Feizhou <feizhou@linuxmail.org>
Subject: Re: Is this firewall good enough?
Date: Tue, 08 Jun 2004 23:03:22 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40C5D53A.9060407@linuxmail.org>
References: <20040608091436.84113.qmail@web14712.mail.yahoo.com> <40C58A06.8020509@linuxmail.org> <200406081057.40137.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406081057.40137.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

Antony Stone wrote:
> On Tuesday 08 June 2004 10:42 am, Feizhou wrote:
> 
> 
>>>2.  /sbin/iptables -A INPUT -p tcp -m state --state
>>>ESTABLISHED,RELATED -j ACCEPT
>>
>>Forget about this. It makes things easier yes but it is too slow if you
>>come under attack...but then you put everything on one box seemly so I
>>guess you don't get much traffic.
> 
> 
> How do you recommend dealing with reply packets instead?

I would create multiple chains

iptables -N tcp_packets and so on.

So to avoid loading the connection tracking module, I would put rules to 
handle return packets in the proper chain.

eg: iptables -A tcp_packets -p tcp --sport 1024:65535 --dport 80 -j ACCEPT

Then i put tcp/udp/icmp packets to the proper chain

eg: iptables -A INPUT -p tcp -j tcp_packets

You could make a catch all for return packets like:

iptables -A INPUT -p tcp ! --syn -j ACCEPT

