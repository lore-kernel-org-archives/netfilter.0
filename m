From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: SSL Question
Date: Fri, 1 Aug 2003 15:58:39 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308011555120.31382-100000@localhost>
References: <20030729224958.57764.qmail@web41303.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030729224958.57764.qmail@web41303.mail.yahoo.com>
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
To: nakisawame <nakisawame@yahoo.com>
Cc: netfilter@lists.netfilter.org

Hi Nakisawame,

> Can I do something like this:
> 
> iptables -t nat -A PREROUTING -p tcp -d 55.55.55.56
> --dport https -j DNAT --to 192.168.0.14:443
> iptables -t nat -A PREROUTING -p tcp -d 55.55.55.57
> --dport https -j DNAT --to 192.168.0.15:443
> 
> Does this work? If it doesn't, how do I do this? This
> is driving me nuts!

This should definitely work. If it doesn't, it's probably because either 
you forgot to turn on IP forwarding
(echo 1 > /proc/sys/net/ipv4/ip_forward), or you haven't added a 
corresponding filter rule to allow the traffic through:

  iptables -t filter -I FORWARD -d 192.168.0.14 -p tcp --dport 443 \
	-j ACCEPT
  iptables -t filter -I FORWARD -d 192.168.0.15 -p tcp --dport 443 \
        -j ACCEPT

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


