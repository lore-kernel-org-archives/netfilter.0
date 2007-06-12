From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: ipsec connection problems though netfilter.
Date: Tue, 12 Jun 2007 09:42:14 -0600
Message-ID: <web-18078693@bk3.webmaillogin.com>
References: <466BF725.3010000@systems-pro.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <466BF725.3010000@systems-pro.net>
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
To: Martin Cheatle <marche@systems-pro.net>, netfilter@lists.netfilter.org

Martin:

If the only difference is a fragmentation issue you may want try one of two 
paths:

(a) Allow fragmented packets to pass the firewall -not a good option
(b) Reduce the mtu size of the packets in the device that generates packets 
with a size greater than the mtu value.

By the way, ask your question in the openswan mailing list.

Hope this helps,

Jorge Davila.

On Sun, 10 Jun 2007 14:05:41 +0100
  Martin Cheatle <marche@systems-pro.net> wrote:
> My Network
> 
>               internet
>                  |
>      +----------------------+
>      |                      |
>     eth2                    |
>      |                      |
>  Firewall-eth1-----netB----ISA
>      |
>     eth0
>      |
>     netA
> 
>Firewall Rules
> iptables -t nat -A POSTROUTING -o eth2 -j SNAT --to-source 'external ip 
>address'
> iptables -A FORWARD -i eth0 -o eth2 -m state --state 
>NEW,RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -i eth2 -o eth0 -m state --state RELATED,ESTABLISHED 
>-j ACCEPT
> iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
> iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
> 
> 
> MS/ISA Server listening for ipsec/l2tp on both adapters
> 
> My Problem
> 
> If I connect a MS/XP client to the MS/ISA server via ipsec/l2tp directly 
>from netB or the internet every thing works fine.
> If I try to connect from netA through to netB the client fails to connect.
> If try to connect from netA to the MS/ISA server via the internet address 
>all works ok.
> 
> The only difference in my rules is that the traffic gets NAT'ed on the way 
>out to the internet.
> I have tried NATing the traffic leaving the firewall on eth1 but this did 
>not resolve the issue.
> I have added -m state rules from eth0 to eth1 and back, this did not help.
> 
> The only difference I have seen in the traffic between the connections 
>through the firewall is a ip-fragment between netA and netB during the 
>isakmp stage of the connection both then procced to start ESP traffic.
> 
> Has anyone seen this type of problem before?
> 
> Eventually I do want to remove the ISA server of the internet and route 
>the ipsec/l2tp traffic through the firewall but I can't do that until i can 
>get this bit working.
> 
> Thanks in advance
> Martin
> 
> 

Jorge Isaac Davila Lopez
Nicaragua Open Source
+505 430 5462
davila@nicaraguaopensource.com

