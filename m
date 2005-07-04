From: Christoph Georgi <christoph.georgi@web.de>
Subject: Re: help me
Date: Mon, 04 Jul 2005 22:47:15 +1200
Message-ID: <42C913B3.8010202@web.de>
References: <20050704103908.15589.qmail@web53106.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050704103908.15589.qmail@web53106.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: umar draz <umar_draz@yahoo.com>
Cc: Mr NetFilter <netfilter@lists.netfilter.org>

make the default policy of the incoming chain (input) drop, but allow 
established and related traffic, and allow all outgoing traffic by 
setting the default policy to allow for the output chain (although it's 
adviced to specify the outgoing traffic further..)

# drops all traffic
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD DROP

# allow established an related incoming traffic
$IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT


christoph


umar draz wrote:
> hi dear members!
> 
>   i have one interface card in my linux machine <eth0>
> 
>   now i attache DSL modem with this interface now i
> want block all incoming traffic.
> 
> but i want i can access every thing.
> 
> how i can do it
> 
> regards
> 
> Umar Draz
> 
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam protection around 
> http://mail.yahoo.com 
> 
> 

-- 


Christoph Georgi
-----------------------------
email.  christoph.georgi@web.de
fon.	+64 (0)9 815 8259

registered linux user #380268
ubuntu 5.04 (ubuntu.com)

