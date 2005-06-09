From: Damon Gray <dgray@internap.com>
Subject: Re: --policy DROP kills everything?
Date: Thu, 9 Jun 2005 14:36:12 -0400 (EDT)
Message-ID: <Pine.LNX.4.62.0506091426590.14790@dgray-test.acs.internap.com>
References: <B80488675062364A909EE60F4A666038078EEA9E@usilms23.ca.com>
	<Pine.LNX.4.60.0506091359050.9191@darkstar.sysinfo.com>
	<42A888C4.20006@edoceo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42A888C4.20006@edoceo.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: David Busby <busby@edoceo.com>
Cc: netfilter@lists.netfilter.org


It might help if you could send the output of ifconfig (or ip addr show) 
and iptables -nvL. This output isn't showing what interfaces you are 
applying these rules to.

On Thu, 9 Jun 2005, David Busby wrote:

> R. DuFresne wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>> 
>> 
>> We found that in a 1:1 nat setup the policy for the forward chain has to be 
>> accept or traffic will not flow.
>> 
>> Thanks,
>> 
>> Ron DuFresne
>
> My box only has rules in the INPUT chain, doesn't do IP forwarding/routing at 
> all.
> I have these rules below:
>
> Chain INPUT (policy DROP)
> target     prot opt source               destination
> ACCEPT     all  --  127.0.0.0/8          0.0.0.0/0
> ACCEPT     udp  --  192.168.42.1         0.0.0.0/0           udp dpt:53
> ACCEPT     udp  --  192.168.42.1         0.0.0.0/0           udp dpt:123
> ACCEPT     udp  --  192.168.42.1         0.0.0.0/0           udp dpt:514
> ACCEPT     tcp  --  0.0.0.0/0            192.168.42.2        tcp dpt:22
> ACCEPT     tcp  --  0.0.0.0/0            192.168.42.2        tcp dpt:80
> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state 
> RELATED,ESTABLISHED
> LOG        all  --  0.0.0.0/0            0.0.0.0/0           LOG flags 0 
> level 4
>
> An cannot make new connections to port 22 or port 80, I see it in the logs.
> An existing ssh connection will stay if I connect with no rules then run 
> iptables-restore.
> This seems totally odd to me.  The UDP traffic is also blocked.  Everyone is 
> telling me that these rules should work, new connections should be allowed 
> and such but it's not the case.  Here's what my modules look like:
>
> imperium root # lsmod
> Module                  Size  Used by
> ipt_LOG                 6272  1
> ipt_state               1472  1
> ip_conntrack           39860  1 ipt_state
> iptable_filter          2944  1
> ip_tables              16320  3 ipt_LOG,ipt_state,iptable_filter
>
> So everything looks loaded OK too, but it's not working, I even added this 
> rule:
>
> ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state NEW tcp 
> dpt:22
> ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state NEW tcp 
> dpt:80
>
> But still cannot make a new connection to port 22 or 80, what gives?  What do 
> I try now?
>
> /djb
>
>
>

