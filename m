From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: MARK and ! question
Date: Thu, 26 Jun 2003 16:17:16 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0306261611390.28942-100000@localhost>
References: <3EFB0D17.8030601@is.lg.ua>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EFB0D17.8030601@is.lg.ua>
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
Cc: Sven Schuster <schuster.sven@gmx.de>, netfilter@lists.netfilter.org

Hi Ruslan, Hi Sven,

> > What about using a user-defined chain like this:
> >
> > iptables -t mangle -N setmark
> > iptables -t mangle -A setmark -s ! 193.220.70.0/27 -d 193.220.70.32/27 \
> >         -j RETURN
> > iptables -t mangle -A setmark -s ! 193.108.240.0/22 -d 193.220.70.32/27 \
> >         -j RETURN
> > iptables -t mangle -A setmark -j MARK --set-mark 107
> > iptables -t mangle -A POSTROUTING -j setmark

> Thanks for your reply.
> And can you describe how packet traverses such chain?

I think the ruleset above is wrong: the '!' should not be present here. 
Allow me to explain the packet traversal when the same rules are used, but 
with "!" removed:

iptables -t mangle -N setmark
iptables -t mangle -A setmark -s 193.220.70.0/27 -d 193.220.70.32/27 \
        -j RETURN
iptables -t mangle -A setmark -s 193.108.240.0/22 -d 193.220.70.32/27 \
        -j RETURN
iptables -t mangle -A setmark -j MARK --set-mark 107
iptables -t mangle -A POSTROUTING -j setmark

1. Packet enters POSTROUTING
2. Packet jumps to "setmark" chain
3. Packets having source address matching "193.220.70.0/27" are RETURNed 
   to POSTROUTING
4. Packets having source address matching "193.108.240.0/22" are RETURNed 
   to POSTROUTING
5. (now ONLY packets which do NOT have either of these source addresses 
   are still in the "setmark" chain)
6. All packets (still in the "setmark" chain) are marked with 107
7. Packets fall off the end of the "setmark" chain and return to 
   POSTROUTING (but they are now marked)
8. Packets fall of the end of POSTROUTING and continue through the kernel 
   (presumably to be delivered to a network device)

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


