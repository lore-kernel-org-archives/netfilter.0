From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: DNAT question..
Date: Thu, 24 Jul 2003 15:15:10 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0307241510310.20694-100000@localhost>
References: <3F1FDDFB.469242E1@goyaike.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F1FDDFB.469242E1@goyaike.com>
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
To: "Gonzalez, Federico" <fgonzalez@goyaike.com>
Cc: Rio Martin <rio@martin.mu>, Netfilter <netfilter@lists.netfilter.org>

Hi Federico,

>    I think the problem is in the destination IP address, you have to use the
> external IP, so i think the rule should be:
> 
> iptables -t nat -A POSTROUTING -p tcp -s 192.168.1.0/24 -d 211.1.1.10
>    --dport 80 -j SNAT --to 192.168.1.1

I don't think that's true in this case. As far as I know, after the
destination address has been rewritten in PREROUTING, all subsequent hooks
(FORWARD and POSTROUTING) will see the new destination address, not the
original. But please correct me if I'm wrong.

[By the way, you sent your reply to me, not to Rio or the Netfilter list.]

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |



