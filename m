From: "Eric Poulin" <deejays@darkstorm.ca>
Subject: Re: nat table not working with 'iptables -L nat'
Date: Fri, 25 Apr 2003 09:21:29 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09f901c30b2d$9627f220$c565a8c0@lvl.digidyne.ca>
References: <002001c30923$1a65a440$0100a8c0@yogi>
Reply-To: "Eric Poulin" <epoulin@onepost.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Stuart Clark <elmhurst@spacelink.com.au>
Cc: netfilter@lists.netfilter.org

Try "iptables -t nat -L" or "iptables -t nat -nvL"

The default table is Filter, so when you do iptables -L, in reality, iptables
execute "iptables -t filter -L . The Prerouting/Postrouting rules of the nat
table must be accessed using iptables -t nat...

Eric

----- Original Message -----
From: "Stuart Clark" <elmhurst@spacelink.com.au>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, April 22, 2003 7:01 PM
Subject: nat table not working with 'iptables -L nat'


> Hi
>
> When I try and add a rule to the nat table it seems to work but when I
> do 'iptables -L nat' I get the error
>
> 'iptables: Table does not exist (do you need to insmod?)'
>
> All the other tables are there when I do 'iptables -L' but no nat table.
>
> How can I get this working?
>
> I don't want to recompile the kernel
>
> Machine Specifications
>
> Pentium2, 266Mhz
> 64meg Ram
> Redhat 7.3
> iptables-1.2.5-3.rpm
>
>
> Here is my module config
>
> #
> # 2.1 Required modules
> #
>
> /sbin/modprobe ip_tables
> /sbin/modprobe ip_conntrack
> /sbin/modprobe iptable_filter
> /sbin/modprobe iptable_mangle
> /sbin/modprobe iptable_nat
> /sbin/modprobe ipt_LOG
> /sbin/modprobe ipt_limit
> /sbin/modprobe ipt_state
> /sbin/modprobe ip_nat_ftp
>
> #
> # 2.2 Non-Required modules
> #
>
> #/sbin/modprobe ipt_owner
> #/sbin/modprobe ipt_REJECT
> /sbin/modprobe ipt_MASQUERADE
> /sbin/modprobe ip_conntrack_ftp
> #/sbin/modprobe ip_conntrack_irc
> #/sbin/modprobe ip_nat_irc
>
>
>
>
>


