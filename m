From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: DNAT question..
Date: Thu, 24 Jul 2003 10:42:38 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0307241040530.20694-100000@localhost>
References: <200307241556.53796.rio@martin.mu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200307241556.53796.rio@martin.mu>
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
To: "Rio Martin." <rio@martin.mu>
Cc: netfilter@lists.netfilter.org

Hi Rio,

> > You need to SNAT internal connections so that replies go via the
> > firewall instead of directly to the client, otherwise the firewall
> > cannot reverse the DNAT and the client drops the reply packet.
> > Try this rule:
> > iptables -t nat -A POSTROUTING -p tcp -s 192.168.1.0/24 -d 192.168.1.2
> > --dport 80 -j SNAT --to 192.168.1.1
> 
> i dont know, i tried but it still wont connect to webserver.
> Connection Refused.

Is it possible that an earlier rule in the POSTROUTING chain is overriding 
this one? Could you try:

	iptables -t nat -I POSTROUTING -s 192.168.1.0/24 -d 192.168.1.2
		-p tcp --dport 80 -j MASQUERADE

If that doesn't work, please send your ruleset (iptables -L -n -v; 
iptables -t nat -L -n -v) and tcpdump of packets on the internal interface 
of your firewall when you try to connect.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


