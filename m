From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: External only Nat?
Date: Fri, 15 Aug 2003 17:06:17 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308151704350.31438-100000@localhost>
References: <43605.199.89.234.122.1060962952.squirrel@mail.seaplace.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <43605.199.89.234.122.1060962952.squirrel@mail.seaplace.org>
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
To: kevinc@seaplace.org
Cc: netfilter@lists.netfilter.org

Hi Kevin,

> What I'd like to do is NAT mangle packets ONLY when they are destined for
> the Internet (e.g. my default gateway box) and not when they are destined
> for other boxes in my public address space.
> 
> I currently use the well-exampled command:
> 
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

Try these two rules:

  iptables -t nat -A POSTROUTING -o eth0 -d <public-subnet> -j ACCEPT
  iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

This should prevent masquerading to your public subnet, but allow it to 
all other destinations on your external interface.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


