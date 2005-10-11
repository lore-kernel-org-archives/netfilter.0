From: Ignatich <ignatich@gmail.com>
Subject: Re: owner based routing
Date: Wed, 12 Oct 2005 02:46:22 +0400
Message-ID: <213204906.20051012024622@gmail.com>
Reply-To: Ignatich <ignatich@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

> The mangle table OUTPUT chain is consulted before routing.
>
> root@room101:~# iptables -vt mangle -A OUTPUT -m owner --uid-owner rob0 -j MARK --set-mark 0x80
> MARK  all opt -- in * out *  0.0.0.0/0  -> 0.0.0.0/0  OWNER UID match 1000 MARK set 0x80
>
> Did you try this?

Yes, i overlooked this. Thank you very much, it solved my problem.

-- 
 Ignatich                          mailto:ignatich@gmail.com


