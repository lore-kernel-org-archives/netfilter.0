From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: REDIRECT question
Date: Wed, 2 Jul 2003 12:01:04 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0307021159470.16552-100000@localhost>
References: <3F02BA55.1030504@is.lg.ua>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F02BA55.1030504@is.lg.ua>
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

> i want make transaparent proxy on localhost and want to disabe access 
> after redirecting to port 3128 if destination address in net other then 
> 193.108.240.0/22.
> Does REDIRECT target send packet to INPUT chain and i should disable 
> access in INPUT chain or should i disable access in '-t nat -A 
> POSTROUTING' chain?

You will not be able to disable access in the POSTROUTING chain, since 
after reading the REDIRECT rule, no further rules in that chain are 
processed. In any case, it is not recommended to filter in the nat table. 
The best place to put your filtering rule is in the INPUT chain.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


