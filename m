From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: can someone check this simple firewall?
Date: Thu, 14 Aug 2003 12:01:13 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308141159370.31438-100000@localhost>
References: <1060856335.1717.82.camel@kermit>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1060856335.1717.82.camel@kermit>
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
To: Ralf Spenneberg <lists@spenneberg.org>
Cc: Payal Rathod <payal-iptables@staticky.com>, Netfilter <netfilter@lists.netfilter.org>

Hi Ralf, hi Payal,

> 2. You should never see any packets coming from 127.0.0.1 going to any
> other IP-address than 127.0.0.1.

I don't believe that to be the case. I think that any communication from 
the machine back to itself, addressed to any of its IP addresses, will be 
routed over the loopback interface rather than any Ethernet or other 
device. 

> To allow localhost traffic just do
> iptables -A INPUT -i lo -j ACCEPT
> iptables -A OUTPUT -o lo -j ACCEPT

But these rules are correct.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


