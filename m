From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: Round Robin Load Balancing
Date: Sun, 27 Jul 2003 19:51:51 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0307271949050.3242-100000@localhost>
References: <200307271740.h6RHeV1F001051@webmail1.magma.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200307271740.h6RHeV1F001051@webmail1.magma.ca>
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
To: Javier Govea <jgovea@magma.ca>
Cc: Daniel Chemko <dchemko@smgtec.com>, George Vieira <georgev@citadelcomputer.com.au>, netfilter@lists.netfilter.org, Ramin Dousti <ramin@cannon.eng.us.uu.net>, netfilter@lists.netfilter.org

Hi Javier,

Try something like this:

iptables -t mangle -A POSTROUTING -m nth --every 4 --packet 0 \
	-j ROUTE --oif ppp0
iptables -t mangle -A POSTROUTING -m nth --every 4 --packet 1 \
        -j ROUTE --oif ppp1
...

iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to-source <ip-of-ppp0>
iptables -t nat -A POSTROUTING -o ppp1 -j SNAT --to-source <ip-of-ppp1>
...

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


