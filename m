From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: MARK and ! question
Date: Thu, 26 Jun 2003 16:40:31 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0306261637250.28942-100000@localhost>
References: <3EFB13B6.7080100@is.lg.ua>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EFB13B6.7080100@is.lg.ua>
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
To: Ruslan Spivak <alienoid@is.lg.ua>
Cc: netfilter@lists.netfilter.org

Hi Ruslan,

> Sorry for disturbance, but one more question: it looks like all other 
> packets not from
> 
> 193.220.70.0/27 and not from 193.108.240.0/22 will be marked, but i need
> mark packets that have destination 193.220.70.32/27 and not from above
> mentioned networks. What else should i add or modify?

Sorry, it looks like the ruleset is still wrong. Try this one:

iptables -t mangle -N setmark
iptables -t mangle -A setmark -s   193.220.70.0/27  -j RETURN
iptables -t mangle -A setmark -s   193.108.240.0/22 -j RETURN
iptables -t mangle -A setmark -d ! 193.220.70.32/27 -j RETURN
iptables -t mangle -A setmark -j MARK --set-mark 107
iptables -t mangle -A POSTROUTING -j setmark

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


