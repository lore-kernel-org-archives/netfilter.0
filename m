From: Jan Humme <jan.humme@xs4all.nl>
Subject: Re: trying to get one blessed thing to work
Date: Mon, 8 Jul 2002 18:56:24 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <02070818562409.14428@Lms>
References: <20020708123223.7107dc16.mt@open2web.com>
Reply-To: jan.humme@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020708123223.7107dc16.mt@open2web.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Mark Tessier <mt@open2web.com>, Netfilter Mailing List <netfilter@lists.samba.org>

On Monday 08 July 2002 18:32, Mark Tessier wrote:
> I have a PC running rh7.1., which I'm trying to turn into a firewall. The
> firewall stands between a DMZ and a LAN. I have an elaborate script which
> I've been trying to deploy, but so far no luck. Since I really don't know
> where to begin in terms of diagnosing my problem, I decided to see if I
> could just ping one machine on the DMZ from another on the LAN.
>
> The first thing I did was to set the policy to drop for the forward chain
> as in:
>
> iptables --policy FORWARD DROP

=> Response on my machine (and yours) is:
iptables v1.2.1a: Unknown arg '--policy'
Try 'iptables -h` or 'iptables --help' for more information.

Suppose you mean:
#iptables -P FORWARD DROP ?


> Next, I tried to open one door on the forward chain, allowing icmp packets
> of the echo request type to ping any other machine as in:
>
> iptables -A FORWARD -o eth0 -p icmp --icmp-type echo-request -s
> 192.168.0.0/24 -m state --state NEW -j ACCEPT

Assuming that this line properly reflects your network configuration, you may 
also want to allow the reply to come in:

#iptables -A FORWARD -i eth0 -p icmp --icmp-type echo-reply -d 192.168.0.0/24 
-j ACCEPT.


In general though, one good way to debug is to look at the firewall machine, 
and use:
=> iptables -Z FORWARD to clear counter
=> do your ping
=> run iptables -L -v -x to inspect counters to see which rule(s) matched and 
caused your packets to be dropped.
=> also tcpdump may help

Jan Humme.

