From: Mark Seamans <marks@crvinc.com>
Subject: Re: Core Linux Router - NO NAT
Date: Fri, 21 Mar 2003 05:16:43 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303210516.43482.marks@crvinc.com>
References: <200303201723.50161.marks@crvinc.com> <200303210140.48570.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200303210140.48570.netfilter@newkirk.us>
Content-Disposition: inline
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
To: netfilter@newkirk.us, netfilter@lists.netfilter.org


So, this will allow all routing between all interfaces to all networks but 
only allowing host 1.2.3.4 have access to ssh?
See!  I was going to make it too hard.  I do appreciate the tip.  I will be 
doing this on a production box for an ISP 1600 miles away with little room 
for error.

-----Original Message-----
On Thursday 20 March 2003 06:23 pm, Mark Seamans wrote:
> I have a Linux router that consists of 4 T1ports and 1 ethernet.
> This "Router" will act as an ISP core router doing Routing Only!
> I wish to protect the box itself, while it preforms it's duties as a
> Router allowing only ssh from the ip's that I wish for management.
> This way I can also setup rules to protect it form DOS attacks etc...
> Now I have been thinking of this, but I can go two ways:
> 1.  Making it harder than it really is  -OR-
> 2.  Allowing it to be so easy it is not secure.
>
> So any suggestions would be great.
>
> Thanks!
>
> Mark
> marks@crvinc.com

For the basic task of restricting access to the routing box itself, and
allowing only SSH connections from designated IPs:

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -N SSHLOG
iptables -A SSHLOG -j LOG --log-level debug --log-prefix "Router SSH
Access:"
iptables -A SSHLOG -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -s a.b.c.d -j SSHLOG
{repeat last rule as needed for different authorized IPs}

Another approach might be to have only one or two IPs from which you
allow SSH connections.  Then if you need to connect from a remote
client, SSH to the authorized client, (an admin box at the office?) then
SSH from that client to the router.  (I use this approach to SSH to my
home desktop - which cannot be directly reached from the internet - by
first initiating an SSH session to my gateway from one of the IPs from
which IT will accept an SSH connection)

If your usage will permit, you can match more closely in the INPUT rules
by also restricting to input on a particular interface.  This is made
more likely if you use the double-SSH approach above, the main reason I
mentioned it.

You can change /etc/syslog.conf to add a new target like:
kern.=debug	/var/log/firewall
or even set it up for remote logging with
kern.=debug	@remotelogginghostname
(this would make it much harder for someone who has compromised the box
to cover their tracks, and would require an additional OUTPUT rule
ACCEPTing UDP dport 514 to the designated logging host)

j


