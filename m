From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Core Linux Router - NO NAT
Date: Fri, 21 Mar 2003 01:41:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303210140.48570.netfilter@newkirk.us>
References: <200303201723.50161.marks@crvinc.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200303201723.50161.marks@crvinc.com>
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
To: Mark Seamans <marks@crvinc.com>, netfilter@lists.netfilter.org

On Thursday 20 March 2003 06:23 pm, Mark Seamans wrote:
> I have a Linux router that consists of 4 T1ports and 1 ethernet.
> This "Router" will act as an ISP core router doing Routing Only!
> I wish to protect the box itself, while it preforms it's duties as a
> Router allowing only ssh from the ip's that I wish for management.=20
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

For the basic task of restricting access to the routing box itself, and=20
allowing only SSH connections from designated IPs:

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -N SSHLOG
iptables -A SSHLOG -j LOG --log-level debug --log-prefix "Router SSH=20
Access:"
iptables -A SSHLOG -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -s a.b.c.d -j SSHLOG
{repeat last rule as needed for different authorized IPs}

Another approach might be to have only one or two IPs from which you=20
allow SSH connections.  Then if you need to connect from a remote=20
client, SSH to the authorized client, (an admin box at the office?) then=20
SSH from that client to the router.  (I use this approach to SSH to my=20
home desktop - which cannot be directly reached from the internet - by=20
first initiating an SSH session to my gateway from one of the IPs from=20
which IT will accept an SSH connection)=20

If your usage will permit, you can match more closely in the INPUT rules=20
by also restricting to input on a particular interface.  This is made=20
more likely if you use the double-SSH approach above, the main reason I=20
mentioned it.

You can change /etc/syslog.conf to add a new target like:
kern.=3Ddebug=09/var/log/firewall
or even set it up for remote logging with=20
kern.=3Ddebug=09@remotelogginghostname
(this would make it much harder for someone who has compromised the box=20
to cover their tracks, and would require an additional OUTPUT rule=20
ACCEPTing UDP dport 514 to the designated logging host)

j


