From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: SNMP and IPTABLES
Date: Sat, 2 Aug 2003 14:28:14 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308021426450.16350-100000@localhost>
References: <16310247835.20030802130551@o2.pl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <16310247835.20030802130551@o2.pl>
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
To: netfilter_user <netfilter_user@o2.pl>
Cc: netfilter@lists.netfilter.org

Hello netfilter_user,

> BUT: the problem is when MRTG try to receive SNMP information from this
> same machine that is installed ( MRTG is installed on Linux machine -
> gateway). I dont know why because i set: iptables -A INPUT -i eth1 -p tcp -m multiport --dport 21,80,161,3128 -j ACCEPT
>                                          iptables -A INPUT -i eth1 -p udp -m multiport --dport 80,67,161 -j ACCEPT
>                               ...and it should resolve problem...but
>                               it wont
> 
> !!!!!THIS IS IMPORTANT!!!!
> when I set all INPUT ACCETP then it works. So there is no problem with
> snmp and MRTG but with my iptables config :/

The kernel will route packets for the local machine over the "lo" device, 
not any ethernet interface. You haven't allowed packets in from the "lo" 
device, which is why SNMP (and probably other things such as pinging 
yourself) won't work.

  iptables -I INPUT -i lo -j ACCEPT

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


