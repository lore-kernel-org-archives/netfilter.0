From: Eric Leblond <regit@inl.fr>
Subject: Re: how to match connection tracker's flows?
Date: Wed, 03 Nov 2004 20:05:29 +0100
Message-ID: <1099508729.24863.6.camel@porky>
References: <20041103181718.GA16850@oasis.frogfoot.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041103181718.GA16850@oasis.frogfoot.net>
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

On Wed, 2004-11-03 at 20:17 +0200, Abraham van der Merwe wrote:
> Hi!
> 
> If I add
> 
> # rules to track ftp
> iptables -t mangle -A POSTROUTING -p tcp -j CONNMARK --restore-mark
> iptables -t mangle -A POSTROUTING -p tcp -m mark ! --mark 0 -j RETURN

If packet are marked they return so leave mangle, so if CONNMARK works
leave mangle.

> # a rule to see how much ftp traffic is matched
> iptables -t mangle -A POSTROUTING -m mark --mark 2

This line is never reached if CONNMARK works.

BR,
-- 
Eric Leblond <regit@inl.fr>


