From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: Chains policy and rules
Date: Mon, 28 Jul 2003 10:09:22 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0307281007190.11112-100000@localhost>
References: <87969271865366.03228@send3.inner-21cn.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <87969271865366.03228@send3.inner-21cn.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LiMeiYong <jobsli@21cn.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On Mon, 28 Jul 2003, LiMeiYong wrote:

> /sbin/iptables -F
> /sbin/iptables -A INPUT -p tcp -d 192.168.1.165 --dport 80 -i eth2 -j ACCEPT
> /sbin/iptables -A INPUT -p tcp -d 192.168.1.165 --dport 22 -i eth2 -j ACCEPT
> /sbin/iptables -A INPUT -p tcp -d 152.201.3.179 --dport ! 80 -i eth0 -j ACCEPT
> /sbin/iptables -A INPUT -p tcp -d 152.201.3.179 --dport ! 22 -i eth0 -j ACCEPT
> /sbin/iptables -A INPUT -p tcp -d 152.201.3.177 --dport ! 80 -i eth0 -j ACCEPT
> /sbin/iptables -A INPUT -p tcp -d 152.201.3.177 --dport ! 22   -i eth0 -j ACCEPT
> /sbin/iptables -A INPUT -p tcp -d 152.20.3.181 --dport ! 80 -i eth1 -j ACCEPT
> /sbin/iptables -A INPUT -p tcp -d 152.20.3.181 --dport ! 22 -i eth1 -j ACCEPT
> /sbin/iptables -P INPUT DROP
> 
>     I think both of them shoud do the same things. Yes it does work. But when I use the second group, the connection to 192.168.1.165:80 become very slow. The same thing happend on ssh connection to 192.168.1.165. If I use the first group command, everything is normal! Who can tell me why this happend? What's the difference between droping packets on the chain and droping packets on every ethernet card?
>     Thanks a million to you who answer this question.

You forgot to allow traffic in from the loopback interface (lo). Without 
this, if you have e.g. 127.0.0.1 in your /etc/resolv.conf, it will not 
work (you will get a long wait while DNS times out). If you have another 
resolver, the lookup will probably succeed when it tries that one, but 
after a long delay waiting for the local name server.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


