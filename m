From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: MARK and ! question: one more question
Date: Fri, 27 Jun 2003 10:38:17 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0306271035100.28942-100000@localhost>
References: <3EFBFA7F.3080304@is.lg.ua>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EFBFA7F.3080304@is.lg.ua>
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

> Can you help me to construct logic: (from src1 OR from src2) AND 
> dst=some_dst_addr THEN mark packet with 108
> Possible form: (from src1 OR from src2 OR from src3 OR ... and so on) 
> AND dst=some_dst_addr THEN mark packet with 108

That's easy:

iptables -

iptables -t mangle -N setmark
iptables -t mangle -A setmark -j MARK --set-mark 107
iptables -t mangle -A POSTROUTING -s src1 -d dst1 -j setmark
iptables -t mangle -A POSTROUTING -s src2 -d dst1 -j setmark
iptables -t mangle -A POSTROUTING -s src3 -d dst1 -j setmark

> Can you give me an example with above networks? - i mean packets with
> (src=193.220.70.0/27 or with src=193.108.240.0/22) and 
> dst=193.220.70.32/27 will be marked with 108.

Just substitute whatever addresses you want into the above.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |




