From: Feizhou <feizhou@linuxmail.org>
Subject: Re: Is this firewall good enough?
Date: Tue, 08 Jun 2004 17:42:30 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40C58A06.8020509@linuxmail.org>
References: <20040608091436.84113.qmail@web14712.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040608091436.84113.qmail@web14712.mail.yahoo.com>
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
To: Sagara Wijetunga <sagaralists@yahoo.com>
Cc: netfilter@lists.netfilter.org


>4.  DNS server
>2.  /sbin/iptables -A INPUT -p tcp -m state --state
>ESTABLISHED,RELATED -j ACCEPT
>  
>

Forget about this. It makes things easier yes but it is too slow if you 
come under attack...but then you put everything on one box seemly so I 
guess you don't get much traffic.

> <>7. /sbin/iptables -A INPUT -p tcp --dport 53 --syn -j ACCEPT #DNS

Where's the udp rule?

> <>1. Does this effectively offer connections ONLY to the
> services I offer and nothing more than that?

It does not open dns udp. Why do you have ssh open to the world?

> <>
> 2. Does the rule 2 create any security loophole?

Performance issues are probable.

> <>
> 4. Is this firewall good enough to protect the server?
> If no, could you kindly comment how could I improve
> further?

Why do you have ssh open to the world?

The second thing is, make sure you run secure software like djb's 
publicfile for your ftp service (example only) for the firewall ain't 
gonna protect you if you have exploitable software on the service ports.

