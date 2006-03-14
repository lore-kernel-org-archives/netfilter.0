From: Chinh Nguyen <cnguyen@certicom.com>
Subject: Re: Case concerning iptables filtering traffic from the internet
 in a NATed scenario
Date: Tue, 14 Mar 2006 11:59:50 -0500
Message-ID: <4416F686.7020602@certicom.com>
References: <4416E5B5.3060004@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4416E5B5.3060004@web.de>
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
To: Mattes Opel <mattes.opel@web.de>, netfilter@lists.netfilter.org

Mattes Opel wrote:
> Hello everybody,
> 
> I'm new to this list, so I'm hoping not to break with any rules.
> 
> I've got a case concerning iptables. Please excuse this long posting.
> 
> Before explaining the scenario, here are my questions:
> 1) How do restrict internetworking traffic, which is originated by
> /destinated to the internet to a machine. Please read on, because it's
> sounds simple but is something special for me.
> 
> The main problem is, that I can access the hosts only remote. A mistake
> would hurt very much.

In which case, you might want to test out iptables rules on a local setup first.

> The question to answer for solving the problem:
> How do I indentify a packets sourced by machine a) destinated to
> anywhere, which have to got through the router?
> 
> And the other way around:
> How do I indentify packets destinated to machine a) sourced from
> anywhere, which have passed the router?
> 
> Further a possibility to filter those packets in a second stage by
> protocol or port would be fine?
> 
> AND don't forget the administrator's access:
> How do I identify packets, which where forwarded by the router. See c)
> in the secanrio description.

My two cents. Please refer to disclaimer above :). I am assuming you want rules
on machine A.

1. Internet-bound packets machine A should be filtered by a not source rule (or
simply accepted).
2. Replies coming back filtered by connection state (and possibly router MAC if
paranoid).
3. Administrative packets filtered by port (and possibly router MAC if paranoid).

1. -A OUTPUT -d ! 192.168.1.0/24 -j ACCEPT (or simply -A OUTPUT -j ACCEPT)
2. -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT (you could add -m mac
--mac-source $ROUTER_MAC to rule)
3. -A INPUT [-d ! 192.168.1.0/24] --protocol tcp --dport $ADMIN_PORT -j ACCEPT
(you could add -m mac --mac-source $ROUTER_MAC to rule)

