From: Roberto Nibali <ratz@drugphish.ch>
Subject: Re: ip_conntrack module, advanced routing and multiple ISP
Date: Tue, 16 Sep 2003 13:30:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F66F471.5070009@drugphish.ch>
References: <MGEFIJGLOCLFFKBKAFEPGEDIEHAA.mt.netfilter@comelis.fr>
Reply-To: ratz@tac.ch
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <MGEFIJGLOCLFFKBKAFEPGEDIEHAA.mt.netfilter@comelis.fr>
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
To: Matthieu Turpault <mt.netfilter@comelis.fr>, netfilter@lists.netfilter.org

Matthieu Turpault wrote:
> Who can share his opinion on this matter?
> 
> Receiving *no answer at all* usually means one of 2 things:

I doubt it in this case.

> 1) extremely ignorant question, not even worth a lousy RTFM reply :-(
> 2) brilliant question, nobody ever came up with such a marvelous idea :-)

<OT>
3) most people don't get paid to do support on MLs, so they choose which
    reports they want to reply to; yours seems complicated a first sight
    so most people don't bother reading it through.
4) the question maybe is not asked in an intelligent way
5 ...) <add reasons yourself>
</OT>

>>	I have a firewall with 4 NIC:
>>		- 3 interfaces connected to the net (eth2, eth3, eth5) by
>>		    3 ISP;
>>		- 1 interface connected to the internal network.
>>
>>	eth2 is connected to a router (10.0.1.1) which does masquerading.
>>
>>	Outcoming request (from the internal network to the net) are load
>>	 balanced to the 3 ISP (cf my configuration at the end of the mail).
>>
>>	All incoming request from the net to internal network by port
>>	 http, pop3, imap, ftp, smtp, https are correctly routed.

Ok.

>>	All outcoming request from the internal network to the net by
>>	 port http, pop3, imap are correctly routed.

Ok

>>	The problem is that I can't connect from the internal network to
>>	 a ftp server of the net. In fact, I can connect to a ftp server
>>	 of the net but the "ls" command failed the most of the time (1/3).
>>	 I use passive mode.

I suspect it's a persistency problem due to the nature of how ftp works.

>>     If I add the route by the command
>>	  ip route add <@ftpServer> via <@GATEWAY_ISP2>
>>	  it is OK

Yes, this could be a persistency problem. You're doing your load 
balancing on L3 with the iproute framework. Unfortunately the current 
routing implementation to date has (AFAIK) no means to provide 
persistency for connections.

>>[root@firewall firewall]# ip route list
>><@NETMASK_ISP2>/30 dev eth5  proto kernel  scope link  src <@ISP2>
>>10.0.3.0/30 dev eth5  scope link
>>10.0.1.0/24 dev eth2  scope link
>>10.1.0.0/24 dev eth0  scope link
>><@NETMASK_ISP3>/24 dev eth3  scope link
>>127.0.0.0/8 dev lo  scope link
>>default
>>        nexthop via 10.0.1.1  dev eth2 weight 1 onlink
>>        nexthop via <@GATEWAY_ISP2>  dev eth5 weight 1 onlink
>>        nexthop via <@GATEWAY_ISP3>  dev eth3 weight 1 onlink

Those lines could be the culprit. When you connect to an ftp server you 
might go over one line, then for the DATA connection you will go over 
the other and thus you'll confuse netfilter. But I haven't looked at 
your whole configuration as I do not have enough time.

A tcpdump session will most probably reveil the real problem to you. If 
not, add -j LOG statements to your packet filter configuration and 
figure out where the packets sink through your mesh of rules.

HTH and best regards,
Roberto Nibali, ratz


