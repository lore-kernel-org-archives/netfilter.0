From: Jason Lunz <lunz@falooley.org>
Subject: Re: DNAT, Is it possible to find the original destination?
Date: Mon, 8 Nov 2004 23:09:53 +0000 (UTC)
Message-ID: <cmouc0$ds2$1@sea.gmane.org>
References: <1099323026.41865692986d5@email.ixwebhosting.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

lumberjack@lumberjackvillage.com said:
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to 8080
>
> Is there any way that my application can look in the table and see the real 
> destination?  I've seen several things in patch-o-matic that do things with 

iirc, doesn't the SO_ORIGDST sockopt (or something like that) tell you
this?

Jason


